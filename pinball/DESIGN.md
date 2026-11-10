# Patent Pinball adaptation

Target: a cartridge for the MiSTer VideoBrain core (machine-cycle accurate, and the test target, since no original unit is available to test on) that plays the patent's Pinball (US4177462, pages 14-24), built on the machine interface of retail Pinball EN02, the same way Tennis was adapted from retail Tennis EN03. Expect this to be far from working at first; the first milestones are about understanding and about getting a field on screen.

This is a first-pass analysis from reading the sources. It is not yet checked against a build or the simulator. Items marked **unverified** need a second look before anyone relies on them. Retail EN02 was read through roughly $1630 (the code); the data tables from about $167A onward were not read in detail.

## Sources

| Source | What it is | Gaps |
| --- | --- | --- |
| `asm-collection/pinball (patent source).f8.txt` | Adam Trionfo's retyped patent listing (tape 134A), 865 lines, assembled for $F800-$FFAF | Code only. No data tables at all |
| `asm-collection/protopinball.zip` (`protopinball.asm`) | e5frog's port of the patent code to a 4 KB cart: patent code placed at $1800/$1900, header and `JMP $1900` added | The register setup block, numeral graphics and object graphics are **made up** (see below) |
| `asm-collection/pinball-en02.asm` | Sean Riddle's disassembly of retail Pinball, a 2 KB cart at $1000 | Data tables are disassembled as code in places |
| `asm-collection/pinballadam.zip` | Adam's v.04 of the same retyped listing (.f8/.lst/.bin/.sym), code only, ends at $FD2A | Same code as the 1.0 text; no data |

The Tennis patent source came with a data dump (`US4232374 data $1200.bin`, 1,301 bytes). **Pinball has no equivalent.** The patent listing says the display-composer registers live at $0800-$0BFF and "ROM segment information" at $1000-$17FF, but that data was not printed. Every table the patent code reads has to be reconstructed.

## Viability (2026-11-09)

Question: can a patent Pinball for the MiSTer core be a proper reconstruction, or would it mostly be invention? Checked before writing any port code.

### What the evidence fixes

The patent printed the code but no data. The code itself still fixes much of the playfield, because every collision object's coordinates are encoded as `DCI` immediates (high byte Y, low byte X) plus an `LI`/`ADC` offset for the mirrored partner. Register bank layout used below: $800 pointer low, $810 hue (bits 7-5) + pointer bits 12-8, $820 X-copy/intensity (bits 6-5)/byte width, $830 height, $840 X, $850/$860 Y lists A/B, $870/$880 Y bit 8 + X-order A/B (confirmed against `uv202_pack.vhd` and `uv201_fetcher.vhd` in the core).

| Fixed by the code | Values |
| --- | --- |
| Game logic | All of it: physics, boundaries, collision cascade, score, flippers, ball count, restart. The retyped listing is proofread (v1.0 binary = v.04) |
| Bumpers (logical obj 2-7), 26x26 | (X,Y) $13,$8F / $2B,$A7 / $43,$BF and mirrors $A7,$BF / $BF,$A7 / $D7,$8F; score 1 each |
| Upper targets (obj 8-11), 18x10 | $2F,$6B (3 pts) and $C7,$6B; $47,$53 (2 pts) and $B1,$53 |
| Central bumper (obj 13), 18x14 | $79,$7B; 0 pts; hue cycles every 8 frames (display slot 8, `CENB` adds $40 to $818) |
| Flippers (obj 12/14) | Collision $57,$D9 and $93/$9B; 16 or 24 wide, 20 tall. Display slots 7 (left) and 9 (right); right flipper X $A0 rest / $98 raised |
| Flipper images | Four images in one page at offsets $00 (1 byte x 20 rows, rest), $17 (2 bytes x 8 rows, raised), $2A and $41 for the right flipper; intensity bits 11. The images themselves are not printed |
| Score | Slots 0 and 1, digits at $1500 with a 15-byte stride, hue bits all set; final-mod register $8F2 advances by 2 every 100 points |
| Ball | Slot 15, about 8x8 (from the `TBCL` offsets +7 and -9); start X $7E, Y $3A; hue shifts by $E0 each new ball; 5 balls |
| Field | Ball X 22..222, Y $38..$F0 (drain); background purple from line 8, red from line $38 |
| Init block | One 119-byte table at $1230 ($800-$85F, $870-$87F, $8F0-$8F6). `RSET` reloads $1270-$129F, which is the $840-$87F part of the same table, so the two are consistent |

That covers all 16 display slots: two digits, six bumpers, four targets, central bumper, two flippers and the ball.

### What nothing fixes

- Every bitmap: bumpers, targets, central bumper, ball, flippers, digits. Sizes are known; shapes are not.
- Hues of every object except the digits; intensity of everything except the flippers.
- Which display slot (2-6, 10-14) holds which bumper or target.
- The exact display-vs-collision offset. The right flipper's collision X ($93/$9B) and display X ($98/$A0) differ by 5, so drawn images were not simply the collision boxes.
- The flipper image page (pointer bits 12-8 live in the unprinted init block).

Places checked and empty: the patent has only two figures, both block diagrams, with no screen picture. pinballadam.zip has no data. Retail EN02's 2 KB contains none of the patent's coordinate pairs, so its playfield cannot be read back as the prototype's. e5frog's protopinball data is not the prototype's: its playfield X/Y/size values are retail EN02's register values (see below) and its flipper image is retail's $16EC bytes, so it is patent code driving the retail playfield. It was not assembled for this reason.

### Retail EN02 playfield vs patent bounds

Retail sets up its 16 objects from a 6-byte-per-object table at $1755 (height, $820 width byte, center X, center Y, pointer hi, pointer lo), committed by `A12FE`; register X = center X - 4 x bytes, register Y = center Y - height/2 (`A1214`, $13DD-$1408). Decoded in register units (left, top, width x height):

| Role | Patent (collision boxes from code) | Retail EN02 (display objects) |
| --- | --- | --- |
| Field width | ball X 22..230, about 208 px, axis about 131 | objects span X 30..160 under a 128-px top bar at X 32..160, axis 93 |
| Bumpers | 26x26 at (19,143) (43,167) (67,191) + mirrors; steps of 24/24 | 16x14 at (30,153) (40,169) (56,185) + mirrors; steps 10-16 X, 16 Y |
| Targets | 18x10; inner pair higher (71,83), outer pair lower (47,107) | 8x14; outer pair higher (30,89), inner pair lower (54,109) |
| Center object | 18x14 bumper at (121,123), on the axis | 8x14 checkerboard at (81,121), 8 px off the axis (role unverified) |
| Flippers | about 16-24 x 20 at Y 217, X 87 / 147-155 | 8x32 at Y 200, X 64 / 114 |
| Other | none | 128x7 top bar at (32,37); ball images in slots 0 and 15 |

Same vocabulary, different geometry: both have two mirrored diagonal triples of bumpers descending inward, four targets in mirrored pairs above them, a center object near Y 122-130 and two flippers near Y 200-217. But retail's field is about 60% as wide, its bumpers about 40% of the area, its target pairs are arranged the other way up, and it adds a top bar. Retail's horizontal bumper offsets from the axis are about 0.58x the patent's, but the vertical spacing does not scale the same way, so retail is not a uniform rescale of the prototype. Retail's shapes (checkerboard bumpers and targets, 1-byte-wide flipper strokes) can be borrowed as a style, but its bounds cannot stand in for the patent's.

### Verdict

A faithful reconstruction of the game's behavior and layout is possible; a faithful reconstruction of its appearance is not. This is a lower ceiling than Tennis, where the patent's data dump supplied the real images and colors.

That still makes it worth doing, provided the result is labeled honestly:

- Rules, physics, collisions, scoring, flipper logic, object positions and sizes come from the patent code, with no invention.
- First milestone, using evidence only: every object drawn as a solid box of its collision size at its collision position. That is what the code says the playfield is, and it needs no invented pixels.
- Optional second skin: plausible bitmaps (round bumpers, flipper shapes, digits) inside those boxes, marked as reconstruction in the source, with a build switch back to the evidence-only boxes.

If the goal is "looks like the 1976 prototype", stop here: no surviving source shows that. If the goal is "plays like the 1976 prototype", go ahead.

## The patent program, in brief

All state is in scratchpad: `X`=r0, `VX`=r1, `Y`=r2, `VY`=r3, `VYP`=r4 (fractional bits of VY), `SCOR`=r5 (packed BCD score), `PSTA`=r6 (packed flipper status), `SCAD`=r7 (score to add), plus r8-r11 temporaries and ISAR-addressed fields (hex score at $30-range via `LISU 6`, ball count via `LISU 4`, bumper color timer via `LISU 5`, collision flag via `LISU 7`).

Frame structure (`LP3`):

1. `UD0` moves the ball (gravity: VYP += 1 each frame with carry into VY), tests the playfield boundaries, then runs the bumper collision cascade by Y band.
2. `DSPY` copies the active object lists to the inactive ones; `FILL` writes the ball's X/Y into the inactive list; `SORT` re-sorts the inactive X-order and Y lists with a one-ball insertion step.
3. `CNGB`/`CENB`/`CNGC` spin on the line counter at $08FB and rewrite the background-color register $08F5 at fixed scanlines (purple at line 8, red at line $38), and cycle the central bumper color.
4. `SCHD` adds `SCAD` to the BCD score and rewrites the two score digit pointers; every 100 points it bumps the "final mod" color register.
5. `PADC` selects flipper images/positions from `PSTA`; the command register $08F7 is toggled between list A and list B each frame (the double-buffer).
6. `FLSH`/`SOND` play a bit-banged tone on `OUTS 1` when a collision flag is set, blocking inside a delay loop.

Input is `INS 0` (bit 0 and bit 1 are the two flippers), polled in the main loop. There are no interrupts: the whole program runs with `DI`, polling $08FB for scanline position.

## What differs from retail EN02

| Area | Patent | Retail EN02 | Consequence |
| --- | --- | --- | --- |
| Entry/startup | Patent `$F900`: `DCI $8F7`, zero it, `INTS` loads registers from $1230 etc., waits for line $0D with `SYNC`, sets command $44 | `START` at $1012: `DI`, `PI $45DB`, `PI $41C8`, BIOS-prepared state, sets up `OUTS 12/13/14`, `EI`, then game init | Patent startup bypasses the BIOS; it will not coexist with BIOS interrupts as written |
| Interrupts | None. Everything polls $08FB | `EI` after setup, ISR in the $11A1-$1213 area saves registers into $0FA1-$0FB6 and uses BIOS `PI $424D` | The stock machine expects the retail interrupt wrapper to keep running. Raster color changes have to move into interrupt-driven windows, as in Tennis |
| Memory map | ROM at $F800, tables at $1230/$1270/$1500/$1700, no RAM use beyond the display registers | Cart at $1000-$17FF, RAM shadows at $0C20-$0DFF, scratch $0F9x-$0FFF | Every `DCI` to a patent table address must be rebased; `JMP $F900` and the `PI CLER/INIT/INTS/SYNC` helpers at $F800 must be placed in the cart |
| Object model | 16 display objects driven directly in $0800-$08FF: addr lo, RGB+addr hi, XCOPY/interrupt bits/dX, dY, x value, y values A and B, X-order and Y-order lists. Double-buffered A/B | Same 16 hardware objects, but retail keeps shadow tables in RAM ($0C20 pointer lo/hi, $0C40 X, $0C80 Y, $0CA8 per-object 4-byte records, $0D0C delta/velocity) and copies them into the registers in `A12FE` | The patent writes the hardware lists directly; retail goes through shadows. For the adaptation the patent's direct-write model can probably stay, since both address the same $0800-$08FF chip registers. **Unverified:** whether retail's ISR or BIOS also writes those registers every field |
| Ball physics | 8-bit position, VY/VYP fixed-point gravity, bounce by negating velocity | Per-object delta records and a table-driven resolver (`A1230`, `A126D`); collisions via tables at $0CA8/$0D0C | Different algorithms and state layouts. The patent physics should be kept as the rule set |
| Collision | `TBCL`: X-range then side/top/bottom classification against a Y-band cascade of 14 test objects | Table-driven pairwise tests | Port the patent cascade as is; it is self-contained once the object coordinates exist |
| Scoring | Packed BCD in r5 plus a hex running total in scratch $30; rolls a color modifier at 100 | Two-digit counters at $0D8B-$0D11 area, digits drawn via `A15F1`/`A1256` | Port the patent rule. The numeral graphics must be rebuilt (see Missing data) |
| Flippers | Two flippers at fixed X (left ~$98 right ~$A0 depending on `PSTA`), status 0/1 picks image width | Flippers/ball tied into retail's paddle-like object records, input via `INS 1` bits 0 and 1 | Input source differs: patent `INS 0`, retail `INS 1` after `OUTS 1` clears the strobe. Use the retail port convention |
| Sound | `OUTS 1` tone with software delay loops | BIOS-assisted and tied into the interrupt | The blocking tone loop in `SOND` costs a whole field; replace with the retail sound path or a bounded delay |
| Game flow | 5 balls, reset on bottom exit (`RSET`), restart on zero balls (`JMP $F900`) | Mode/player selection, 1-4 player support, game over screen | The adaptation is single player. Retire retail's mode selection |

## Missing data (all of it needs a decision)

protopinball's header documents what it invented:

| Block | Patent address | protopinball | Notes |
| --- | --- | --- | --- |
| UM register setup (96+16+7 bytes) | $1230-$12A6, copied to $800/$870/$8F0 | Reconstructed from the playfield geometry by e5frog | Object positions, sizes, colors and the X-order list. Treat as a guess, not evidence |
| Initial lists for ball reset | $1270 (`RST2`) | Present in the same block | The patent code resets from $1270 to $840; this table has to match the register block |
| Numerals 0-9 | $1500, 15-byte stride | 7 rows each, drawn by e5frog | Not the original glyphs |
| Object graphics | $1600-$17xx | Ball 1x14, checkerboard 1x14/2x14, left/right flipper 1x32, top center object | Flipper and ball shapes look plausible; bumpers and the remaining playfield are unrecovered |

Retail EN02 has real graphics for this playfield. Comparing the retail playfield objects against the patent's object list (bumpers 2-7, the 14 bumper/target test objects, flippers) is the main way to recover plausible images and positions. **Retail and patent are different games**, so a byte match is not expected, and any borrowed asset must be labeled as borrowed.

Keep the same discipline as Tennis: patent evidence, reconstruction choices and observed retail differences stay separate, and unresolved gaps stay marked as unresolved.

## Reuse and replace

Retain from retail, at least initially:

- Cartridge header and startup through the BIOS calls, including `PI $45DB`, `PI $41C8`, `OUTS 12/13/14` setup and the `EI`.
- The retail field-interrupt wrapper at $11A1-$1213 (register save/restore into $0FA1 onward, BIOS `$424D` transfer) and `$40A9`/`$40BC` privileged entry/exit.
- Retail input read via `INS 1` with `OUTS 1` clearing.
- Retail sound output until the patent's event-to-tone mapping is rebuilt.

Replace with patent logic:

- The ball physics, boundary tests, collision cascade (`UD0`, `TBCL`, `VXCH`, `VYCH`).
- Score update and BCD digit display (`SCHD`, `SET`).
- Flipper selection (`PADC`, `UPAK`, `ST0/ST1`, `UDPL/UDPR`).
- Ball count, reset and game-over flow (`RSET`).
- Display lists (`DSPY`, `FILL`, `SORT`, `ACT`, `PREP`, `SWIT`), subject to the question of whether to keep direct hardware list writes.

Retire: retail's multi-player mode selection, retail's own ball physics and object records, and the patent's own `INTS`/`SYNC`/blocking background-color calls once the interrupt-driven path exists.

## Hazards already visible

- **Blocking raster synchronization.** `CNGB`, `CNGC` and `CLRS` busy-wait on $08FB. On the stock machine with its interrupt running, that wait can be interrupted or can miss its line. Tennis solved the same problem with interrupt-chain windows; the same technique will be needed here. See the Tennis dead-end notes about `EI;NOP;DI` windows.
- **Scratchpad collisions.** The patent's r0-r11 and ISAR-addressed fields overlap registers retail's BIOS and ISR use. Do not assume r0-r7 are free; audit first, as Tennis did.
- **Absolute jumps.** `JMP $F900` (restart) and the `PI CLER/INIT/INTS/SYNC` targets at $F800-$F83F must be relocated.
- **Computed flow.** `EDPT` and `UDEP` are branches into the middle of other instructions (`BNC EDPT+2`, `BR UDA` landing on a `JMP`). These are in the original listing; reproduce them carefully when relocating. **Unverified:** that Adam's retyping assembles to exactly the patent binary. His notes say version 1.0 matches version .04.
- **Sound timing.** `SOND` blocks for 16 x 78 inner-loop iterations per collision, a long stall at this CPU speed.
- **The 4 KB size.** The patent code is about 2.3 KB. A stock 4 KB cart has room, but only if retail's startup and ISR are brought along at their original size.

## Proposed approach

1. Assemble `protopinball.asm` unchanged and run it in the MiSTer simulator or headless sim, to see what e5frog's version actually does. This is the cheapest way to find out how far the patent code is from running, and it shows which of the problems above are real.
2. Do a diff of retail EN02 startup, ISR and display commit against Tennis's `stock-interrupt.asm` and `stock-input.asm`, which already solved the same integration for retail Tennis. Pinball and Tennis may share most of that wrapper.
3. Decide the display model: keep the patent's direct hardware lists, or go through retail's shadow tables. This choice drives everything else.
4. Port the self-contained policy first (physics, collision, score, flippers), with test fixtures like Tennis's `tests/`.
5. Rebuild assets from the retail playfield and mark each one's provenance.
6. Integrate on MiSTer at one or two milestones, not after each edit.

## Open questions

- Whether to keep the patent's raster color bands (purple/red backgrounds) or let the stock path own the background.
- Whether the target should be the prototype's look (bumper layout from the patent figures) or keep retail's playfield.
