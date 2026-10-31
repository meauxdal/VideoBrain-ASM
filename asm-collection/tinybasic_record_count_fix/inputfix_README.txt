VideoBrain Tiny BASIC - empty-input backspace guard (experimental)

Test ROM: TINYBASICVB-expanded-inputfix.bin
CRC32: FC982273
Includes the tested stringfix correction (CRC32 34207B22).
Does not include the PRINT bank experiment.

Status: hardware tests 18 and 18b pass on this ROM: 12/2 and 3/4.
Earlier failures used the wrong ROM. Use FC982273 for further phase 1
checks. Original recordfix and stringfix remain preserved references.

GET3 unconditionally backed up DC0 and increased the remaining count.
On an empty line this moved before BUFF and allowed the next command
to overwrite STRLGH. Test 18 printed 12 for ordinary editing, then WHAT
after BACK on the empty line.

GETBACK ignores BACK while R7 equals the initial capacity of 72. Otherwise
it performs the original pointer decrement and resumes GET3. The guard
changes only $10F5-$10F7 and $1F20-$1F2D relative to stringfix. Input
cancellation and full-buffer behavior are unchanged and need separate
boundary checks.

Build with Python 3 and an F8-capable DASM:

python build_tinybasic_stringfix.py --inputfix --dasm <path-to-dasm>

Source, ROM, listing, and symbols go to build/tinybasic/inputfix in the
repository. Every output byte is checked against the original baseline
plus the expected string-copy correction and backspace guard.

Load with 4K RAM fallback. The acceptance result for test 18 is
print 12, then 2. Test 18b should print 3, then 4, including repeated BACK
on an empty line and deleting all characters before typing a new command.
No Quartus build is required.
