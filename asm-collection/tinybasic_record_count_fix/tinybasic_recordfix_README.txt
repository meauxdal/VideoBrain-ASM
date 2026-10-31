VideoBrain Tiny BASIC - preserved working baseline

ROM: TINYBASICVB-expanded-recordfix.bin (4096 bytes)
CRC32: D40A8E2B
SHA256: 8da31d819e65bd1d186ec484587caa63b1c1a3cceb13710d96134c4290f61ad5

Load with Mapper Fallback -> 4K RAM. Expansion RAM is $3000-$3FFF.
Hardware-confirmed: NEW, storing lines 10/20, LIST, RUN, quoted HI/BYE
output in order, and clean return to READY. Direct PRINT tests also
confirm 1, -1, 2+3*4 = 14, and (2+3)*4 = 20.
The corrected mixed-output VBK passes on this baseline: A and 1, 1 and 2,
B and 5, with a small numeric spacing gap and no WHAT. The experimental
bank-only PRINT patch is not required by this test result. Other paths
need validation.

Line-editing test: final RUN output A, X is hardware-confirmed after
out-of-order insertion, replacement, and deletion. Exact edited LIST
contents have not been separately confirmed.
Bounded GOTO with variable increment and IF/equality, and default-step
FOR/NEXT are hardware-confirmed: both print 1, 2, 3, DONE, then READY.
GOSUB/RETURN with STOP passes (SUB, BACK). Numeric INPUT passes: input 4
produces 5 from A+1. Both tests return to READY.
DATA/READ/RESTORE passes (7, 9, 7). Division by zero reports HOW and
malformed expressions report WHAT; subsequent commands work without reset.
Negative STEP and nested GOSUB/RETURN pass their hardware checks.
String variables fail to display their final character correctly in
this preserved ROM. Stringfix (CRC32 34207B22) passes tests 13 and 13b,
including odd/even lengths and reassignment. Use it for further phase 1
checks; see stringfix_README.txt. This original baseline remains intact.

The source assembles byte-for-byte to the preserved ROM with DASM
2.20.14.1. Rebuild with Python 3 and an F8-capable DASM:

python build_tinybasic_record_count_restore.py --dasm <path-to-dasm>

Output, listing, and symbols go to build/tinybasic in the repository.
The script verifies every byte against the preserved baseline. No
intermediate ROMs or earlier source packages are required.

The stored-record count includes the two-byte binary line header.
Enter NEW after switching from ROMs that stored an incorrect length.

Phase 1: complete and validate the interpreter with its current display.
Maintain confirmed behavior and refactor contracts in LEARNINGS.md.
See validation.txt for the first hardware checks and expected results.
Pending: exact edited LIST contents, further variables/arithmetic,
further IF/GOTO, deeper loop/subroutine/stack limits, further INPUT,
further DATA cases, strings/arrays, further error recovery, memory limits,
and sustained scrolling/break handling.

Phase 2: refactor for the Timeshare display layout after examining its
font, video objects, framebuffer, cursor, and scrolling routines.
Cartridge budget: 16 KiB. Preserve the phase 1 behavior as a baseline.
