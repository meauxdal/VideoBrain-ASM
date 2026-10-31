# Tiny BASIC

## Phase 1 baseline

`baseline/tinybasic.f8` is the complete, assembled source of the tested
`F3BFF3D3` variant. Its matching `baseline/tinybasic.bin` is preserved.
This version includes string-marker cleanup, empty-input backspace protection,
and cancelled-line capacity reset. It does not include the PRINT bank patch.
Use Mapper Fallback -> 4K RAM.

Build and compare all 4,096 bytes with the preserved image:

```sh
python tinybasic/baseline/build.py --dasm <path-to-dasm>
```

Output goes to `build/tinybasic/baseline`. The source and two include files
are self-contained; no intermediate ROMs or patch scripts are needed.

[Validation results and refactor contracts](../asm-collection/tinybasic_record_count_fix/LEARNINGS.md)
distinguish tested behavior from source findings and remaining coverage.
The original imported sources and incremental fixes remain preserved.

## Phase 2 display

The Timeshare reference is a 24-column, 15-row bitmap layout with 6-pixel
character cells and a 5-by-7 font. It uses internal RAM and cartridge RAM;
the BASIC expansion-RAM mapper cannot provide that display unchanged.
See `timeshare/DESIGN.md` for the mapping and integration constraints.

The combined BASIC mapping probe passes on hardware. The
[banked 24x15 interpreter](banked/README.md) is assembled; integrated
simulation and hardware acceptance are pending.
