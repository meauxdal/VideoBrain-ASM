# Tiny BASIC

All of this starts from Jerry D. Fox's Tiny BASIC for the F8 (Dr. Dobb's #39, October 1979) as ported to the VideoBrain by Sean Riddle in 2012.

## Baseline

`baseline/tinybasic.f8` is the complete source of the F3BFF3D3 build: the port with string-marker cleanup, empty-input backspace protection and cancelled-line capacity reset (no PRINT bank patch). It is a 4 KB cartridge and needs 4K of expansion RAM at $3000-$3FFF (Mapper Fallback -> 4K RAM). The source and its two include files are self-contained.

Build and compare all 4,096 bytes with the saved image (output goes to `build/tinybasic/baseline`):

```sh
python tinybasic/baseline/build.py --dasm <path-to-dasm>
```

The earlier fixes and their test results are in [asm-collection/tinybasic_record_count_fix](../asm-collection/tinybasic_record_count_fix/LEARNINGS.md).

## Enhanced 2.0

[Tiny BASIC Enhanced](banked/README.md) is a 16 KB banked cartridge with a 24x15 text display modeled on Timeshare's layout, plus tape LOAD and SAVE. It has eight 2 KB banks at $1000-$17FF: 0 boot, 1-4 interpreter, 5 console, 6 keyboard, 7 dispatch. On the MiSTer core, LOAD, LIST and RUN work from tape.

## Timeshare display

Timeshare uses a 24-column, 15-row bitmap layout with 6-pixel character cells and a 5x7 font, in internal RAM and cartridge RAM; the BASIC expansion-RAM mapper can't provide it unchanged. [timeshare/DESIGN.md](timeshare/DESIGN.md) covers the mapping. The display and console probes in `timeshare/` were used to develop the layout, and the combined BASIC mapping probe runs on the MiSTer core.
