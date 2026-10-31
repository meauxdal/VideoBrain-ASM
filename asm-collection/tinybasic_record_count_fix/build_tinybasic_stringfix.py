#!/usr/bin/env python3
"""Build the Tiny BASIC string correction and optional input guard."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import zlib


def main():
    root = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dasm', required=True, type=Path)
    parser.add_argument('--inputfix', action='store_true',
                        help='also ignore backspace on an empty input buffer')
    parser.add_argument('--cancelfix', action='store_true', help='reset cancellation capacity; includes --inputfix')
    args = parser.parse_args()
    args.inputfix = args.inputfix or args.cancelfix
    baseline = (root / 'TINYBASICVB-expanded-recordfix.bin').read_bytes()
    expected = '8da31d819e65bd1d186ec484587caa63b1c1a3cceb13710d96134c4290f61ad5'
    if len(baseline) != 4096 or hashlib.sha256(baseline).hexdigest() != expected:
        raise SystemExit('Unexpected baseline ROM')
    source = (root / 'tinybasicvb-recordfix.f8').read_text()
    old = ('\t\tLM\t\t\t;LOAD A CHAR\n'
           '\t\tXDC\t\t\t;GET BUFF ADDR\n'
           '\t\tST\t\t\t;STORE CHAR\n'
           '\t\tNI\t$80\t\t;LAST CHAR ?')
    anchor = '\t\tORG\t$1FFF'
    if source.count(old) != 1 or source.count(anchor) != 1:
        raise SystemExit('Unexpected baseline source')
    source = source.replace(old, '\t\tJMP\tSTRCOPY\n\t\tNOP\n\t\tNOP')
    helper = ('\t\tORG\t$1F00\n'
              'STRCOPY\t\tLM\t\t\t;READ STORED CHARACTER AND END MARKER\n'
              '\t\tXDC\n'
              '\t\tLR\t4,A\t\t;R4 IS RELOADED BEFORE EXPRESSION RETURN\n'
              '\t\tNI\t$7F\n'
              '\t\tST\t\t\t;BUFFER HOLDS UNMARKED ASCII\n'
              '\t\tLR\tA,4\n'
              '\t\tNI\t$80\t\t;KEEP THE ORIGINAL LOOP TERMINATION TEST\n'
              '\t\tJMP\tSTRCOPYRET\n'
              'STRCOPYRET\tEQU\t$17C3\n\n')
    source = source.replace(anchor, helper + anchor)
    variant = 'cancelfix' if args.cancelfix else 'inputfix' if args.inputfix else 'stringfix'
    if args.inputfix:
        old_back = 'GET3\t\tLI\t<-1\t\t;BACKUP\n\t\tADC\t\t\t;DC0'
        if source.count(old_back) != 1:
            raise SystemExit('Unexpected backspace source')
        source = source.replace(old_back, 'GET3\t\tJMP\tGETBACK\t\t;GUARD EMPTY BUFFER')
        guard = ('\t\tORG\t$1F20\n'
                 'GETBACK\t\tLR\tA,7\n'
                 '\t\tCI\t72\t\t;NO CHARACTERS ENTERED\n'
                 '\t\tBZ\tGETEMPTY\n'
                 '\t\tLI\t<-1\n'
                 '\t\tADC\n'
                 '\t\tJMP\tGET3+3\n'
                 'GETEMPTY\tJMP\tGET2A\n\n')
        source = source.replace(anchor, guard + anchor)
    if args.cancelfix:
        old_cancel = ('GET4\t\tCI\t$7D\t\t;DELETE LINE ?\n'
                      '\t\tBNZ\tGET5\t\t;B IF NOT ALT-MODE\n'
                      '\t\tPI\tTTCR\t\t;OUTPUT CR LF')
        if source.count(old_cancel) != 1:
            raise SystemExit('Unexpected cancellation source')
        source = source.replace(old_cancel, old_cancel.replace('PI\tTTCR', 'PI\tCANCELRESET'))
        cancel = ('\t\tORG\t$1F40\n'
                  'CANCELRESET\tLI\t72\t\t;RESTORE FULL INPUT CAPACITY\n'
                  '\t\tLR\t7,A\n'
                  '\t\tJMP\tTTCR\n\n')
        source = source.replace(anchor, cancel + anchor)
    output_dir = root.parents[1] / 'build' / 'tinybasic' / variant
    output_dir.mkdir(parents=True, exist_ok=True)
    source_path = output_dir / f'tinybasicvb-{variant}.f8'
    source_path.write_text(source, encoding='ascii')
    output = output_dir / f'TINYBASICVB-expanded-{variant}.bin'
    subprocess.run([str(args.dasm.resolve()), str(source_path), '-f3',
                    f'-o{output}', f'-l{output.with_suffix(".lst")}',
                    f'-s{output.with_suffix(".sym")}'], cwd=root, check=True)
    rom = output.read_bytes()
    expected_rom = bytearray(baseline)
    if baseline[0x7BE:0x7C3] != bytes.fromhex('16 2C 17 21 80'):
        raise SystemExit('Unexpected string-copy site')
    helper_bytes = bytes.fromhex('16 2C 54 21 7F 17 44 21 80 29 17 C3')
    if baseline[0xF00:0xF00 + len(helper_bytes)] != b'\xFF' * len(helper_bytes):
        raise SystemExit('String helper space is occupied')
    expected_rom[0x7BE:0x7C3] = bytes.fromhex('29 1F 00 2B 2B')
    expected_rom[0xF00:0xF00 + len(helper_bytes)] = helper_bytes
    if args.inputfix:
        guard_bytes = bytes.fromhex('47 25 48 84 07 20 FF 8E 29 10 F8 29 10 EB')
        if baseline[0xF5:0xF8] != bytes.fromhex('20 FF 8E'):
            raise SystemExit('Unexpected backspace site')
        if baseline[0xF20:0xF20 + len(guard_bytes)] != b'\xFF' * len(guard_bytes):
            raise SystemExit('Input helper space is occupied')
        expected_rom[0xF5:0xF8] = bytes.fromhex('29 1F 20')
        expected_rom[0xF20:0xF20 + len(guard_bytes)] = guard_bytes
    if args.cancelfix:
        cancel_bytes = bytes.fromhex('20 48 57 29 1C 4D')
        if baseline[0x125:0x128] != bytes.fromhex('28 1C 4D'):
            raise SystemExit('Unexpected cancellation site')
        if baseline[0xF40:0xF46] != b'\xFF' * 6:
            raise SystemExit('Cancellation helper space is occupied')
        expected_rom[0x125:0x128] = bytes.fromhex('28 1F 40')
        expected_rom[0xF40:0xF46] = cancel_bytes
    if rom != expected_rom:
        raise SystemExit('Unexpected changes outside the selected corrections')
    print(f'Verified {variant} changes; CRC32 {zlib.crc32(rom):08X}')
    print(output)


if __name__ == '__main__':
    main()
