#!/usr/bin/env python3
# Assemble the preserved phase 1 Tiny BASIC baseline.
import argparse
import hashlib
from pathlib import Path
import subprocess
import zlib


def main():
    root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description='Verify the phase 1 Tiny BASIC baseline')
    parser.add_argument('--dasm', required=True, type=Path)
    args = parser.parse_args()
    baseline = (root / 'tinybasic.bin').read_bytes()
    expected = 'ffee87ca715c09c6e04cb18521ba827d5b21153db4aeccac937cb92719921516'
    if len(baseline) != 4096 or hashlib.sha256(baseline).hexdigest() != expected:
        raise SystemExit('Unexpected baseline ROM')
    output_dir = root.parents[1] / 'build' / 'tinybasic' / 'baseline'
    output_dir.mkdir(parents=True, exist_ok=True)
    output = output_dir / 'tinybasic.bin'
    subprocess.run([str(args.dasm.resolve()), 'tinybasic.f8', '-f3',
                    f'-o{output}', f'-l{output.with_suffix(".lst")}',
                    f'-s{output.with_suffix(".sym")}'], cwd=root, check=True)
    if output.read_bytes() != baseline:
        raise SystemExit('Rebuilt ROM differs from the preserved baseline')
    print(f'Verified {len(baseline)} bytes; CRC32 {zlib.crc32(baseline):08X}')
    print(output)


if __name__ == '__main__':
    main()
