#!/usr/bin/env python3
"""Link the preserved interpreter with the Timeshare console."""
import argparse
from pathlib import Path
import re
import subprocess
import sys
import zlib

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[1]
OUT = REPO / 'build/tinybasic/banked'


def assemble(dasm, source, output):
    subprocess.run([str(dasm), str(source), '-f3', f'-o{output}',
                    f'-l{output.with_suffix(".lst")}',
                    f'-s{output.with_suffix(".sym")}', f'-I{OUT}',
                    f'-I{ROOT}', f'-I{ROOT.parent / "baseline"}'],
                   cwd=ROOT, check=True)


def symbols(path):
    return {m[1]: int(m[2], 16) for line in path.read_text().splitlines()
            if (m := re.match(r'^(\S+)\s+([0-9a-fA-F]{4})\s', line))}


def number(expr, syms):
    expr = expr.strip().replace('$', '0x')
    expr = re.sub(r'\b[A-Za-z_]\w*\b',
                  lambda m: str(syms[m[0]]) if m[0] in syms else m[0], expr)
    if not re.fullmatch(r'[0-9a-fA-Fx+\- ()]+', expr):
        raise ValueError(f'Unsupported address expression: {expr}')
    return eval(expr, {'__builtins__': {}}, {})


def data(label, values):
    result = label + '\n'
    for i in range(0, len(values), 16):
        result += '        DC ' + ','.join(f'${v:02X}' for v in values[i:i+16]) + '\n'
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dasm', type=Path, required=True)
    args = parser.parse_args()
    dasm = args.dasm.resolve()
    OUT.mkdir(parents=True, exist_ok=True)
    source = ROOT.parent / 'baseline/tinybasic.f8'
    baseline = OUT / 'baseline.bin'
    assemble(dasm, source, baseline)
    raw = baseline.read_bytes()
    if raw != (source.parent / 'tinybasic.bin').read_bytes() or zlib.crc32(raw) != 0xF3BFF3D3:
        raise SystemExit('Baseline mismatch')
    syms = symbols(baseline.with_suffix('.sym'))
    pcs = {}
    active = False
    for line in baseline.with_suffix('.lst').read_text().splitlines():
        if line.startswith('------- FILE '):
            active = line.split()[2].replace('\\', '/').endswith('tinybasic.f8')
        elif active and (m := re.match(r'\s*(\d+)\s+([0-9a-f]{4})\b', line)):
            pcs[int(m[1])] = int(m[2], 16)
    records = []
    branches = {'BR', 'BZ', 'BNZ', 'BP', 'BM', 'BC', 'BNC', 'BF', 'BT', 'BR7'}
    for n, line in enumerate(source.read_text().splitlines(), 1):
        text = line.split(';')[0].rstrip()
        if not text or n not in pcs:
            continue
        m = re.match(r'^(?:(\S+)\s+)?\s*(\S+)(?:\s+(.*))?$', text)
        if not m:
            continue
        label, op, arg = m[1], m[2].upper(), (m[3] or '').strip()
        pc = pcs[n]
        core = syms['START'] <= pc < syms['TAB1']
        io = syms['TTY0'] <= pc < syms['RANPNT']
        patch = ((0x1E00 <= pc < 0x1E20) or (0x1EC4 <= pc < 0x1F60))
        if not (core or io or patch) or op in {'DC', 'DC.W', 'DB', 'EQU', 'ORG'}:
            continue
        if syms['GET3'] + 6 <= pc < syms['GET4']:
            continue
        if pc == syms['GET3'] + 6:
            continue
        size = 3 if op in {'PI', 'JMP', 'DCI'} else 2 if op in branches | {
            'LI', 'AI', 'NI', 'OI', 'XI', 'CI', 'IN', 'OUT'} else 1
        records.append({'pc': pc, 'op': op, 'arg': arg, 'size': size})
    # Replace the old packed cursor edit with the new console operation.
    index = next(i for i, r in enumerate(records) if r['pc'] == syms['GET3'] + 5)
    records[index+1:index+1] = [
        {'pc': -1, 'op': 'PI', 'arg': 'CON_BACK', 'size': 3},
        {'pc': -2, 'op': 'JMP', 'arg': 'GET2A', 'size': 3}]
    # The baseline synthesizes an absolute return to GET2A in K.
    # The banked version transfers there through the normal jump gate.
    records = [r for r in records if not 0x1E0A <= r['pc'] <= 0x1E0E]
    done = next(r for r in records if r['pc'] == 0x1E08)
    done.update(op='JMP', arg='GET2A', size=3)
    by_pc = {r['pc']: i for i, r in enumerate(records)}
    redirects = {'LDRAWCHAR': 'CON_PUT', 'LNEXTLINE': 'CON_NEWLINE', 'LGETKEY': 'CON_KEY'}
    for r in records:
        r['arg'] = redirects.get(r['arg'], r['arg'])
        if r['op'] in branches:
            r['arg'] = r['arg'].replace('*', str(r['pc']))
    # A branch-connected interval cannot cross a ROM bank boundary.
    forbidden = set()
    for i, r in enumerate(records):
        if r['op'] in branches:
            target = number(r['arg'].split(',')[-1], syms)
            j = by_pc[target]
            forbidden.update(range(min(i, j), max(i, j)))
    chunks, start = [], 0
    for i, r in enumerate(records):
        if r['op'] in {'JMP', 'PK', 'POP'} and i not in forbidden:
            chunks.append(records[start:i+1])
            start = i + 1
    if start != len(records):
        raise SystemExit('Unterminated interpreter chunk')
    banks, used = {}, {b: 0x1000 for b in range(1, 5)}
    for chunk in chunks:
        size = sum(r['size'] + (4 if r['op'] == 'PI' else 3 if r['op'] == 'JMP' else 0)
                   for r in chunk)
        if any(r['pc'] == syms['START'] for r in chunk):
            size += 5
        bank = next((b for b in used if used[b] + size <= 0x1500), None)
        if bank is None:
            raise SystemExit(f'Interpreter does not fit: chunk {chunk[0]["pc"]:04X}, {size} bytes')
        for r in chunk:
            banks[r['pc']] = bank
        used[bank] += size
    # Collect dispatch targets before allocating final instruction addresses.
    callbacks = []
    table_source = source.read_text().split('H8000\t\tEQU', 1)[1].split('\n', 1)[1].split('TTY0\t', 1)[0]
    for expr in re.findall(r'DC\.W\s+([^;\r\n]+)', table_source):
        target = number(expr.replace('+H8000', ''), syms)
        if target not in callbacks:
            callbacks.append(target)
    targets = [syms['ASORRY']] + callbacks + ['CON_INIT', 'CON_PUT', 'CON_NEWLINE', 'CON_BACK', 'CON_KEY', 'CON_TICK', syms['NEWT']]
    targets = list(dict.fromkeys(targets))
    for r in records:
        if r['op'] not in {'PI', 'JMP'}:
            continue
        target = r['arg'] if r['arg'].startswith('CON_') else number(r['arg'], syms)
        if isinstance(target, str) or target in banks and banks[target] != banks[r['pc']]:
            if target not in targets:
                targets.append(target)
    if len(targets) > 256:
        raise SystemExit('Too many bank transfer targets')
    ids = {target: i for i, target in enumerate(targets)}
    addresses = {}
    positions = {b: 0x1000 for b in used}
    for r in records:
        b = banks[r['pc']]
        addresses[r['pc']] = positions[b]
        extra = 0
        if r['pc'] == syms['START']:
            extra += 5
        if r['op'] in {'PI', 'JMP'}:
            target = r['arg'] if r['arg'].startswith('CON_') else number(r['arg'], syms)
            if isinstance(target, str) or target in banks and banks[target] != b:
                extra += 4 if r['op'] == 'PI' else 3
        positions[b] += r['size'] + extra
    common = '        ORG $1700\n'
    thunk_pc = 0x1700
    thunk_addresses = {}
    for target in callbacks:
        size = 5 if ids[target] < 16 else 6
        if thunk_pc < 0x17D2 and thunk_pc + size > 0x17CC:
            common += '        ORG $17CC\n        DC $60,$00,$E0,$FB,$01,$07\n        ORG $17D2\n'
            thunk_pc = 0x17D2
        thunk_addresses[target] = thunk_pc
        load = 'LIS' if ids[target] < 16 else 'LI'
        common += f'        {load} {ids[target]}\n        LR 0,A\n        JMP G_JUMP\n'
        thunk_pc += size
    if thunk_pc > 0x1800:
        raise SystemExit('Computed dispatch thunks overflow common region')
    if thunk_pc <= 0x17CC:
        common += '        ORG $17CC\n        DC $60,$00,$E0,$FB,$01,$07\n'
    regs = list(map(str, range(12))) + ['KU', 'KL', 'QU', 'QL']
    (OUT / 'save_direct.inc').write_text(''.join(f'        LR A,{reg}\n        ST\n' for reg in regs), encoding='ascii')
    (OUT / 'restore_direct.inc').write_text(''.join(f'        LM\n        LR {reg},A\n' for reg in regs), encoding='ascii')
    runtime = OUT / 'runtime.bin'
    assemble(dasm, ROOT / 'runtime.f8', runtime)
    rt = runtime.read_bytes()
    if len(rt) > 384:
        raise SystemExit(f'Bank runtime exceeds reserved RAM: {len(rt)}')
    runtime_syms = symbols(runtime.with_suffix('.sym'))
    # Remaining sources use the same linker-defined names in each bank.
    equates = {name: addresses[value] for name, value in syms.items() if value in addresses}
    equates.update({f'O{pc:04X}': addr for pc, addr in addresses.items() if pc >= 0})
    equates.update(runtime_syms)
    equates['RANPNT'] = 0x3F22
    for name in ['TXTB', 'TXTE', 'VARBGN', 'STRLGH', 'BUFF', 'SKEND', 'STACK']:
        equates[name] = syms[name]
    # Console and boot are assembled before the interpreter banks.
    console = OUT / 'console.bin'
    (OUT / 'common.inc').write_text(common, encoding='ascii')
    (OUT / 'runtime_equates.inc').write_text(''.join(f'{k} EQU ${v:04X}\n' for k, v in runtime_syms.items()), encoding='ascii')
    for name, load, store in [('console_save.inc', 'LR A,I', 'ST'),
                              ('console_restore.inc', 'LM', 'LR I,A')]:
        text = ''
        for bank in range(6):
            text += f'        LISU {bank}\n        LISL 0\n'
            text += f'        {load}\n        {store}\n' * 8
        (OUT / name).write_text(text, encoding='ascii')
    sys.path.insert(0, str(ROOT.parent / 'timeshare'))
    import build_probe as display
    listing = (REPO / 'asm-collection/Timeshare_cm01.asm').read_text()
    reference_source = OUT / 'timeshare.f8'
    reference_source.write_text('        PROCESSOR F8\n' + re.sub(r'^org \$1000$', '        ORG $1000', listing, flags=re.M) + '\n        END\n', encoding='ascii')
    assemble(dasm, reference_source, OUT / 'timeshare.bin')
    original = (OUT / 'timeshare.bin').read_bytes()
    if zlib.crc32(original) != 0x957D7246:
        raise SystemExit('Timeshare reference mismatch')
    def extract(start, end):
        return '\n'.join(line.split(';')[0].rstrip() for line in
                         listing[listing.index(start + ':'):listing.index(end + ':')].splitlines()) + '\n'
    routines = extract('A12dd', 'A12f8') + extract('A1395', 'A142d')
    routines = routines.replace('A1740', 'ROWS').replace('$175e', 'ROWHIGHS')
    (OUT / 'console_routines.inc').write_text(routines, encoding='ascii')
    draw = extract('A1476', 'A150c') if 'A150c:' in listing else listing[listing.index('A1476:'):listing.index('\n', listing.index('A150b:'))]
    draw = '\n'.join(line.split(';')[0].rstrip() for line in draw.splitlines())
    draw = draw.replace('A1580', 'FONT').replace('A1740', 'ROWS').replace('A1578', 'MASKS')
    (OUT / 'drawchar.inc').write_text(draw + '\n', encoding='ascii')
    rows = display.ROWS
    objects = ([0] + [p & 255 for p in rows] + [0] + [(p >> 8) | 0xE0 for p in rows] +
               [0x41] + [0x52] * 15 + [1] + [7] * 15 + [23] * 16 +
               [255] + [48 + 12*r for r in range(15)] + [255]*16 + [0x80] + list(range(1,16)))
    generated = data('OBJECTS', objects) + data('ROWS', original[0x740:0x75E])
    generated += data('MASKS', original[0x578:0x580]) + data('FONT', original[0x580:0x740])
    generated += data('INITIALY', [48 + 12*r for r in range(15)]) + data('ROWHIGHS', original[0x75E:0x76C])
    (OUT / 'console_data.inc').write_text(generated, encoding='ascii')
    (OUT / 'key_data.inc').write_text(data('KEYTABLE', raw[syms['VBCHARS']-0x1000:syms['VBCHARS']-0x1000+73]), encoding='ascii')
    assemble(dasm, ROOT / 'console.f8', console)
    cs = symbols(console.with_suffix('.sym'))
    (OUT / 'key_id.inc').write_text(f'TICK_ID EQU {ids["CON_TICK"]}\n', encoding='ascii')
    assemble(dasm, ROOT / 'keyboard.f8', OUT / 'keyboard.bin')
    cs.update(symbols(OUT / 'keyboard.sym'))
    for name in targets:
        if isinstance(name, str):
            equates[name] = cs[name]
    table = bytearray()
    for target in targets:
        bank, address = (6 if target == 'CON_KEY' else 5, cs[target]) if isinstance(target, str) else (banks[target], addresses[target])
        table.extend([bank, address >> 8, address & 255, 0])
    (OUT / 'targets.inc').write_text(data('TARGETS', table), encoding='ascii')
    # Shared keyword and error data retain their original source definitions.
    shared = table_source.replace('\t\tEQU\t*', '')
    shared = re.sub(r'DC\.W\s+([^;\r\n]+)', lambda m: f'DC.W ${thunk_addresses[number(m[1].replace("+H8000", ""), syms)] | 0x8000:04X}', shared)
    shared = 'H8000 EQU $8000\n        ORG $1500\n' + shared
    shared += data('WHAT', b'WHAT\r') + data('HOW', b'HOW\r') + data('SORRY', b'SORRY\r')
    (OUT / 'shared.inc').write_text(shared, encoding='ascii')
    # Resolve shared labels with a small standalone assembly.
    probe = OUT / 'shared.f8'
    probe.write_text('        PROCESSOR F8\n' + shared + '        END\n', encoding='ascii')
    assemble(dasm, probe, OUT / 'shared.bin')
    equates.update(symbols(OUT / 'shared.sym'))
    images = [None] * 8
    images[5] = console.read_bytes()
    for b in range(1, 5):
        lines = ['        PROCESSOR F8', '        ORG $1000']
        lines += [f'{k} EQU ${v:04X}' for k, v in equates.items()]
        for r in records:
            if banks[r['pc']] != b:
                continue
            op, arg = r['op'], r['arg']
            marker = f'AT{r["pc"]:04X}' if r['pc'] >= 0 else f'AT_EDIT{-r["pc"]}'
            lines.append(marker)
            if r['pc'] == syms['START']:
                lines += ['        DCI $3F1D', '        CLR', '        ST']
            if op in {'PI', 'JMP'}:
                target = arg if arg.startswith('CON_') else number(arg, syms)
                if isinstance(target, str) or target in banks and banks[target] != b:
                    gate = 'G_ENTRY' if op == 'PI' else 'G_JUMP'
                    lines += [f'        LI {ids[target]}',
                              '        LR 0,A', f'        {op} {gate}']
                    if op == 'PI':
                        lines += ['        LR A,0']
                    continue
                if target in addresses:
                    arg = f'${addresses[target]:04X}'
            elif op in branches:
                parts = arg.split(',')
                parts[-1] = f'${addresses[number(parts[-1], syms)]:04X}'
                arg = ','.join(parts)
            lines.append(f'        {op} {arg}')
        lines += ['        INCLUDE "shared.inc"', '        INCLUDE "common.inc"', '        ORG $17FF', '        DC $FF', '        END']
        bank_source = OUT / f'bank-{b}.f8'
        bank_source.write_text('\n'.join(lines) + '\n', encoding='ascii')
        assemble(dasm, bank_source, OUT / f'bank-{b}.bin')
        linked_symbols = symbols(OUT / f'bank-{b}.sym')
        for r in records:
            if banks[r['pc']] == b:
                marker = f'AT{r["pc"]:04X}' if r['pc'] >= 0 else f'AT_EDIT{-r["pc"]}'
                if linked_symbols[marker] != addresses[r['pc']]:
                    raise SystemExit(f'Instruction relocation mismatch: {marker}')
        images[b] = (OUT / f'bank-{b}.bin').read_bytes()
    (OUT / 'boot_ids.inc').write_text(f'INIT_ID EQU {ids["CON_INIT"]}\nNEW_ID EQU {ids[syms["NEWT"]]}\n' + data('RUNTIME', rt), encoding='ascii')
    assemble(dasm, ROOT / 'boot.f8', OUT / 'boot.bin')
    images[0] = (OUT / 'boot.bin').read_bytes()
    images[6] = (OUT / 'keyboard.bin').read_bytes()
    dispatch = OUT / 'dispatch.f8'
    dispatch.write_text('        PROCESSOR F8\n        INCLUDE "runtime_equates.inc"\n        ORG $1000\n        INCLUDE "targets.inc"\n        INCLUDE "common.inc"\n        ORG $17FF\n        DC $FF\n        END\n', encoding='ascii')
    assemble(dasm, dispatch, OUT / 'dispatch.bin')
    images[7] = (OUT / 'dispatch.bin').read_bytes()
    if any(len(image) != 2048 for image in images):
        raise SystemExit('Invalid bank size')
    if any(image[0x700:] != images[0][0x700:] for image in images[1:]):
        raise SystemExit('Common ROM region differs between banks')
    output = OUT / 'tinybasic-24x15.bin'
    output.write_bytes(b''.join(images))
    print(f'Linked CRC32 {zlib.crc32(output.read_bytes()):08X}; runtime {len(rt)} bytes; {len(targets)} transfers')
    print(output)


if __name__ == '__main__':
    main()
