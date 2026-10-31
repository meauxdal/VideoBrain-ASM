#!/usr/bin/env python3
"""Restore original record-length calculation in VideoBrain Tiny BASIC."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
import zlib

root = Path(__file__).resolve().parent
source_rom = root / 'TINYBASICVB-expanded-runbank.bin'
before = source_rom.read_bytes()
assert len(before) == 4096 and zlib.crc32(before) == 0xDC9724E6
rom = bytearray(before)

def patch(addr, expected, replacement):
    expected, replacement = bytes.fromhex(expected), bytes.fromhex(replacement)
    assert len(expected) == len(replacement)
    ofs = addr - 0x1000
    assert rom[ofs:ofs + len(expected)] == expected, f'unexpected ROM bytes at {addr:04X}'
    rom[ofs:ofs + len(replacement)] = replacement

# ST3 calls PUSHDC while DC0 points to the first character of the line
# number. PUSHDC records that address in R10:R11. Replacing the line
# number with two binary bytes advances DC0, not R10:R11. Thus:
#   count = EOL - saved beginning of line
# The earlier '+2' counted the header twice and left a two-byte gap
# after every stored record, which LIST/RUN then misread as more lines.
patch(0x106E, '29 1E D0 2B 2B', '4B 18 1F C6 56')
patch(0x1ED0, '4B 18 1F C6 24 02 56 29 10 73', 'FF FF FF FF FF FF FF FF FF FF')

out = root / 'TINYBASICVB-expanded-recordfix.bin'
out.write_bytes(rom)
crc = zlib.crc32(rom)
changed = {0x1000 + i for i,(a,b) in enumerate(zip(before,rom)) if a != b}
assert all(0x106E <= a <= 0x1072 or 0x1ED0 <= a <= 0x1ED9 for a in changed)

src = (root / 'tinybasicvb-runbank.f8').read_text()
old = '''\t\tJMP\tLINECOUNT\t;INCLUDE TWO-BYTE LINE HEADER
\t\tNOP
\t\tNOP
LINECOUNTRET\tPI\tFNDLN'''
new = '''\t\tLR\tA,11\t\t;BEGINNING OF LINE BUFFER (SAVED BY PUSHDC)
\t\tCOM
\t\tINC
\t\tAS\t6\t\t;EOL - BOL, INCLUDING BINARY HEADER
\t\tLR\t6,A
\t\tPI\tFNDLN'''
assert src.count(old) == 1
src = src.replace(old, new)
old_cave='''\t\tORG\t$1ED0
LINECOUNT\tLR\tA,11\t\t;END OF LINE BUFFER ADDRESS
\t\tCOM
\t\tINC
\t\tAS\t6
\t\tAI\t2\t\t;COUNT BINARY LINE NUMBER HEADER
\t\tLR\t6,A
\t\tJMP\tLINECOUNTRET

'''
assert src.count(old_cave) == 1
src = src.replace(old_cave, '')
source = root / 'tinybasicvb-recordfix.f8'
source.write_text(src)

readme = root / 'tinybasic_recordfix_README.txt'
readme.write_text(f'''VideoBrain Tiny BASIC - stored-record count correction (experimental)

Base: TINYBASICVB-expanded-runbank.bin (CRC32 DC9724E6)
New:  TINYBASICVB-expanded-recordfix.bin (CRC32 {crc:08X})

In ST3, PUSHDC saves the start of the line in R10:R11. The two ST
instructions overwrite the ASCII line number with its two-byte binary
form but do not change R10:R11. The original count, EOL - R11 (low byte),
already includes the two header bytes. A previous patch added 2 and
created a two-byte gap after each line. LIST and RUN could interpret
those bytes as additional lines beyond the final valid record.

The original five-instruction count is restored and the unused helper
removed. All other runbank ROM fixes are retained. No RTL changes.

Load the ROM using Mapper Fallback -> 4K RAM. Enter NEW first to
discard any program records stored using the broken length format.
Then test:
10 PRINT "HI"
20 PRINT "BYE"
LIST
RUN

Expected: LIST shows only lines 10/20; RUN prints HI and BYE, returns
READY, and does not show WHAT or a bogus third line.

This is a static source/byte-level fix; it has not been hardware-tested.
Rebuild: python build_tinybasic_record_count_restore.py
''')
archive = root / 'tinybasic_record_count_fix.zip'
with ZipFile(archive, 'w', ZIP_DEFLATED) as z:
    for p in (out, source, root/'VBBIOS.ASM', root/'VBCHARS.ASM',readme,Path(__file__)):
        z.write(p, p.name)

print('ROM:',out)
print('CRC32: %08X' % crc)
print('Changed addresses:', ' '.join(f'{i:04X}' for i in sorted(changed)))
print('Package:',archive)
