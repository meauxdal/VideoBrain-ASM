#!/usr/bin/env python3
"""Assemble and verify the preserved VideoBrain Tiny BASIC baseline."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import zlib


def main():
    root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dasm', required=True, type=Path)
    parser.add_argument('--output', type=Path,
                        default=root.parents[1] / 'build' / 'tinybasic' / 'recordfix.bin')
    args = parser.parse_args()
    baseline = (root / 'TINYBASICVB-expanded-recordfix.bin').read_bytes()
    expected = '8da31d819e65bd1d186ec484587caa63b1c1a3cceb13710d96134c4290f61ad5'
    if len(baseline) != 4096 or hashlib.sha256(baseline).hexdigest() != expected:
        raise SystemExit('Unexpected baseline ROM')
    output = args.output.resolve()
    if output in {p.resolve() for p in root.iterdir() if p.is_file()}:
        raise SystemExit('Output must not overwrite an input file')
    output.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run([str(args.dasm.resolve()), 'tinybasicvb-recordfix.f8', '-f3',
                    f'-o{output}', f'-l{output.with_suffix(".lst")}',
                    f'-s{output.with_suffix(".sym")}'], cwd=root, check=True)
    rebuilt = output.read_bytes()
    if rebuilt != baseline:
        raise SystemExit('Rebuilt ROM differs from the preserved baseline')
    print(f'Verified {len(rebuilt)} bytes; CRC32 {zlib.crc32(rebuilt):08X}')
    print(output)


if __name__ == '__main__':
    main()
