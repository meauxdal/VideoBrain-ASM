# Tiny BASIC Enhanced

## 1.9

The required host-line reset before a tape command is restored. Transport
failures now report command, data or final-completion phase on screen, so a
remaining hardware failure identifies its exact boundary. Hardware confirms a
complete two-record SAVE with valid CRCs; restart/LOAD remains pending.

## 1.8

Tape transfer setup and completion now follow the working Information Manager
and Money Minder lifecycle directly. Stops during byte transfer are failures;
the dedicated completion interrupt handles the final status and releases the
host lines. Extra reset and success-release pulses were removed. Hardware
confirmation failed: recording never started on a fresh blank image.

## 1.7

The tape byte interrupt used one Expander status snapshot for both stop and
completion status. Hardware still stopped after the first valid record.

## 1.6

An already received stop retains its transfer status during completion handoff.
This corrects a path that rejected a clean stop after writing a valid record.
Hardware testing still stopped after one valid record because the completion
status was sampled twice. See [current progress](../../TINYBASIC-PROGRESS.md).

## 1.5

Tape transfers wait separately for byte completion and peripheral stop.
The completion interrupt uses the Information Manager/Money Minder handler.
Normal completion releases the host lines; failed transfers reset them.

## 1.4

CLS clears the screen and homes the cursor without changing the program,
variables, colors or SHIFT mode. MOVE column,row positions the cursor using
zero-based character coordinates: columns 0-23, rows 0-14. Both coordinates
accept expressions; out-of-range values report HOW. CL. and MOV. are the
unambiguous abbreviations. Both commands work directly and in programs.
They affect the screen; serial mirroring remains a plain text stream.

## 1.3

SHIFT+T and SHIFT+Y enter < and >, using Timeshare positions with BASIC's
SHIFT toggle. GE, GT, LE and LT remain supported.

TCOLOR expression sets all displayed text to the direct UV201 color value
0-31. TC. uses the standard keyword abbreviation. Existing
text changes color as well. The cursor retains its own color. Values outside
0-31 report HOW. The color survives scrolling and console refresh; startup
selects 23. Text color is stored at 3FFD. COLOR retains direct background values.


VERI reads and validates a tape without changing the current program, following
APL/S's command meaning. COMP also requires the tape program to match the
current program byte for byte, including its length. Rewind playback before
each command. Both report TAPE OK or TAPE ERROR and preserve program memory
and its boundary on success and failure. Like SAVE and LOAD, they are direct
commands and require Expander firmware.

VERI checks record headers, CRCs, consecutive offsets, the program boundary
and line structure across record boundaries. COMP checks the same record
headers and CRCs, then compares program bytes with memory.

DUPE copies the next saved Tiny BASIC program from playback to record,
without changing the program in memory. Mount different source and writable
destination images. Rewind playback and, to replace the destination, rewind
record before DUPE. Validated records are forwarded unchanged, including
padding and CRC. TAPE OK means the complete program was copied; TAPE ERROR
may leave a partial destination. Wait for the record deck to become idle
before unmounting. This copies BASIC records, not arbitrary cartridge tapes
or the original waveform timing.

## 1.2

GE, GT, LE and LT are aliases for >=, >, <= and <.
They use the existing expression precedence and comparison handlers. Symbol
operators remain supported. `COLOR expression` sets the background to 0-31;
out-of-range values report HOW. COLOR works directly and in stored programs.
Native single- and multi-record SAVE/LOAD round trips pass. Hardware confirms
VBK entry, SAVE, core reload, playback-only mounting, LOAD, LIST and RUN for a
39-byte INPUT program in one record. The payload CRC is valid (`729E`).

Hardware checks: `34-relational-aliases.vbk` and `35-background-color.vbk` in
the core's Tiny BASIC examples. Run focused native F8 checks with:

```sh
sh tinybasic/banked/test_extensions.sh CORE_DIRECTORY RES1_ROM RES2_ROM
```

SAVE and LOAD are direct commands. They save program text, including REM and
DATA lines; numeric variables, strings and arrays are not saved. Load Expander
firmware, mount a writable record tape and enter SAVE. After TAPE OK and the
record deck becoming idle, mount that image for playback, rewind and enter
LOAD. LIST and RUN check the restored program. Empty programs are supported.

Both commands report TAPE OK on completion or TAPE ERROR on failure and return
to READY. LOAD checks the record identifier, version, length, program boundary,
offset, checksum and line structure. A failed LOAD clears the program boundary,
including when earlier records have already overwritten program memory.
SAVE leaves the program intact. The transfer has a bounded timeout and restores
the keyboard/serial interrupt setup. The core's Tape error notice also applies.

Each record contains a big-endian length of 64, then `TB`, version 1, a zero
reserved byte, the program end address, the chunk address (both big-endian),
and 56 program bytes padded with zero. CRC-16/CCITT starts at zero and covers
the length and payload; its low byte is written first. Program addresses are
restricted to 3000-3BFF, with an exclusive end no greater than 3C00. Records
must be consecutive and agree on the end address. This is a BASIC-specific
format using the Information Manager/Money Minder transfer protocol.

The transfer buffer occupies 3EB8-3EFB; state uses 3F24-3F2D. Tape operations
preserve the interpreter registers in the console snapshot at 3FA0-3FD7.
The record codec and byte interrupt are in banks 0 and 7, respectively.

Prepare a separate codec-only image and run native tests:

```sh
python tinybasic/banked/prepare_tape_test.py --dasm tools/dasm.exe build/tinybasic/banked/tinybasic-tape-codec.test.bin
sh tinybasic/banked/test_tape.sh CORE_DIRECTORY RES1_ROM RES2_ROM
```

The test transport exercises native SAVE/LOAD, checksums, multiple records,
empty programs, corrupt data and malformed headers/programs. VERI and COMP
cases also check that all program memory and its boundary remain unchanged. It does not test
Expander firmware timing. A second test image shortens the production timeout
to exercise missing-firmware error handling. Do not deploy `.test.bin` images.

Test SAVE with the original Expander firmware and capture its waveform with:

```sh
sh tinybasic/banked/test_save.sh CORE_DIRECTORY RES1_ROM RES2_ROM EXPANDER_ROM
```

Logs, serial output and cassette edges are in `verilator/out/tinybasic-save`.

`TBE_SAVE_FAST=true` skips console drawing and shortens the tape startup delay.
Set `TBE_SAVE_FAST_TAPE_DELAY=false` to retain the production tape delay while
skipping drawing. These native tests do not model UV202 CPU bus stalls.

TODO: Multi-record hardware round trips, blank/truncated/corrupt recordings, absent Expander
firmware, serial output after transfer, and recovery at READY.

BIOS clock commands are deferred; BASIC reuses the clock's scratch
registers, so TIME/DATE need a separate preserved clock state.

References: Information Manager `3BEE-3DD9` (record transfer and checksum),
`3CB5` (byte interrupt); Money Minder `1AC5-1C88` and `1BB7`. Public sources:
[Sean Riddle's VideoBrain research](https://seanriddle.com/videobrain.html);
[APL/S guide](https://orphanedgames.com/videobrain/manuals/APL-S/APL-S-The_Computational_Language_%28197x%29%28Tri-Fold_Guide%29%28Umtech_VideoBrain_Family_Computer%29.pdf).

## Build and 1.0 acceptance

Build from the assembly repository root:

```sh
python tinybasic/banked/build.py --dasm tools/dasm.exe
```

Release files under `build/tinybasic/banked` are named
`Tiny BASIC Enhanced v1.9 (2026.11.03) (Elle Ball).bin` and `.vbc`.
The VBC selects the BASIC mapper. The raw image is 16 KiB.
The shorter `tinybasic-24x15` filenames are retained for the test scripts.
Released 1.0 CRC32: `425E4F8E`. Development builds print their CRC32.
Use BASIC profile 6 in VBC files, or
**Mapper Fallback -> BASIC** for raw images, then reset.
The combined mapping probe (`5E00141E`) passes on hardware. Native F8
simulation passes startup, character echo, NEXT, letter/symbol toggling,
cursor checks, arithmetic precedence (`14`), parentheses (`20`), and stored
program entry/RUN (`OK`). MiSTer confirms the 24x15 display, keyboard editing,
stored line entry, GOTO abbreviation (`G.`), RUN, and repeated string PRINT
output in version 0.5. Version 0.6 is hardware-confirmed on DE10-Nano for
sustained GOTO looping, recursive GOSUB exhaustion, and SORRY recovery.
Version 1.0 hardware acceptance confirms smoke, a complete Nim game,
corrected inline IF, PRINT layout, array/string aliases, LIST/STOP, and
expression INPUT. Lunar Lander reaches SAFE LANDING; Treasure Maze completes.
Pig Dice reaches its seed prompt. Both serial sessions are clean with zero
error counters. Boundary editing and memory-limit checks remain.

Startup displays the Enhanced version and 3072 bytes free for programs and
arrays. The count is derived from the interpreter's program-area boundaries;
variables, input buffer, and stacks are reserved separately. Version 0.7
startup and language regressions passed in native F8 simulation.

Version 0.8 mirrors console output to both Expander 1 serial ports at 300
baud, with CR/LF line endings. Load Expander firmware before the cartridge.
Missing or unresponsive firmware disables serial output through a bounded
timeout. BIOS keyboard scanning retains the serial idle mark. Output is
synchronous and slows screen output to the serial rate. Native F8 serial
regression passes; hardware captures confirm text output at 300 baud.

Version 0.9 restores scratch bank 2 after a PRINT comma before evaluating
the next item. Output leaves ISAR in bank 7, which the transfer runtime
uses for temporary state. Native F8 numeric and mixed-output PRINT checks
pass. Hardware confirms that the comma freeze is resolved. Layout and
smoke acceptance pass in 1.0. Run the language checks with:

```sh
sh tinybasic/banked/test_print.sh CORE_DIRECTORY RES1_ROM RES2_ROM
```

The language-only PRINT checks skip drawing while retaining console
register save/restore and its ISAR exit state.

INPUT restores scratch bank 2 after reading the keyboard buffer, before
evaluating the entered value. INPUT, expression INPUT and smoke pass on 1.0
hardware. Run those cases with:

```sh
sh tinybasic/banked/test_print.sh CORE_DIRECTORY RES1_ROM RES2_ROM input
```

Run the native startup, serial transcript and mixed-PRINT checks with:

```sh
sh tinybasic/banked/test_serial.sh CORE_DIRECTORY RES1_ROM RES2_ROM EXPANDER_ROM
```

The builder verifies the preserved interpreter (`F3BFF3D3`) and Timeshare
reference (`957D7246`), relocates branch-connected interpreter blocks,
and checks every relocated instruction address. Keyword tables use common
dispatch stubs; all eight banks have identical `16D0-17FF` contents.
The marker at ROM offset 06D0 declares keyboard ABI 1: bank 6 polls at 1009
and reports key acceptance/release at 3FF9. The builder checks these hooks.
Updated cores recognize this marker independently of the complete ROM CRC.
The original interpreter source and baseline ROM remain unchanged.

Branch-connected blocks are packed by size across the interpreter banks.
Keyword tables are placed immediately below common ROM. Command stubs share
dispatch tails; console snapshots use register-copy loops. These loops and
shared tails trade additional branches for ROM space. Each build writes
`build/tinybasic/banked/rom-layout.txt` with code limits and remaining capacity.

| Banks | Contents |
| --- | --- |
| 0 | Startup, RAM runtime image and tape record handling |
| 1-4 | Interpreter and repeated keyword/error tables |
| 5 | Timeshare renderer, cursor, scrolling, and output operations |
| 6 | BIOS keyboard scanning, BASIC character translation and serial output |
| 7 | Bank transfer destinations and tape byte I/O |

| Workspace | Contents |
| --- | --- |
| `3000-3BFF` | Preserved 3 KiB BASIC program area |
| `3C00-3CFF` | Preserved variables, input buffer, and software stack |
| `3D00-3E7F` | Bank call/return runtime and transfer instruction |
| `3E80-3EB7` | Keyboard/serial register snapshot |
| `3F00-3F3F` | Bank runtime state |
| `3F40-3F9F` | 32 bank call frames |
| `3FA0-3FD7` | Console register snapshot |
| `3FF0-3FFF` | Console and keyboard state |

`3FFC` is the serial-enabled flag. Command `04 02 03` selects 300 baud and
routes host data to the modem and printer. The serial wait uses Timeshare's
interrupt-driven host bit transfer, with a timeout when no interrupt arrives.

The RAM runtime executes across bank switches. Cross-bank calls retain
the caller's bank and return address separately from BASIC's software
stack; jumps preserve the existing return path. Console operations save
interpreter registers and data counters, including scratch bank 5 used by
the glyph merger. Input retains BASIC's SHIFT toggle, NEXT, BACK, and
SPECIAL meanings. The underline cursor is two pixels high in symbol mode
and one pixel high in letter mode.

LIST is hardware-confirmed. Remaining acceptance includes mixed strings
and numbers, BACK across a 24-column boundary, and the existing language,
cancellation, input-limit, and stack-limit keyboard files. Check that prompts and error locations
remain readable while scrolling.

The interpreter and Timeshare reference are attributed to
[Sean Riddle's VideoBrain research](https://seanriddle.com/videobrain.html).
