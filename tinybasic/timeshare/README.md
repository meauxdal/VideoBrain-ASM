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
