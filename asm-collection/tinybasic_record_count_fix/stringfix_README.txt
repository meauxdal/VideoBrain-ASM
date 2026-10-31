VideoBrain Tiny BASIC - string-buffer marker correction (experimental)

Base CRC32: D40A8E2B
Test ROM: TINYBASICVB-expanded-stringfix.bin
Test CRC32: 34207B22

BUFTOV sets bit 7 on the final stored character. XP41 copies that bit
into BUFF unchanged; PRTSTG then passes it to ASCII-to-VBCII conversion,
which falls back to the default glyph. Hardware shows H plus a
crosshair-like glyph for HI, while LEN(0) correctly reports 2.

STRCOPY masks bit 7 when writing BUFF and tests the original byte to
end the loop. R4 is temporary; XP42 reloads it before returning. The
stored representation and string length are unchanged. The final JMP
changes A, but continuation uses only the flags before reloading A.

This ROM is based on recordfix and does not include the PRINT bank
experiment. Changes are confined to $17BE-$17C2 and $1F00-$1F0B.

Build with Python 3 and an F8-capable DASM:

python build_tinybasic_stringfix.py --dasm <path-to-dasm>

Generated source, ROM, listing, and symbols go to build/tinybasic/stringfix
in the repository. The builder checks all bytes against the baseline
plus the expected string-copy changes.

Hardware-confirmed: 13-strings.vbk produces HI, 2, READY, and
13b-string-lengths.vbk produces A, ABC, ABCD, 4, READY. Use this variant
with 4K RAM fallback for further phase 1 checks. Both files replace the
current program. Other recordfix test results retain their original CRC.
Tests 16 and 17 also pass on this variant: string INPUT, ABS, integer
division, and true/false equality. Input-editing limits remain unverified.
Test 19 passes: multiple statements print 2, 3, DONE. Test 18 confirms
BACK on an empty input line fails; see inputfix_README.txt for a separate
candidate retaining this string correction.
No Quartus build is required.
