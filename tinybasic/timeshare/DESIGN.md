# Timeshare display integration

## Verified reference

The [Timeshare CM01 disassembly](../../asm-collection/Timeshare_cm01.asm),
attributed to Sean Riddle, assembles to 2,048 bytes with CRC32 `957D7246`.
The builder adds a processor directive and indents the existing ORG;
the original listing remains unchanged. Public reference:
[Sean Riddle's VideoBrain research](https://seanriddle.com/videobrain.html).

The standalone display probe is hardware-confirmed with the Timeshare
mapper: all 24 columns and 15 rows render correctly. The separate console
probe (CRC32 `8257C31E`) also passes on MiSTer with the Timeshare mapper,
confirming cursor, wrapping, and scrolling behavior. Register and address
details below are source-derived. This supersedes the proposed 4-by-5 font
and 900-byte framebuffer.

## Font and packing

| Original address | Function/data |
| --- | --- |
| `$1476-$150B` | Glyph placement and two-byte bitmap merge |
| `$1578-$157F` | Four pairs of byte-preservation masks |
| `$1580-$173F` | 64 glyphs, seven bytes each; ASCII space through underscore |
| `$1740-$175D` | Fifteen CPU bitmap-row addresses |
| `$175E-$176B` | Video pointer high bytes for objects 2-15 |
| `$176C-$17CB` | Six banks of initial video object attributes |

Glyphs use five high bits per byte, with a six-pixel cell. Twenty-four
cells span 144 pixels, or 18 bytes per bitmap scanline. A character row
uses seven scanlines: 126 bytes in a 128-byte slot. Fifteen rows use 1,890
bitmap bytes in 1,920 bytes of slots, not a single 900-byte buffer.

For column c, the first byte offset is floor(3*c/4), and the bit offset is
2*((3*c) mod 4). The glyph merger preserves neighboring cells. The second
byte of the final glyph can reach slot byte 126, so retain the padding.

## Physical rows

| Row index | CPU base | Storage |
| --- | --- | --- |
| 0 | `$1B00` | Cartridge RAM |
| 1 | `$1A00` | Cartridge RAM |
| 2 | `$1900` | Cartridge RAM |
| 3 | `$1800` | Cartridge RAM |
| 4 | `$0F00` | Internal RAM |
| 5 | `$0E00` | Internal RAM |
| 6 | `$0D00` | Internal RAM |
| 7 | `$0C00` | Internal RAM |
| 8 | `$1B80` | Cartridge RAM |
| 9 | `$1A80` | Cartridge RAM |
| 10 | `$1980` | Cartridge RAM |
| 11 | `$1880` | Cartridge RAM |
| 12 | `$0E80` | Internal RAM |
| 13 | `$0D80` | Internal RAM |
| 14 | `$0C80` | Internal RAM |

Eight slots occupy the 1 KiB cartridge RAM. Seven occupy internal
`$0C00-$0F7F`, leaving `$0F80-$0FFF` for BIOS state and control data.
The cartridge RAM mirrors at `$1C00-$1FFF` in the Timeshare profile.
Expansion RAM at `$3000-$3FFF` is not on the video-fetch bus.

## Video objects, cursor, and scrolling

- Objects 1-15 display the rows. `$52` width selects 18 bytes; height is 7.
  Initial X is 23; initial Y positions are 48, 60, ..., 216.
- Object 0 is the cursor. `$13C0-$142C` computes cursor X as `23+6*column`,
  updates its Y position, blinks it via the high-Y bit, and refreshes the
  row-address lists through the BIOS routine at `$424E`.
- The low nibble of each XY-high entry selects its object descriptor;
  these are not arbitrary flags. Preserve the object-index mapping.
- `$12DD-$12F7` clears 126 bytes at the selected physical row.
- `$1395-$13BF` advances the physical write row modulo 15. On a full
  screen it subtracts 12 from each row's Y position, wraps rows above
  the top by adding 180, then clears the recycled bitmap row. Scrolling
  rotates object positions rather than copying the entire framebuffer.
- The serial routines, interrupts, and Timeshare control codes are terminal
  behavior. BASIC needs its existing keyboard translation and input semantics.

## Cartridge mapping constraint

The current core implements these separate capabilities:

| Profile | CPU ROM | Video-visible cartridge RAM | BASIC workspace |
| --- | --- | --- | --- |
| 4K RAM fallback | `$1000-$1FFF` | None | 4 KiB at `$3000-$3FFF` |
| Timeshare | 2 KiB at `$1000-$17FF` | 1 KiB at `$1800`, mirrored | No expansion RAM |
| APL/S | Fixed and banked ROM, 16 KiB image | 1 KiB at `$1C00-$1FFF` | `$3000-$3FFF` is banked ROM |

APL/S establishes ROM capacity, not a flat 16 KiB address range or a
simultaneous 4 KiB BASIC RAM window. CPU `$2800-$2FFF` aliases video
registers/internal RAM; it cannot supply another independent ROM window.

The BASIC homebrew profile combines eight 2 KiB ROM banks in CS1,
Timeshare-compatible RAM in CS2, and the existing 4 KiB workspace at
`$3000-$3FFF`. A write to `$17FF` selects data bits 2:0 as the bank;
CPU and video DMA use the same selected ROM bank. `$1700-$17FF` is
reserved for identical common code/data in all eight banks, including
bank-switch call and return stubs. This leaves 1,792 bank-specific bytes
per bank. Reset selects bank zero and preserves RAM; power cycle clears
internal and cartridge RAM. Software initializes workspace RAM.

This new profile is implemented in the core and awaits hardware validation.
It is not a historical cartridge contract. See the
[core mapping specification](https://github.com/meauxdal/VideoBrain_MiSTer/blob/main/docs/CARTRIDGES.md#basic-homebrew-mapping).

APL/S is an alternative if workspace access is redesigned around its
existing map. That would require moving/reducing the current BASIC RAM
allocation; selecting the APL/S fallback alone is insufficient.

## Implementation sequence

1. Preserve and rebuild the phase 1 baseline at CRC32 `F3BFF3D3`.
2. Validate the standalone Timeshare display probe on the existing profile.
3. Specify and test the combined ROM/RAM mapping, including DMA and reset.
4. Isolate console state and define register/ISAR contracts for glyph output,
   newline, backspace, input, cursor, and SHIFT indication.
5. Add cursor and row-rotation scrolling to the independent renderer.
6. Connect the interpreter and relocate its code/data against the agreed map.
7. Recheck affected language, editing, error-location, and memory-limit cases.

The static probe does not implement keyboard input, a cursor, or scrolling;
the console probe adds cursor and scrolling. Neither implements BASIC.
The mapping probe checks the combined homebrew profile before displaying
twenty numbered rows. No project-specific changes to MiSTer's sys tree
are needed.
