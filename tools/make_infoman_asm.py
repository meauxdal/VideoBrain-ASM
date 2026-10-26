#!/usr/bin/env python3
"""Convert the verified Information Manager listing to DASM F8 source."""

import argparse
import hashlib
from pathlib import Path
import re
import subprocess

from disassemble_infoman import CHIPS


ROOT = Path(__file__).resolve().parents[1]
ROM_SHA256 = '9b580726ad5d899a316901ad4513622a9e66e8131da3d6ac3de40180a2200d8f'
ROW = re.compile(r'^([0-9A-F]{4}): (.{23}) (.+)$')
REGISTERS = {f'R{n}': str(n) for n in range(9)}
REGISTERS.update(J='9', HU='10', HL='11', S='12', I='13', D='14')
PRINTER_NOTES = {
    0x36C6: 'R0 is the formatter scroll count; the original printer path does not copy it to 0C28.',
    0x36CA: 'Optional printer correction hooks here, using padding at 17F8 and 3FF9.',
    0x3E31: 'Original serial startup; the optional idle correction replaces these six bytes.',
}


def read_listing(path):
    lines = path.read_text(encoding='ascii').splitlines()
    memory = {}
    for line in lines:
        match = ROW.fullmatch(line)
        if not match:
            if re.match(r'^[0-9A-F]{4}:', line):
                raise ValueError(f'Invalid listing row: {line}')
            continue
        address = int(match[1], 16)
        for offset, value in enumerate(bytes.fromhex(match[2])):
            if address + offset in memory:
                raise ValueError(f'Overlapping listing bytes at {address + offset:04X}')
            memory[address + offset] = value
    expected = {base + n for base, _, _ in CHIPS for n in range(2048)}
    if set(memory) != expected:
        raise ValueError('Listing must cover exactly the three original ROM chips')
    for base, name, digest in CHIPS:
        data = bytes(memory[a] for a in range(base, base + 2048))
        if hashlib.sha1(data).hexdigest() != digest:
            raise ValueError(f'Listing hash mismatch: {name}')
    return lines, memory


def instruction(text, labels):
    code, separator, comment = text.partition(';')
    parts = code.split(None, 1)
    op = parts[0]
    operand = parts[1].strip() if len(parts) > 1 else ''
    operand = re.sub(r"H'([0-9A-F]+)'", r'$\1', operand)
    if op in ('LR', 'DS', 'AS', 'ASD', 'NS', 'XS'):
        # HU/HL and J name scratchpad registers; S/I/D select ISAR modes.
        operand = re.sub(r'\b(?:R[0-8]|J|HU|HL|S|I|D)\b',
                         lambda m: REGISTERS[m[0]], operand)
    if op in ('PI', 'JMP', 'BC', 'BM', 'BNC', 'BNZ', 'BP', 'BR', 'BR7', 'BZ'):
        if operand.startswith('$') and f'L{operand[1:]}' in labels:
            operand = f'L{operand[1:]}'
    result = f'        {op.lower():<5}{operand}'.rstrip()
    if separator:
        result += ' ;' + comment
    return result


def make_source(lines):
    labels = {line[:-1] for line in lines if re.fullmatch(r'L[0-9A-F]{4}:', line)}
    output = [
        '; Information Manager VB-1200 prototype, September 25/26, 1978.',
        '; DASM F8 source generated from infoman.lst; original ROM bytes preserved.',
        '; Printer corrections are documented here but are not applied.',
        '; DB outside confirmed data ranges may be untraced code.',
        '', '        processor F8', '',
    ]
    for line in lines[5:]:
        match = ROW.fullmatch(line)
        if not match:
            output.append(line)
            continue
        address = int(match[1], 16)
        if address == 0x1000:
            output += ['        org $1000']
        elif address == 0x3000:
            output += ['', '; Cartridge image has a 2 KB zero-filled gap.',
                       '        org $2000, $00', '        rorg $3000']
        if address in PRINTER_NOTES:
            output.append('; ' + PRINTER_NOTES[address])
        output.append(instruction(match[3], labels))
    output += ['', '        rend', '']
    return '\n'.join(output)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--listing', type=Path, default=ROOT / 'infoman/infoman.lst')
    parser.add_argument('--output', type=Path, default=ROOT / 'infoman/infoman.asm')
    parser.add_argument('--dasm', type=Path, help='also assemble and verify the cartridge image')
    parser.add_argument('--binary', type=Path, default=ROOT / 'build/infoman.bin')
    args = parser.parse_args()
    lines, memory = read_listing(args.listing)
    source = make_source(lines)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(source, encoding='ascii')
    print(f'{args.output}: original chip hashes verified')
    if args.dasm:
        args.binary.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run([str(args.dasm.resolve()), str(args.output.resolve()), '-f3',
                        '-o' + str(args.binary.resolve()), '-R'], check=True, timeout=30)
        expected = (bytes(memory[a] for a in range(0x1000, 0x1800)) + bytes(2048)
                    + bytes(memory[a] for a in range(0x3000, 0x4000)))
        actual = args.binary.read_bytes()
        if actual != expected or hashlib.sha256(actual).hexdigest() != ROM_SHA256:
            raise ValueError('Assembled image does not match the original cartridge')
        print(f'{args.binary}: {len(actual)} bytes verified, SHA256 {ROM_SHA256}')


if __name__ == '__main__':
    main()
