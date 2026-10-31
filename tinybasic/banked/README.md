# Tiny BASIC 24x15 integration

Build from the assembly repository root:

```sh
python tinybasic/banked/build.py --dasm tools/dasm.exe
```

Output: `build/tinybasic/banked/tinybasic-24x15.bin`, 16 KiB.
Current CRC32: `2CCEBD9A`. Use **Mapper Fallback -> BASIC**, then reset.
The combined mapping probe (`5E00141E`) passes on hardware. The integrated
interpreter is assembled; simulation and hardware acceptance are pending.

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
| 6 | BIOS keyboard scanning and BASIC character translation |
| 7 | Bank transfer destinations |

| Workspace | Contents |
| --- | --- |
| `3000-3BFF` | Preserved 3 KiB BASIC program area |
| `3C00-3CFF` | Preserved variables, input buffer, and software stack |
| `3D00-3E7F` | Bank call/return runtime and transfer instruction |
| `3E80-3EB7` | Keyboard register snapshot |
| `3F00-3F3F` | Bank runtime state |
| `3F40-3F9F` | 32 bank call frames |
| `3FA0-3FD7` | Console register snapshot |
| `3FF0-3FFF` | Console and keyboard state |

The RAM runtime executes across bank switches. Cross-bank calls retain
the caller's bank and return address separately from BASIC's software
stack; jumps preserve the existing return path. Console operations save
interpreter registers and data counters, including scratch bank 5 used by
the glyph merger. Input retains BASIC's SHIFT toggle, NEXT, BACK, and
SPECIAL meanings. The underline cursor is two pixels high in symbol mode
and one pixel high in letter mode.

Begin acceptance with arithmetic, stored program entry/LIST/RUN, mixed
strings and numbers, and BACK across a 24-column boundary. Then rerun the
existing language, cancellation, input-limit, and stack-limit keyboard
files. Check that prompts and error locations remain readable while
scrolling. Interpreter integration has not yet passed these checks.

The interpreter and Timeshare reference are attributed to
[Sean Riddle's VideoBrain research](https://seanriddle.com/videobrain.html).
