import unittest
from pathlib import Path
import re

from build import instruction, relational_aliases, symbols


BUILD = Path(__file__).resolve().parents[2] / 'build/tinybasic/banked'


def dispatch_register(image, command):
    start = symbols(BUILD / 'shared.sym')['TAB1'] - 0x1000
    table = image[2048 + start:2048 + 0x6D0]
    index = table.index(command.encode('ascii')) + len(command)
    pc = int.from_bytes(table[index:index + 2], 'big') & 0x7FFF
    runtime = symbols(BUILD / 'boot.sym')['RUNTIME'] - 0x1000

    def byte(address):
        if 0x3D00 <= address < 0x3E80:
            return image[runtime + address - 0x3D00]
        return image[address - 0x1000]

    accumulator, register = 0, 0
    for _ in range(8):
        # G_JUMP starts by saving ISAR and selecting jump mode.
        if bytes(byte(pc + i) for i in range(5)) == bytes.fromhex('0a 66 68 5d 71'):
            return register
        opcode = byte(pc)
        pc += 1
        if 0x70 <= opcode <= 0x7F:
            accumulator = opcode & 15
        elif opcode == 0x20:
            accumulator = byte(pc)
            pc += 1
        elif opcode == 0x50:
            register = accumulator
        elif opcode == 0x90:
            offset = byte(pc)
            pc += offset if offset < 128 else offset - 256
        elif opcode == 0x29:
            # F8 JMP loads the destination high byte into A.
            accumulator = byte(pc)
            pc = accumulator * 256 + byte(pc + 1)
        else:
            raise AssertionError(f'Unexpected dispatch opcode {opcode:02X}')
    raise AssertionError('Dispatch did not reach G_JUMP')


class InstructionTests(unittest.TestCase):
    @unittest.skipUnless((BUILD / 'console.bin').exists(), 'Assemble the cartridge first')
    def test_console_snapshot_round_trip(self):
        code = (BUILD / 'console.bin').read_bytes()
        syms = symbols(BUILD / 'console.sym')
        registers = [(i * 37 + 11) & 255 for i in range(64)]
        original = registers.copy()
        memory = {}

        def execute(prefix):
            pc, stop = syms[prefix + '_0'] - 2, syms[prefix + '_5'] + 6
            accumulator, isar, dc = 0, 0, 0x3000
            for _ in range(256):
                if pc == stop:
                    return dc
                opcode = code[pc - 0x1000]
                pc += 1
                if 0x60 <= opcode <= 0x67:
                    isar = (isar & 7) | ((opcode & 7) << 3)
                elif 0x68 <= opcode <= 0x6F:
                    isar = (isar & 56) | (opcode & 7)
                elif opcode in (0x4C, 0x4D):
                    accumulator = registers[isar]
                    if opcode == 0x4D:
                        isar = (isar & 56) | ((isar + 1) & 7)
                elif opcode in (0x5C, 0x5D):
                    registers[isar] = accumulator
                    if opcode == 0x5D:
                        isar = (isar & 56) | ((isar + 1) & 7)
                elif opcode == 0x17:
                    memory[dc] = accumulator
                    dc += 1
                elif opcode == 0x16:
                    accumulator = memory[dc]
                    dc += 1
                elif opcode == 0x8F:
                    offset = code[pc - 0x1000]
                    if offset >= 128:
                        offset -= 256
                    pc = pc + offset if isar & 7 != 7 else pc + 1
                else:
                    self.fail(f'Unexpected snapshot opcode {opcode:02X}')
            self.fail('Snapshot routine did not finish')

        self.assertEqual(execute('CONSOLE_SAVE'), 0x3030)
        self.assertEqual([memory[0x3000 + i] for i in range(48)], original[:48])
        registers[:48] = [0] * 48
        self.assertEqual(execute('CONSOLE_RESTORE'), 0x3030)
        self.assertEqual(registers, original)

    @unittest.skipUnless((BUILD / 'keyboard.bin').exists(), 'Assemble the cartridge first')
    def test_keyboard_relational_symbols(self):
        code = (BUILD / 'keyboard.bin').read_bytes()
        start = symbols(BUILD / 'keyboard.sym')['KEYTABLE'] - 0x1000
        table = code[start:start + 73]
        for letter, symbol in [('T', '<'), ('Y', '>')]:
            with self.subTest(letter=letter):
                self.assertEqual(table[table.index(ord(letter)) + 1], ord(symbol))

    @unittest.skipUnless((BUILD / 'shared.bin').exists(), 'Assemble the cartridge first')
    def test_text_color_keyword(self):
        table = (BUILD / 'shared.bin').read_bytes()
        self.assertRegex(table, rb'TCOLOR[\x80-\xff]')
        self.assertNotRegex(table, rb'TCOL[\x80-\xff]')

    @unittest.skipUnless((BUILD / 'tape_core.bin').exists(), 'Assemble the cartridge first')
    def test_tape_transfer_reads_banked_return_value(self):
        code = (BUILD / 'tape_core.bin').read_bytes()
        syms = symbols(BUILD / 'tape_core.sym')
        for returned in range(5):
            with self.subTest(returned=returned):
                pc = syms['T_TRANSFER_RETURN']
                accumulator, saved, dc, zero = pc >> 8, 0, 0, False
                memory = {syms['TMODE']: 0}
                for _ in range(24):
                    if pc in (syms['T_TRANSFER_OK'], syms['T_RETURN']):
                        break
                    opcode = code[pc - 0x1200]
                    pc += 1
                    if opcode == 0x40:
                        accumulator = returned
                    elif opcode == 0x48:
                        accumulator = saved
                    elif opcode == 0x58:
                        saved = accumulator
                    elif opcode == 0x2A:
                        dc = int.from_bytes(code[pc - 0x1200:pc - 0x1200 + 2], 'big')
                        pc += 2
                    elif opcode == 0x16:
                        accumulator = memory.get(dc, 0)
                        dc += 1
                    elif opcode == 0x17:
                        memory[dc] = accumulator
                        dc += 1
                    elif opcode == 0x20:
                        accumulator = code[pc - 0x1200]
                        pc += 1
                    elif opcode == 0x70:
                        accumulator = 0
                    elif opcode == 0x25:
                        zero = accumulator == code[pc - 0x1200]
                        pc += 1
                    elif opcode in (0x84, 0x90, 0x94):
                        offset = code[pc - 0x1200]
                        if offset >= 128:
                            offset -= 256
                        taken = opcode == 0x90 or (zero if opcode == 0x84 else not zero)
                        pc = pc + offset if taken else pc + 1
                    elif opcode == 0x29:
                        pc = int.from_bytes(code[pc - 0x1200:pc - 0x1200 + 2], 'big')
                    else:
                        self.fail(f'Unexpected transfer return opcode {opcode:02X}')
                expected = syms['T_TRANSFER_OK'] if returned == 0 else syms['T_RETURN']
                self.assertEqual(pc, expected)
                if returned:
                    self.assertEqual(accumulator, returned)

    @unittest.skipUnless((BUILD / 'tape_core.bin').exists(), 'Assemble the cartridge first')
    def test_dupe_restores_mode_after_record_write(self):
        code = (BUILD / 'tape_core.bin').read_bytes()
        syms = symbols(BUILD / 'tape_core.sym')
        for status in (0, 1):
            with self.subTest(status=status):
                pc, accumulator, dc, zero = syms['T_DUPE_WRITE'], 0, 0, False
                registers = [0] * 16
                memory = {syms['TMODE']: 4}
                for _ in range(32):
                    if pc in (syms['T_PROGRESS'], syms['T_BAD']):
                        break
                    opcode = code[pc - 0x1200]
                    pc += 1
                    if opcode == 0x2A:
                        dc = int.from_bytes(code[pc - 0x1200:pc - 0x1200 + 2], 'big')
                        pc += 2
                    elif opcode == 0x17:
                        memory[dc] = accumulator
                        dc += 1
                    elif 0x70 <= opcode <= 0x7F:
                        accumulator = opcode & 15
                    elif opcode == 0x20:
                        accumulator = code[pc - 0x1200]
                        pc += 1
                    elif 0x40 <= opcode <= 0x4B:
                        accumulator = registers[opcode & 15]
                    elif 0x50 <= opcode <= 0x5B:
                        registers[opcode & 15] = accumulator
                    elif opcode == 0x28:
                        self.assertEqual(memory[syms['TMODE']], 0)
                        registers[0] = status
                        accumulator = 0xA5
                        pc += 2
                    elif opcode == 0x25:
                        zero = accumulator == code[pc - 0x1200]
                        pc += 1
                    elif opcode == 0x84:
                        offset = code[pc - 0x1200]
                        if offset >= 128:
                            offset -= 256
                        pc = pc + offset if zero else pc + 1
                    elif opcode == 0x29:
                        pc = int.from_bytes(code[pc - 0x1200:pc - 0x1200 + 2], 'big')
                        accumulator = pc >> 8
                    else:
                        self.fail(f'Unexpected duplicate opcode {opcode:02X}')
                self.assertEqual(memory[syms['TMODE']], 4)
                self.assertEqual(pc, syms['T_PROGRESS'] if status == 0 else syms['T_BAD'])

    @unittest.skipUnless((BUILD / 'console.bin').exists(), 'Assemble the cartridge first')
    def test_text_color_preserves_object_geometry(self):
        code = (BUILD / 'console.bin').read_bytes()
        syms = symbols(BUILD / 'console.sym')
        for color in range(32):
            with self.subTest(color=color):
                memory = {address: (address * 13) & 255 for address in range(0x800, 0x880)}
                before = memory.copy()
                memory[0x3FFD] = color
                registers = [0] * 16
                pc, dc, alternate, accumulator, zero = syms['C_TEXT_COLOR'], 0, 0, 0, False
                for _ in range(400):
                    opcode = code[pc - 0x1000]
                    pc += 1
                    if opcode == 0x0C:
                        break
                    if opcode == 0x08:
                        continue
                    if opcode == 0x2A:
                        dc = int.from_bytes(code[pc - 0x1000:pc - 0x1000 + 2], 'big')
                        pc += 2
                    elif opcode == 0x16:
                        accumulator = code[dc - 0x1000] if 0x1000 <= dc < 0x1800 else memory[dc]
                        dc += 1
                    elif opcode == 0x17:
                        memory[dc] = accumulator
                        dc += 1
                    elif opcode == 0x2C:
                        dc, alternate = alternate, dc
                    elif opcode == 0x8E:
                        dc += accumulator
                    elif opcode == 0x21:
                        accumulator &= code[pc - 0x1000]
                        pc += 1
                    elif opcode == 0x13:
                        accumulator = (accumulator << 1) & 255
                    elif 0x40 <= opcode <= 0x4B:
                        accumulator = registers[opcode & 15]
                    elif 0x50 <= opcode <= 0x5B:
                        registers[opcode & 15] = accumulator
                    elif 0x70 <= opcode <= 0x7F:
                        accumulator = opcode & 15
                    elif 0xE0 <= opcode <= 0xEB:
                        accumulator ^= registers[opcode & 15]
                    elif 0x30 <= opcode <= 0x3B:
                        register = opcode & 15
                        registers[register] = (registers[register] - 1) & 255
                        zero = registers[register] == 0
                    elif opcode == 0x94:
                        offset = code[pc - 0x1000]
                        if offset >= 128:
                            offset -= 256
                        pc = pc + offset if not zero else pc + 1
                    else:
                        self.fail(f'Unexpected text color opcode {opcode:02X}')
                else:
                    self.fail('Text color routine did not return')
                hue = ((color & 1) << 7) | ((color & 2) << 5) | ((color & 4) << 3)
                for address, value in before.items():
                    if 0x811 <= address <= 0x81F:
                        expected = (value & 31) | hue
                    elif 0x821 <= address <= 0x82F:
                        expected = (value & 0x9F) | ((color & 24) << 2)
                    else:
                        expected = value
                    self.assertEqual(memory[address], expected, f'{address:04X}')

    @unittest.skipUnless((BUILD / 'language.bin').exists(), 'Assemble the cartridge first')
    def test_tape_command_reports_returned_status(self):
        code = (BUILD / 'language.bin').read_bytes()
        syms = symbols(BUILD / 'language.sym')

        def message(command, status):
            pc, accumulator, saved, zero = syms[command], 0, 0xA5, False
            for _ in range(24):
                opcode = code[pc - 0x5000]
                pc += 1
                if opcode in (0x28, 0x29, 0x2A):
                    target = int.from_bytes(code[pc - 0x5000:pc - 0x5000 + 2], 'big')
                    pc += 2
                    if opcode == 0x28:
                        accumulator = status if target in (syms['CON_SAVE'], syms['CON_LOAD'], syms['CON_COMP'], syms['CON_VERI'], syms['CON_DUPE']) else 0
                    elif opcode == 0x29:
                        accumulator = target >> 8
                        pc = target
                    else:
                        return target
                elif opcode == 0x58:
                    saved = accumulator
                elif opcode == 0x48:
                    accumulator = saved
                elif opcode == 0x25:
                    zero = accumulator == code[pc - 0x5000]
                    pc += 1
                elif opcode == 0x84:
                    offset = code[pc - 0x5000]
                    if offset >= 128:
                        offset -= 256
                    pc = pc + offset if zero else pc + 1
                else:
                    self.fail(f'Unexpected tape command opcode {opcode:02X}')
            self.fail('Tape command did not select a message')

        for command in ('TB_SAVE', 'TB_LOAD', 'TB_COMP', 'TB_VERI', 'TB_DUPE'):
            for status, expected in ((0, 'TAPE_OK'), (1, 'TAPE_ERROR'),
                                     (2, 'TAPE_COMMAND_ERROR'), (3, 'TAPE_DATA_ERROR'),
                                     (4, 'TAPE_FINISH_ERROR')):
                with self.subTest(command=command, status=status):
                    self.assertEqual(message(command, status), syms[expected])

    @unittest.skipUnless((BUILD / 'tape_io.bin').exists(), 'Assemble the cartridge first')
    def test_serial_abort_holds_both_lines_low(self):
        code = (BUILD / 'tape_io.bin').read_bytes()
        pc = symbols(BUILD / 'tape_io.sym')['T_RESET']
        accumulator, zero, cycles, hold_start = 0, False, 0, None
        registers = [0] * 64
        registers[8] = 0xA5
        for _ in range(20000):
            opcode = code[pc - 0x1300]
            pc += 1
            cycles += 4  # Conservative minimum F8 clocks per instruction.
            if opcode == 0x08:
                continue
            if opcode == 0x20:
                accumulator = code[pc - 0x1300]
                pc += 1
            elif opcode == 0x70:
                accumulator = 0
            elif opcode == 0xB1:
                self.assertEqual(accumulator, 0x60)
                hold_start = cycles
            elif opcode in (0x50, 0x51):
                registers[opcode & 15] = accumulator
            elif opcode in (0x30, 0x31):
                register = opcode & 15
                registers[register] = (registers[register] - 1) & 255
                zero = registers[register] == 0
            elif opcode in (0x90, 0x94):
                offset = code[pc - 0x1300]
                if offset >= 128:
                    offset -= 256
                pc = pc + offset if opcode == 0x90 or not zero else pc + 1
            elif opcode == 0x0C:
                self.assertIsNotNone(hold_start)
                self.assertGreaterEqual(cycles - hold_start, 2 * 1789772 / 300)
                self.assertEqual(registers[8], 0xA5)
                return
            else:
                self.fail(f'Unexpected reset opcode {opcode:02X}')
        self.fail('Serial abort did not return')

    @unittest.skipUnless((BUILD / 'tape_io.bin').exists(), 'Assemble the cartridge first')
    def test_tape_completion_and_failure_status(self):
        code = (BUILD / 'tape_io.bin').read_bytes()
        syms = symbols(BUILD / 'tape_io.sym')

        def execute(start, registers, accumulator, stop=None):
            pc, isar, zero = syms[start], 0, False
            pins = accumulator
            for _ in range(128):
                if stop and pc == syms[stop]:
                    return accumulator
                opcode = code[pc - 0x1300]
                pc += 1
                if opcode in (0x08, 0x1A, 0x1D, 0x1E):
                    continue
                if opcode in (0x0C, 0x1C):
                    return accumulator
                if opcode == 0xA1:
                    accumulator = pins
                elif opcode == 0xB1:
                    self.assertEqual(accumulator, 0)
                elif 0x60 <= opcode <= 0x67:
                    isar = (opcode & 7) * 8 + (isar & 7)
                elif 0x68 <= opcode <= 0x6F:
                    isar = (isar & 56) + (opcode & 7)
                elif 0x70 <= opcode <= 0x7F:
                    accumulator = opcode & 15
                elif 0x40 <= opcode <= 0x4B:
                    accumulator = registers[opcode & 15]
                elif opcode == 0x4C:
                    accumulator = registers[isar]
                elif 0x50 <= opcode <= 0x5B:
                    registers[opcode & 15] = accumulator
                elif opcode in (0x5C, 0x5D):
                    registers[isar] = accumulator
                    if opcode == 0x5D:
                        isar = (isar & 56) + ((isar + 1) & 7)
                elif 0x30 <= opcode <= 0x3B:
                    register = opcode & 15
                    registers[register] = (registers[register] - 1) & 255
                    zero = registers[register] == 0
                elif opcode in (0x3C, 0x3D):
                    registers[isar] = (registers[isar] - 1) & 255
                    zero = registers[isar] == 0
                    if opcode == 0x3D:
                        isar = (isar & 56) + ((isar + 1) & 7)
                elif 0xC0 <= opcode <= 0xCB:
                    accumulator = (accumulator + registers[opcode & 15]) & 255
                    zero = accumulator == 0
                elif opcode in (0x21, 0x25):
                    operand = code[pc - 0x1300]
                    pc += 1
                    if opcode == 0x21:
                        accumulator &= operand
                        zero = accumulator == 0
                    else:
                        zero = accumulator == operand
                elif opcode in (0x84, 0x94, 0x90):
                    offset = code[pc - 0x1300]
                    if offset >= 128:
                        offset -= 256
                    taken = opcode == 0x90 or (zero if opcode == 0x84 else not zero)
                    pc = pc + offset if taken else pc + 1
                else:
                    self.fail(f'Unexpected status-path opcode {opcode:02X}')
            self.fail('Status path did not return')

        # A stop during byte transfer is an error. The separate completion ISR
        # distinguishes the clean final stop from a peripheral failure.
        for status, remaining, bits, expected in [(0x20, 0, 0, 1), (0x60, 0, 0, 1),
                                                   (0x20, 1, 0, 1), (0x20, 0, 1, 1)]:
            with self.subTest(status=status, remaining=remaining, bits=bits):
                registers = [0] * 64
                registers[1], registers[3], registers[8] = remaining, bits, 1
                execute('T_IRQ_STATUS', registers, status, 'T_IRQ_RETURN')
                self.assertEqual(execute('T_WAIT', registers, 0), expected)

        # Byte completion hands off to the original completion interrupt.
        registers = [0] * 64
        registers[8] = 1
        self.assertEqual(execute('T_WAIT', registers, 0), 0)
        for status in (0x00, 0x20, 0x60):
            with self.subTest(completion_status=status):
                registers = [0] * 64
                registers[0] = registers[1] = 10
                execute('T_STOP_IRQ', registers, status)
                self.assertEqual(registers[0:2], [1, 1])
                self.assertEqual(registers[5], 0 if status == 0x20 else 255)
                self.assertEqual(execute('T_STOP_WAIT', registers, 0), int(status != 0x20))

        registers = [0] * 64
        registers[0] = registers[1] = 10
        registers[16:19] = [1, 1, 1]
        self.assertEqual(execute('T_STOP_TICK', registers, 0), 1)

        # The 3853 forces bit 7 of an external interrupt vector high.
        self.assertTrue(syms['T_IRQ'] & 0x80)
        self.assertTrue(syms['T_STOP_IRQ'] & 0x80)

    @unittest.skipUnless((BUILD / 'tape_io.bin').exists(), 'Assemble the cartridge first')
    def test_tape_completion_matches_original_cartridges(self):
        code = (BUILD / 'tape_io.bin').read_bytes()
        syms = symbols(BUILD / 'tape_io.sym')
        root = Path(__file__).resolve().parents[2]
        info = {}
        for line in (root / 'infoman/infoman.lst').read_text().splitlines():
            match = re.match(r'([0-9A-F]{4}):\s+((?:[0-9A-F]{2} +)+)', line)
            if match:
                for offset, byte in enumerate(bytes.fromhex(match[2])):
                    info[int(match[1], 16) + offset] = byte
        money = {}
        for line in (root / 'asm-collection/Money_Minder_vb1000mm.asm').read_text().splitlines():
            match = re.search(r'; ([0-9a-f]{4}) ((?:[0-9a-f]{2} ?)+)', line)
            if match:
                for offset, byte in enumerate(bytes.fromhex(match[2])):
                    money[int(match[1], 16) + offset] = byte
        expected = bytes(info[address] for address in range(0x3C9F, 0x3CB5))
        self.assertEqual(expected, bytes(money[address] for address in range(0x1BA1, 0x1BB7)))
        start = syms['T_STOP_IRQ'] - 0x1300
        self.assertEqual(code[start:start + len(expected)], expected)

    @unittest.skipUnless((BUILD / 'tinybasic-24x15.bin').exists(), 'Assemble the cartridge first')
    def test_commands_preserve_dispatch_id_across_jump(self):
        image = (BUILD / 'tinybasic-24x15.bin').read_bytes()
        for command, target in [('LIST', 1), ('NEW', 2), ('RUN', 3), ('MON', 4)]:
            with self.subTest(command=command):
                self.assertEqual(dispatch_register(image, command), target)

    def test_space_literal(self):
        self.assertEqual(instruction("        CI ' \t; BLANK ?"), '        CI $20')

    def test_semicolon_literal(self):
        self.assertEqual(instruction("        CI ';\t; STATEMENT ?"), '        CI $3B')

    def test_apostrophe_literal(self):
        self.assertEqual(instruction("        CI ''"), '        CI $27')

    def test_comment(self):
        self.assertEqual(instruction("LABEL   LI 72 ; BUFFER'S LENGTH"), 'LABEL   LI 72')

    def test_relational_aliases_share_symbol_handlers(self):
        source = (Path(__file__).parents[1] / 'baseline/tinybasic.f8').read_text()
        table = relational_aliases(source).split('TAB8\t\tEQU', 1)[1].split('PROMPT', 1)[0]
        entries = dict(re.findall(r'DC\s+"([^"]+)"[^\n]*\n\s*DC.W\s+(\w+)\+H8000', table))
        for alias, symbol in [('GE', '>='), ('GT', '>'), ('LE', '<='), ('LT', '<')]:
            with self.subTest(alias=alias):
                self.assertEqual(entries[alias], entries[symbol])
        self.assertTrue(table.index('"LT"') < table.index('XP17+H8000'))


if __name__ == '__main__':
    unittest.main()
