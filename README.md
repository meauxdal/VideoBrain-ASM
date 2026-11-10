# VideoBrain ASM

Annotated disassembly and analysis tools for VideoBrain software.

## Tiny BASIC

[Enhanced development status and tape troubleshooting](TINYBASIC-PROGRESS.md).

[Baseline, Enhanced 2.0 and Timeshare display work](tinybasic/README.md). The baseline source rebuilds byte-for-byte to CRC32 F3BFF3D3.

## ASM collection

[Historical listings and source](asm-collection/README.md), with added comments on Financier's missing ROM window, the RES1 bitmap routine, Expander I code matches and cartridge text.

## Diagnostics

[Hardware and simulator diagnostics](diagnostics/README.md): DAC, self-test, joystick, timing and Information Manager test material, with sources and rebuild steps.

## Information Manager

- [Annotated VB-1200 listing](infoman/infoman.lst), September 25/26, 1978.
- [Buildable DASM F8 source](infoman/infoman.asm), verified against the original cartridge.
- [Listing generator](tools/disassemble_infoman.py), using MAME unidasm's F8 backend.
- [Assembly source generator](tools/make_infoman_asm.py), using the verified listing.
- [User manual](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN-MANUAL.md) and [research notes](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN.md) in VideoBrain_MiSTer.

The listing retains addresses and raw bytes. The assembly source retains its annotations and labels, with additional notes on the optional printer corrections. It preserves the original ROM bytes; no corrections are applied.

## Generate the listing

Requires Python 3, MAME unidasm with F8 support, and your local infoman.zip chip archive:

```text
python tools/disassemble_infoman.py --unidasm <path-to-unidasm> --rom <path-to-infoman.zip>
```

The output defaults to infoman/infoman.lst. Use --output to select another path. Address-based comments live in the generator's NOTES table so regeneration preserves them. The generator checks chip hashes, instruction overlap and coverage of all 6,144 ROM bytes. Original ROM archives are not included.

## Generate and assemble the source

Requires Python 3 and DASM with F8 support. From this repository:

```text
python tools/make_infoman_asm.py --dasm <path-to-dasm>
```

This regenerates `infoman/infoman.asm`, builds `build/infoman.bin`, and checks every output byte against the listing and the original cartridge SHA256. Omit `--dasm` to generate only the source. No ROM archive or unidasm is needed for this step; the listing's three chip hashes are checked before conversion.

To assemble the source directly on Windows, create `build` and run:

```text
dasm infoman\infoman.asm -f3 -obuild\infoman.bin -R
```

On Linux, use forward slashes. The raw 8,192-byte cartridge contains the three original chips and a 2 KB zero-filled gap. Its SHA256 is `9b580726ad5d899a316901ad4513622a9e66e8131da3d6ac3de40180a2200d8f`.

See the [printer correction notes](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN.md#printer-corrections) for the separate optional patches.

## Export for sharing

`python tools/export_asm.py` produced the shared package of 2026-11-09 from [export/manifest.json](export/manifest.json): ASM files flattened into the column layout of Sean Riddle's listings, each one checked to reassemble to its original binary. The package was then edited by hand, so the script, manifest and [export/STATE.json](export/STATE.json) no longer match it; the cleaned comments and notes were copied back into this repository.
