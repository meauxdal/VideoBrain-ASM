# VideoBrain ASM

Annotated disassembly and analysis tools for VideoBrain software.

## Tiny BASIC

[Enhanced development status and tape troubleshooting](TINYBASIC-PROGRESS.md).

[Preserved tested baseline and Timeshare display work](tinybasic/README.md).
The phase 1 source rebuilds byte-for-byte to CRC32 F3BFF3D3. The separate
24x15 display probe passes on MiSTer with the Timeshare mapper.

## ASM collection

[Historical listings and source](asm-collection/README.md), with additional
comments on Financier's missing ROM window, the RES1 bitmap routine,
Expander I code matches, and cartridge text. These listings have not all
been verified by assembly; the Information Manager checks below apply only
to Information Manager.

## Information Manager

- [Annotated VB-1200 listing](infoman/infoman.lst), September 25/26, 1978.
- [Buildable DASM F8 source](infoman/infoman.asm), verified against the original cartridge.
- [Listing generator](tools/disassemble_infoman.py), using MAME unidasm's F8 backend.
- [Assembly source generator](tools/make_infoman_asm.py), using the verified listing.
- [User manual](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN-MANUAL.md) and [research notes](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN.md) in VideoBrain_MiSTer.

The listing retains addresses and raw bytes. The assembly source retains its annotations and labels, with additional notes on the optional printer corrections. It preserves the original ROM bytes; no corrections are applied. Comments distinguish traced behavior from remaining runtime questions.

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
