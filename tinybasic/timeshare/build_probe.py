#!/usr/bin/env python3
# Verify the Timeshare reference and build a standalone display probe.
import argparse
from pathlib import Path
import re
import subprocess
import zlib

ROWS = (0x1B00, 0x1A00, 0x1900, 0x1800, 0x0F00, 0x0E00, 0x0D00,
        0x0C00, 0x1B80, 0x1A80, 0x1980, 0x1880, 0x0E80, 0x0D80, 0x0C80)


def data(label, values):
    values = bytes(values)
    lines = [label]
    for i in range(0, len(values), 16):
        lines.append('        DC ' + ','.join('$' + f'{v:02X}' for v in values[i:i + 16]))
    return '\n'.join(lines) + '\n'


def assemble(dasm, source, output, cwd, includes=None):
    command = [str(dasm), str(source), '-f3', f'-o{output}',
               f'-l{output.with_suffix(".lst")}', f'-s{output.with_suffix(".sym")}']
    if includes:
        command.append(f'-I{includes}')
    subprocess.run(command, cwd=cwd, check=True)


def main():
    root = Path(__file__).resolve().parent
    repo = root.parents[1]
    parser = argparse.ArgumentParser(description='Build a Timeshare 24x15 display probe')
    parser.add_argument('--dasm', required=True, type=Path)
    args = parser.parse_args()
    dasm = args.dasm.resolve()
    out = repo / 'build' / 'tinybasic' / 'timeshare'
    out.mkdir(parents=True, exist_ok=True)
    listing = (repo / 'asm-collection' / 'Timeshare_cm01.asm').read_text()
    normalized = re.sub(r'^org \$1000$', '        ORG $1000', listing, flags=re.M)
    original_source = out / 'timeshare-original.f8'
    original_source.write_text('        PROCESSOR F8\n' + normalized + '\n        END\n',
                               encoding='ascii')
    original_binary = out / 'timeshare-original.bin'
    assemble(dasm, original_source, original_binary, root)
    original = original_binary.read_bytes()
    if len(original) != 2048 or zlib.crc32(original) != 0x957D7246:
        raise SystemExit('Timeshare listing does not reproduce the recognized original ROM')
    font = original[0x580:0x740]
    masks = original[0x578:0x580]
    row_bytes = original[0x740:0x75E]
    if row_bytes != b''.join(p.to_bytes(2, 'big') for p in ROWS):
        raise SystemExit('Unexpected Timeshare row addresses')
    if len(font) != 64 * 7 or any(v & 7 for v in font):
        raise SystemExit('Unexpected Timeshare font geometry')
    slots = {(p & 0x3FF) if p >= 0x1800 else 1024 + p - 0xC00 for p in ROWS}
    if len(slots) != 15 or any(p & 127 for p in slots):
        raise SystemExit('Overlapping or unaligned bitmap row slots')

    start = listing.index('A1476:')
    end = listing.index('\n', listing.index('A150b:', start))
    routine = '\n'.join(line.split(';')[0].rstrip()
                        for line in listing[start:end].splitlines())
    routine = routine.replace('A1580', 'FONT').replace('A1740', 'ROWS').replace('A1578', 'MASKS')
    (out / 'drawchar.inc').write_text(routine + '\n', encoding='ascii')

    objects = ([0] + [p & 255 for p in ROWS] +
               [0] + [(p >> 8) | 0xE0 for p in ROWS] +
               [0x41] + [0x52] * 15 + [1] + [7] * 15 + [23] * 16 +
               [255] + [48 + 12 * r for r in range(15)] +
               [255] * 16 + [0x80] + list(range(1, 16)))
    if len(objects) != 128:
        raise SystemExit('Unexpected object table size')
    sample = [f'{r:02d} ABCDEFGHIJKLMNOPQRST{r % 10}' for r in range(1, 16)]
    if any(len(line) != 24 for line in sample):
        raise SystemExit('Sample rows must contain exactly 24 characters')
    generated = (data('OBJECTS', objects) + data('ROWS', row_bytes) +
                 data('MASKS', masks) + data('FONT', font) +
                 data('SAMPLE', ''.join(sample).encode('ascii')))
    (out / 'display_data.inc').write_text(generated, encoding='ascii')
    output = out / 'timeshare-display-probe.bin'
    assemble(dasm, root / 'probe.f8', output, root, out)
    rom = output.read_bytes()
    if len(rom) != 2048:
        raise SystemExit('Display probe must fit the Timeshare 2 KiB ROM window')
    print(f'Verified original Timeshare CRC32 957D7246; probe CRC32 {zlib.crc32(rom):08X}')
    print(output)


if __name__ == '__main__':
    main()
