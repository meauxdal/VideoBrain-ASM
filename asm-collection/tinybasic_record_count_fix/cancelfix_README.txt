VideoBrain Tiny BASIC - cancelled-line capacity reset (experimental)

ROM: TINYBASICVB-expanded-cancelfix.bin
CRC32: F3BFF3D3
Includes tested stringfix and empty-buffer backspace guard. No PRINT
bank experiment. Hardware test 20 passes: 14, then 3. Use this variant
for further phase 1 checks; preserve the earlier ROMs as references.
Hardware tests 21 and 22 also pass: excess input is discarded and recursive
GOSUB reports SORRY, displays its source location, and recovers for PRINT 3.

GET4 resets DC0 to BUFF through GET1, but leaves R7 at the old remaining
capacity. After cancelling 64 X characters, only eight bytes remain;
overflow handling discards characters until the line becomes PRINT 2.
Test 20 confirms output 2, 3 instead of 14, 3 on inputfix FC982273.

CANCELRESET restores R7 to 72 before the original newline operation.
Relative to inputfix, only the call target at $1125 and the six-byte
helper at $1F40 change. Old X characters remain on earlier display rows;
SPECIAL cancels the input buffer and starts a new line, not a new screen.

Build with Python 3 and an F8-capable DASM:

python build_tinybasic_stringfix.py --cancelfix --dasm <path-to-dasm>

Source, ROM, listing, and symbols go to build/tinybasic/cancelfix in the
repository. The builder checks every byte against the original ROM plus
the selected string, backspace, and cancellation corrections.

Load with 4K RAM fallback. Test 20 produces 14, then 3. No Quartus build
is required.
