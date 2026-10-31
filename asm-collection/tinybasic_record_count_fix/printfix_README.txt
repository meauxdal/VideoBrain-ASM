VideoBrain Tiny BASIC - PRINT continuation correction (experimental)

Base CRC32: D40A8E2B
Test ROM: TINYBASICVB-expanded-printfix.bin
Test CRC32: BC23A460

Status: the original mixed-output VBK entered the wrong separator
(observed as / on hardware). This ROM gave the same WHAT errors with that
input. The corrected VBK passes on baseline D40A8E2B. This patch is not
required by the mixed-output test result and is not the working baseline.

Character output leaves upper ISAR at 7. After a PRINT comma, PRNEXT
selects bank 2 before FINISH reads the following item. Expression
evaluation then uses the interpreter's R16-R23 scratch registers.

The assembled ROM changes six bytes: the two target bytes of the call
at $13BE and a four-byte helper at $1F00. The baseline ROM is unchanged.

Build with Python 3 and an F8-capable DASM:

python build_tinybasic_printfix.py --dasm <path-to-dasm>

The generated source, ROM, listing, and symbols are under
build/tinybasic/printfix in the repository. The builder checks every
ROM byte against the baseline plus the expected call and helper.

Load the test ROM with 4K RAM fallback. Run the mixed-output VBK again:

PRINT "A",1
PRINT 1,2
PRINT "B",2+3

Expected with valid commas: A then 1; 1 then 2; B then 5, with no WHAT.
Leading numeric spaces are allowed. Correct-input hardware validation
is pending. No Quartus build.
