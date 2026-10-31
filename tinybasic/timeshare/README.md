# Timeshare 24x15 display probe

Build from the assembly repository root:

```sh
python tinybasic/timeshare/build_probe.py --dasm <path-to-dasm>
```

The builder verifies the original Timeshare ROM CRC (`957D7246`), font
geometry, row slots, and a 2 KiB probe image. It uses the original glyph
packing routine from Sean Riddle's Timeshare disassembly. The generated
includes, original/reference ROM, probe ROM, listing, and symbols go to
`build/tinybasic/timeshare`.

Probe ROM: `timeshare-display-probe.bin`, CRC32 `7463DD42`.

Load with **Mapper Fallback -> Timeshare**, then reset. No Expander 1
firmware, VBK file, or Quartus build is needed. This is a separate display
test, not a replacement BASIC ROM. Return to the 4K RAM fallback when
loading the preserved BASIC baseline.

Expected: 15 stable numbered rows, each 24 characters wide:

```text
01 ABCDEFGHIJKLMNOPQRST1
02 ABCDEFGHIJKLMNOPQRST2
...
15 ABCDEFGHIJKLMNOPQRST5
```

The middle rows continue in sequence; the three dots above abbreviate
the example and are not printed. Confirm the first/last rows and the
rightmost digit. Hardware-confirmed with the Timeshare mapper: all 15 rows
render correctly. Using the previous BASIC mapper produced corruption
in exactly the eight cartridge-RAM rows; the seven internal-RAM rows
remained correct. Cursor, keyboard, and scrolling are outside this probe.

See [design and mapping constraints](DESIGN.md) before BASIC integration.

## Cursor and scrolling probe

```sh
python tinybasic/timeshare/build_probe.py --dasm tools/dasm.exe --console
```

Load `build/tinybasic/timeshare/timeshare-console-probe.bin` with
**Mapper Fallback -> Timeshare**, then reset. CRC32: `8257C31E`.
This separate 2 KiB image leaves the confirmed static probe unchanged.

Rows 01 through 30 print one character every four display refreshes.
The cursor should blink below the next character position, move across
all 24 columns, and return to column zero after the rightmost digit.
After row 15, each completed row should scroll upward by one line.
The final display is rows 17 through 30, followed by an empty bottom
line with the cursor at its left edge. Allow about a minute to finish.

Check for leftover pixels in recycled rows, missing or repeated rows,
and cursor movement at the internal/cartridge RAM boundaries. The builder
checks row rotation and the final row order. The console probe passes on
MiSTer with the Timeshare mapper: cursor, wrapping, and scrolling are
hardware-confirmed. Keyboard editing and interpreter integration are not
included.

## BASIC mapping probe

```sh
python tinybasic/timeshare/build_probe.py --dasm tools/dasm.exe --basic
```

Requires a core with the **BASIC** mapper fallback. Load
`build/tinybasic/timeshare/basic-mapping-probe.bin` (16 KiB, CRC32
`5E00141E`), select **Mapper Fallback -> BASIC**, then reset.

The probe checks all eight ROM banks and both ends of workspace RAM,
including cartridge-RAM mirrors across bank changes. A failed check
stops with a red background. Passing checks start the cursor/scrolling
display with rows 01 through 20. The final screen shows rows 07 through
20 and a blank bottom line with the cursor at the left. Reset should
restart the probe normally after it has selected other banks.

The builder verifies bank markers, 2 KiB bank sizes, and identical common
regions at `1700-17FF`. Core simulation covers CPU and DMA access, RAM
independence, and reset behavior. Hardware validation is pending.
