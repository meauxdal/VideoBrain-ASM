# Patent Pinball adaptation

Target: a cartridge for the MiSTer VideoBrain core (the machine-cycle-accurate target; there is no physical VideoBrain) that plays the patent's Pinball (US4177462, pages 14-24), built on the machine interface of retail Pinball EN02, the same way Tennis was adapted from retail Tennis EN03. Expect this to be far from working at first; the first milestones are about understanding and about getting a field on screen.

This is a first-pass analysis from reading the sources. It is not yet checked against a build or the simulator. Items marked **unverified** need a second look before anyone relies on them. Retail EN02 was read through roughly $1630 (the code); the data tables from about $167A onward were not read in detail.

## Sources

| Source | What it is | Gaps |
| --- | --- | --- |
| `asm-collection/pinball (patent source).f8.txt` | Adam Trionfo's retyped patent listing (tape 134A), 865 lines, assembled for $F800-$FFAF | Code only. No data tables at all |
| `asm-collection/protopinball.zip` (`protopinball.asm`) | e5frog's port of the patent code to a 4 KB cart: patent code placed at $1800/$1900, header and `JMP $1900` added | The register setup block, numeral graphics and object graphics are **made up** (see below) |
| `asm-collection/pinball-en02.asm` | Sean Riddle's disassembly of retail Pinball, a 2 KB cart at $1000 | Data tables are disassembled as code in places |
| `asm-collection/pinballadam.zip` | Adam's other copy | Not read yet |

The Tennis patent source came with a data dump (`US4232374 data $1200.bin`, 1,301 bytes). **Pinball has no equivalent.** The patent listing says the display-composer registers live at $0800-$0BFF and "ROM segment information" at $1000-$17FF, but that data was not printed. Every table the patent code reads has to be reconstructed.

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

- Whether `pinballadam.zip` carries data that protopinball lacks.
- Whether to keep the patent's raster color bands (purple/red backgrounds) or let the stock path own the background.
- Whether the target should be the prototype's look (bumper layout from the patent figures) or keep retail's playfield.
