"""Create a codec-only image with a deterministic transport for native F8 tests."""
import argparse
from pathlib import Path
import subprocess
from build import symbols

ROOT = Path(__file__).resolve().parent
BUILD = ROOT.parents[1] / 'build/tinybasic/banked'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dasm', required=True, type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    stub = BUILD / 'test_tape_io.bin'
    subprocess.run([str(args.dasm.resolve()), str(ROOT / 'test_tape_io.f8'),
                    '-f3', f'-o{stub}'], check=True)
    image = bytearray((BUILD / 'tinybasic-24x15.bin').read_bytes())
    code = stub.read_bytes()
    if len(image) != 16384 or len(code) > 256:
        raise SystemExit('Unexpected image or test stub size')
    if args.output.resolve() == (BUILD / 'tinybasic-24x15.bin').resolve():
        raise SystemExit('Cannot overwrite the production image')
    image[7 * 2048 + 0x300:7 * 2048 + 0x300 + len(code)] = code
    args.output.write_bytes(image)
    timeout_image = bytearray((BUILD / 'tinybasic-24x15.bin').read_bytes())
    wait = symbols(BUILD / 'tape_io.sym')['T_WAIT']
    base = 7 * 2048 + wait - 0x1000
    if timeout_image[base + 3] != 0x70 or timeout_image[base + 6] != 0x78:
        raise SystemExit('Unexpected timeout initialization')
    # One foreground iteration exercises the missing-firmware cleanup path.
    timeout_image[base + 3] = 0x71
    timeout_image[base + 6] = 0x71
    args.output.with_name('tinybasic-tape-timeout.test.bin').write_bytes(timeout_image)


if __name__ == '__main__':
    main()
