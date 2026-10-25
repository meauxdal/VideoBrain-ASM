# VideoBrain ASM

Annotated disassembly and analysis tools for VideoBrain software.

## Information Manager

- [Annotated VB-1200 listing](infoman/infoman.lst), September 25/26, 1978.
- [Listing generator](tools/disassemble_infoman.py), using MAME unidasm's F8 backend.
- [User manual](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN-MANUAL.md) and [research notes](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/INFOMAN.md) in VideoBrain_MiSTer.

The listing retains addresses and raw bytes. It is a disassembly listing, not an assembler source. Comments distinguish traced behavior from remaining runtime questions.

## Generate the listing

Requires Python 3, MAME unidasm with F8 support, and your local infoman.zip chip archive:

```text
python tools/disassemble_infoman.py --unidasm <path-to-unidasm> --rom <path-to-infoman.zip>
```

The output defaults to infoman/infoman.lst. Use --output to select another path. Address-based comments live in the generator's NOTES table so regeneration preserves them. The generator checks chip hashes, instruction overlap and coverage of all 6,144 ROM bytes. Original ROM archives are not included.
