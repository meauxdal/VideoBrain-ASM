#!/usr/bin/env python3
"""Build the experimental Tiny BASIC PRINT continuation correction."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import zlib


def main():
    root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dasm', required=True, type=Path)
    args = parser.parse_args()
    baseline = (root / 'TINYBASICVB-expanded-recordfix.bin').read_bytes()
    expected = '8da31d819e65bd1d186ec484587caa63b1c1a3cceb13710d96134c4290f61ad5'
    if len(baseline) != 4096 or hashlib.sha256(baseline).hexdigest() != expected:
        raise SystemExit('Unexpected baseline ROM')

    source = (root / 'tinybasicvb-recordfix.f8').read_text()
    old = '\t\tPI\tFINISH\t\t;GO FINISH UP LINE'
    anchor = '\t\tORG\t$1FFF'
    if source.count(old) != 1 or source.count(anchor) != 1:
        raise SystemExit('Unexpected baseline source')
    source = source.replace(old, '\t\tPI\tPRNEXT\t\t;RESUME PRINT AFTER OUTPUT')
    helper = ('\t\tORG\t$1F00\n'
              'PRNEXT\t\tLISU\t2\t\t;OUTPUT LEAVES UPPER ISAR AT 7\n'
              '\t\tJMP\tFINISH\n\n')
    source = source.replace(anchor, helper + anchor)
    output_dir = root.parents[1] / 'build' / 'tinybasic' / 'printfix'
    output_dir.mkdir(parents=True, exist_ok=True)
    source_path = output_dir / 'tinybasicvb-printfix.f8'
    source_path.write_text(source, encoding='ascii')
    output = output_dir / 'TINYBASICVB-expanded-printfix.bin'
    subprocess.run([str(args.dasm.resolve()), str(source_path), '-f3',
                    f'-o{output}', f'-l{output.with_suffix(".lst")}',
                    f'-s{output.with_suffix(".sym")}'], cwd=root, check=True)
    rom = output.read_bytes()
    expected_rom = bytearray(baseline)
    if baseline[0x3BE:0x3C1] != bytes.fromhex('28 16 45'):
        raise SystemExit('Unexpected PRINT call site')
    if baseline[0xF00:0xF04] != bytes.fromhex('FF FF FF FF'):
        raise SystemExit('PRINT helper space is occupied')
    expected_rom[0x3BE:0x3C1] = bytes.fromhex('28 1F 00')
    expected_rom[0xF00:0xF04] = bytes.fromhex('62 29 16 45')
    if rom != expected_rom:
        raise SystemExit('Unexpected ROM changes outside PRINT continuation')
    print(f'Verified PRINT-only changes; CRC32 {zlib.crc32(rom):08X}')
    print(output)


if __name__ == '__main__':
    main()
