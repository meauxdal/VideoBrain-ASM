VideoBrain Tiny BASIC - cancelled-line capacity reset (experimental)

ROM: TINYBASICVB-expanded-cancelfix.bin
CRC32: F3BFF3D3
Includes tested stringfix and empty-buffer backspace guard. No PRINT
bank experiment. Hardware validation of cancellation reset is pending.

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

Load with 4K RAM fallback and rerun 20-cancel-line.vbk. Expected output:
14, then 3. No Quartus build is required.
