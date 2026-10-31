# Tiny BASIC refactor reference

Maintain this file as fixes and tests establish behavior. Record the ROM
CRC, evidence, and acceptance case for each finding. Keep source findings
separate from hardware confirmation. Promote a candidate only after its
hardware check passes.

## Scope

1. Complete and validate the original interpreter with its current display.
2. Replace the display and reorganize memory using Timeshare as the reference.

The cartridge budget is 16 KiB. ROM capacity does not establish RAM or
video-fetch capacity. Timeshare's 24-column, 15-row layout is now mapped
from the byte-verified original source. See the
[display design](../../tinybasic/timeshare/DESIGN.md) and
[consolidated baseline](../../tinybasic/README.md).

## Validation state

| ROM CRC32 | Evidence | Result |
| --- | --- | --- |
| `D40A8E2B` | MiSTer: NEW, lines 10/20 printing HI/BYE, LIST, RUN | Both records list and execute; RUN returns cleanly to READY. |
| `D40A8E2B` | MiSTer: `01-signs.vbk` | PRINT 1 and PRINT -1 pass. |
| `D40A8E2B` | MiSTer: `02-arithmetic.vbk` | Precedence and parentheses pass: 14 and 20. |
| `D40A8E2B` | MiSTer: original `03-mixed-output.vbk` | First item prints, then WHAT. Wrong separator was entered (user observes `/`); PRINT-list behavior remains unconfirmed. |
| `BC23A460` | MiSTer: original `03-mixed-output.vbk` | Same WHAT results with the incorrect input. Bank-only patch is not an established fix. |
| `D40A8E2B` | MiSTer: corrected `03-mixed-output.vbk` | All three commands pass: A and 1; 1 and 2; B and 5. Small numeric spacing gap; no WHAT. |
| `D40A8E2B` | MiSTer: `04-line-editing.vbk` | Provisional pass: final RUN output is A, X after out-of-order insertion, replacement, and deletion. Exact LIST contents not separately confirmed. |
| `D40A8E2B` | MiSTer: `05-goto.vbk` | Variables, increment, IF/equality, and bounded GOTO pass: 1, 2, 3, DONE, then READY. |
| `D40A8E2B` | MiSTer: `06-for-next.vbk` | Default positive-step FOR/NEXT passes: 1, 2, 3, DONE, then READY. |
| `D40A8E2B` | MiSTer: `07-gosub.vbk` | GOSUB/RETURN and STOP pass: SUB, BACK, then READY. |
| `D40A8E2B` | MiSTer: `08-input.vbk` | Numeric INPUT passes: entering 4 produces 5 from A+1, then READY. |
| `D40A8E2B` | MiSTer: `09-data-restore.vbk` | DATA/READ/RESTORE passes: 7, 9, 7, then READY. |
| `D40A8E2B` | MiSTer: `10-error-recovery.vbk` | Division by zero reports HOW; malformed expression reports WHAT. Subsequent PRINT commands produce 2 and 3 without reset. |
| `D40A8E2B` | MiSTer: `11-negative-step.vbk` | STEP -1 passes: 3, 2, 1, DONE, then READY. |
| `D40A8E2B` | MiSTer: `12-nested-gosub.vbk` | Nested GOSUB/RETURN passes: OUTER, INNER, RETURNED, BACK, then READY. |
| `D40A8E2B` | MiSTer: `13-strings.vbk` | String variable HI displays H plus a crosshair-like glyph. LEN(0) reports 2. |
| `34207B22` | Assembly and complete byte comparison | String-buffer marker correction only; no PRINT bank patch. |
| `34207B22` | MiSTer: `13-strings.vbk` and `13b-string-lengths.vbk` | Both pass: HI/2 and A/ABC/ABCD/4. Current tested string-corrected variant. |
| `34207B22` | MiSTer: `16-string-input.vbk` | String INPUT passes: entering HI prints HI and length 2, then READY. |
| `34207B22` | MiSTer: `17-numeric-functions.vbk` | ABS(-7), 7/2, 2=2, and 2=3 produce 7, 3, 1, and 0. |
| `34207B22` | MiSTer: `18-backspace.vbk` | Ordinary backspace produces 12. BACK on an empty line followed by PRINT 2 produces WHAT. |
| `34207B22` | MiSTer: `19-multiple-statements.vbk` | Semicolon-separated assignment and PRINT statements pass: 2, 3, DONE. |
| `FC982273` | MiSTer: tests 18 and 18b | Both pass after loading the intended ROM: 12/2 and 3/4. Earlier failures used the wrong ROM. Current tested variant includes stringfix and the empty-buffer guard. |
| `FC982273` | MiSTer: `20-cancel-line.vbk` | Cancelled-line capacity is not reset: output 2, 3 instead of 14, 3. |
| `F3BFF3D3` | MiSTer: `20-cancel-line.vbk` | Passes: 14, 3. Current tested variant includes stringfix, empty-input backspace guard, and cancelled-line capacity reset. |
| `F3BFF3D3` | MiSTer: `21-input-limit.vbk` | Full-input handling passes: excess characters are discarded; commands print 2 and 3. |
| `F3BFF3D3` | MiSTer: `22-stack-limit.vbk` | Recursive GOSUB reports SORRY, displays line 10 with a question-mark location marker, then accepts PRINT 3. |
| ROM not separately identified | MiSTer: `15-nested-for.vbk` | Nested FOR confirmed working. The first result can scroll out of view on the current display. |
| `F3BFF3D3` | Consolidated source assembly and complete byte comparison | Standalone source/includes and preserved matching ROM under tinybasic/baseline. |
| `957D7246` | Timeshare source assembly | All 2,048 bytes match the recognized original-ROM CRC. Font, row addresses, and glyph routine are verified source references. |
| `7463DD42` | MiSTer: Timeshare display probe | All 24 columns and 15 rows render correctly with the Timeshare mapper. Font packing and split RAM placement are hardware-confirmed. |

Exact edited LIST contents, deeper loop limits and other stack paths,
further INPUT and DATA cases, arrays and further string cases, further error cases,
program/array memory limits, and sustained scrolling
remain unconfirmed. Do not infer their correctness from the two-line test.

## Interpreter and I/O contracts

Source basis: [interpreter](tinybasicvb-recordfix.f8) and
[BIOS equates](VBBIOS.ASM). These are source findings unless listed above.

- Source comments use octal scratch-register names: R20 means decimal 16,
  R26 means decimal 22. Tables below use hexadecimal indices and addresses.
- `LISL` selects only the low three ISAR bits. It does not restore the bank.
  Interpreter arithmetic generally expects bank 2; other interpreter paths
  deliberately select banks 3, 4, and 5. Preserve those distinctions.
- `LDRAWCHAR` returns with ISAR at bank 7, low index 5. `LNEXTLINE` and
  `LGETKEY` also leave bank 7 selected. Callers cannot assume bank 2.
- `ST2NUM`, `FNDLBANK`, and `RNXLBANK` explicitly restore bank 2 at input
  parsing, stored-line search, and next-line execution boundaries.
- Comma-separated PRINT reaches expression parsing after output without
  restoring bank 2. The experimental `PRNEXT` helper restores it before
  `FINISH`. The baseline passes the corrected mixed-output test without
  this patch. Do not infer a required bank correction from static bank
  selection alone; WHAT from incorrect input did not demonstrate a bug.
- `GETLN` keeps its remaining input count in R7. `TTYI` returns a character
  in R8; R8 cannot also hold the persistent input count.
- GET3 backs up the input pointer without checking for an empty buffer.
  Hardware test 18 confirms the failure after BACK on an empty line.
  GETBACK's R7 == 72 guard passes tests 18 and 18b. Verify the loaded ROM
  CRC before evaluating a correction; unchanged results can reflect a
  different ROM rather than failure of the intended patch.
  GET4 restarts the input pointer without resetting R7; test 20 confirms
  resulting truncation. CANCELRESET restores R7 to 72; test 20 passes.
  Full-buffer behavior still needs separate checks.
- `LDRAWCHAR` saves Q, DC0, and DC1 in scratch bank 7. Newline and keyboard
  routines save Q and DC0. The renderer also uses bank 2 scratch registers;
  a replacement needs an explicit clobber/preservation contract.
- `PUSHRT`/`PULLRT` save software return addresses on the Q-addressed RAM
  stack. `PUSHDC`/`PULLDC` use H as temporary storage. Do not assume H or K
  survives arbitrary helper calls.
- Existing input helpers account for JMP changing A. A new trampoline must
  preserve any character or value the continuation expects in A.

| Scratch indices | Interpreter state |
| --- | --- |
| `$10-$11` | Expression value / line-search target |
| `$12-$15` | Arithmetic temporaries |
| `$16-$17` | TXTU, first unfilled program-text address |
| `$18-$19` | CURRNT, current program line address |
| `$1A-$1D` | INPUT and GOSUB saved stack pointers |
| `$1E-$27` | FOR loop state |
| `$28-$2B` | Permanent and current DATA pointers |

## Stored records and memory

- BUFTOV marks the last stored string character with bit 7. XP41 copies
  marked bytes into BUFF, but output expects unmarked ASCII; an unknown
  byte selects the fallback glyph. The candidate STRCOPY masks buffer
  bytes while testing the original marker. Preserve this distinction
  between stored strings and display-buffer strings during refactoring.
- A stored line has a two-byte binary line number followed by text ending
  in CR. LIST and execution traverse these records using TXTU as the bound.
- In ST3, `PUSHDC` saves the beginning of the binary header in H. The count
  `EOL - saved beginning` already includes both header bytes. Do not add 2.
- Replacing the broken record-count ROM requires NEW to discard malformed
  existing records; this is not a normal requirement between valid commands.

| CPU address | Current allocation |
| --- | --- |
| `$1000-$1FFF` | 4 KiB cartridge image |
| `$3000-$3BFF` | Program text and shared array/string space below VARBGN |
| `$3C00` | VARBGN / array origin; scalar A-Z follow in two-byte slots |
| `$3C36` | STRLGH |
| `$3C37-$3C7F` | Input/string buffer, 73 allocated bytes |
| `$3C80-$3CFF` | 128-byte software stack; initial Q is `$3D00` |

The current ROM requires the 4K RAM fallback mapping at `$3000-$3FFF`.
Test text growth, arrays/strings, and stack exhaustion before changing their
boundaries. Relocation must include bounds checks and absolute addresses.

## Current display and keyboard

- The renderer uses the BIOS font at `$2010`, seven bytes per glyph.
  Cursor position at `$0FDF` packs row/column in its high/low nibbles.
- Current geometry is 16 columns by 7 rows. Each character row occupies
  `$70` bitmap bytes; scanlines have a 16-byte stride.
- Scrolling copies `$2A0` bytes from `$0C9F` to `$0C2F`, then clears
  `$70` bytes at `$0ECF`. These constants depend on the current layout.
- SHIFT state is at `$0FE2`. The ROM handles raw codes `$3B/$3C` as SHIFT.
  Preserve the state and indicator behavior when replacing the display.
- VBK2 mode events use the core's observed SHIFT state. Tiny BASIC comma
  requires SHIFT+N (matrix key 14 in symbol mode). The generic keyboard
  profile's COMMA key (7 in letter mode) indexes apostrophe in the source
  table; the user observes / on hardware. This display discrepancy is
  unresolved. Neither is a comma.
  Use `--profile tinybasic` and validate generated keys against the ROM's
  character table, not only the converter and packet checksum.
- Tiny BASIC `@` requires SHIFT+P (matrix key 2 in symbol mode). The
  Tiny BASIC converter profile supplies it for array expressions.
- `<` is unavailable in the current converter; the bounded GOTO file uses
  equality instead.
- Timeshare uses 6-by-7 character cells with a 5-by-7 font: 18 bytes per
  scanline, seven scanlines per row, and 15 slots of 128 bytes. Bitmap
  payload is 1,890 bytes across seven internal-RAM slots and eight
  cartridge-RAM slots. The proposed 900-byte layout was not accurate.
- Timeshare scrolling rotates row-object Y positions and clears the
  recycled physical row. It does not copy a full bitmap on each newline.
- The existing 4K RAM fallback lacks video-visible cartridge RAM. APL/S
  offers banked ROM and video RAM but uses the expansion window for ROM.
  Neither profile alone supplies the current BASIC workspace plus the
  Timeshare framebuffer. Specify the combined mapper before relocation.
- With the wrong mapper, the display probe corrupted exactly rows 1-4
  and 9-12 (cartridge RAM), while rows 5-8 and 13-15 (internal RAM) stayed
  correct. Selecting Timeshare resolved all rows. Use this split to
  distinguish cartridge mapping errors from glyph-packing errors.
- RUN has no output paging. Small-display scrolling can hide earlier
  results during validation; inspect compact output or staged checks
  before interpreting a missing visible line as an execution failure.
- SPECIAL cancels the current input buffer and advances to a new row.
  Earlier text remains visible; cancellation does not clear the screen.
- ERROR prints WHAT, HOW, or SORRY, followed by the current program line
  with an inserted question-mark location indicator. It temporarily
  terminates the line at the saved text pointer, prints the prefix,
  restores that character, then prints the marker and remaining text.
  Preserve source-line diagnostics when replacing the renderer.

## Refactor acceptance

- Keep the verified original ROM and a reproducible build as references.
- Define preserved registers, clobbers, return values, and ISAR state for
  every input/output entry point before replacing its implementation.
- Replace geometry-dependent cursor, wrap, scroll, and erase behavior
  together. Account for SHIFT indication and video initialization.
- Inspect Timeshare's font, object descriptors, pixel organization, video
  memory access, and refresh dependencies before assigning new addresses.
- Inventory symbol references, embedded addresses, trampolines, and memory
  bounds before relocating code or data. Remove fixed-address workarounds
  only when their underlying contracts are covered.
- Recheck the established acceptance cases after each affected subsystem
  changes. Preserve BASIC syntax, record semantics, and error behavior.
