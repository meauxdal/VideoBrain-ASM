# Tiny BASIC Enhanced 1.0

Build from the assembly repository root:

```sh
python tinybasic/banked/build.py --dasm tools/dasm.exe
```

Output: `build/tinybasic/banked/tinybasic-24x15.bin`, 16 KiB.
Current CRC32: `425E4F8E`. Use BASIC profile 6 in VBC files, or
**Mapper Fallback -> BASIC** for raw images, then reset.
The combined mapping probe (`5E00141E`) passes on hardware. Native F8
simulation passes startup, character echo, NEXT, letter/symbol toggling,
cursor checks, arithmetic precedence (`14`), parentheses (`20`), and stored
program entry/RUN (`OK`). MiSTer confirms the 24x15 display, keyboard editing,
stored line entry, GOTO abbreviation (`G.`), RUN, and repeated string PRINT
output in version 0.5. Version 0.6 is hardware-confirmed on DE10-Nano for
sustained GOTO looping, recursive GOSUB exhaustion, and SORRY recovery.
Broader language and memory-limit checks remain.

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
smoke acceptance remain pending. Run the language checks with:

```sh
sh tinybasic/banked/test_print.sh CORE_DIRECTORY RES1_ROM RES2_ROM
```

The language-only PRINT checks skip drawing while retaining console
register save/restore and its ISAR exit state.

INPUT restores scratch bank 2 after reading the keyboard buffer, before
evaluating the entered value. INPUT, expression INPUT and smoke regressions
are pending. Run those cases with:

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
dispatch stubs; all eight banks have identical `1700-17FF` contents.
The original interpreter source and baseline ROM remain unchanged.

| Banks | Contents |
| --- | --- |
| 0 | Startup and RAM runtime image |
| 1-4 | Interpreter and repeated keyword/error tables |
| 5 | Timeshare renderer, cursor, scrolling, and output operations |
| 6 | BIOS keyboard scanning, BASIC character translation and serial output |
| 7 | Bank transfer destinations |

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
