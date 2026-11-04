# Tiny BASIC Enhanced progress

Updated: 2026-11-03. Current version: 1.9. SAVE confirmed; round trip pending.

## Resume here

The active problem is SAVE/LOAD reliability, with two reported symptoms:
SAVE does not write all records, and TBE reports TAPE ERROR even when the
record it wrote is valid. Do not treat a valid first record as a complete SAVE.

Use the working cartridge ASM as the reference. Compare setup, byte transfer,
completion and cleanup before introducing new diagnostics. No simulations or
full Quartus builds are requested. Keep assembly checks separate from hardware
results; prior native checks passed while hardware still failed.

## Latest hardware evidence

The paired 1.6 tape and printer capture supplied on November 3 contains:

- Printer: one clean 300-baud session, 95 bytes, ending after SAVE. No captured
  TAPE OK, TAPE ERROR or subsequent prompt. The user reports TAPE ERROR on screen.
- Tape: 1,973 valid intervals, 5.33 seconds, one complete 64-byte payload record.
  Calculated and stored CRC both C47E; trailer is present.
- Payload: TB version 1, program end 303D, chunk address 3000. The program is
  61 bytes and requires two records. Only the first 56 program bytes were saved.

Version 1.7 produced `TAPE ERROR` at the same point. The newest tape was read
directly from the Bedroom MiSTer at `192.168.0.185`: timestamp
`2026-11-03 19:02:55 -0500`, SHA-256
`5F19CAB9B8BA491DB29882C4183F8458278D83664AEE46437675C495D614DB29`.
It is byte-for-byte identical to the 1.6 tape, including the 1,973 intervals.

Version 1.8 reported `TAPE ERROR` using the lowercase `blank-tape.vbt`. Direct
inspection on the MiSTer found that image unchanged from October 20, with a
zero interval count and SHA-256
`F04B7A54C86DC9F0A5CBB9F02815ADD34A57C8D9BEDBE258F881137DF72A3F43`.
The exFAT volume was mounted read-write. Recording never started, proving that
the host-line reset removed in 1.8 is required before the tape command.

Version 1.9 displayed `TAPE OK` and returned to `READY`. The unmounted image
was read back from the MiSTer with timestamp `2026-11-03 23:11:36 -0500` and
SHA-256 `957B872AE86808B820C38E41F79B9DE0A56E6C8D7B48BF9C8837488CB4293DB1`.
It contains 3,722 intervals and two complete records. Record one covers chunk
`3000` with CRC C47E; record two covers chunk `3038` with CRC FC14. Both stored
CRCs match, both trailers are present, and the reconstructed 61-byte program
matches all five entered lines.

The reproduction program is:

```basic
NEW
10 PRINT "TAPE PASS"
20 DATA 7,9
30 READ A,B
40 PRINT A,B
50 STOP
SAVE
```

## ASM findings and changes

Reference: [Information Manager](infoman/infoman.asm), byte ISR 3CB5,
byte wait 3D79, completion setup 3DB9 and completion ISR 3C9F.
[Money Minder](asm-collection/Money_Minder_vb1000mm.asm) has the corresponding
completion setup at 1C68 and ISR at 1BA1.

- 1.5 separated byte completion from peripheral stop, retained the original
  22-byte completion ISR, and released host lines on success. Hardware still
  failed; these changes alone did not resolve the problem.
- 1.6 changed the handoff in [tape_io.f8](tinybasic/banked/tape_io.f8).
  T_IRQ can consume a stop before T_FINISH installs the completion vector.
  T_WAIT accepts a clean stop, but T_FINISH previously rejected any nonzero R5
  stop flag. It now returns the saved error status in R38 for an already handled
  stop. A clean stop returns success; a failed transfer retains its error.
  When no stop has arrived, the separate completion wait remains in use.
- 1.7 restored a single port snapshot in the byte ISR. Version 1.6 detected a
  stop from one port read, then sampled the live port again for its completion
  status. The Expander can release those lines between reads, falsely marking a
  valid record as failed. A regression changes the simulated pins after the
  stop snapshot and required the saved completion status to remain clean. The
  identical 1.7 hardware result disproved this as the active failure path.
- 1.8 removes the speculative early-stop recovery and follows the working
  cartridge lifecycle directly. Any stop during command or data bytes fails;
  only the dedicated completion ISR accepts final status and releases the host
  lines. The extra entry reset and successful-transfer release delay are gone.
- 1.9 restores the required entry reset. Transport errors retain a phase code
  through the bank return and report `TAPE CMD ERROR`, `TAPE DATA ERROR` or
  `TAPE END ERROR`; other validation failures remain `TAPE ERROR`. This makes
  the next hardware result identify the exact failing boundary. Hardware
  confirms that this version completes the two-record SAVE.

The 1.6 and 1.7 changes addressed plausible source differences but did not
change the hardware result. Version 1.8 regressed before recording began.

## Current build and validation

Build with `python tinybasic/banked/build.py --dasm tools/dasm.exe`.
Release: `Tiny BASIC Enhanced v1.9 (2026.11.03) (Elle Ball).vbc`.

ROM CRC32: CEB0CDEA. Assembly and all 16 static tests passed. The generated main
assembly listings contain no errors. No simulation was
run for this fix. Hardware confirms multi-record SAVE, serial `TAPE OK`, return
to `READY`, and complete image data. Restart/LOAD remains pending.

The failed 1.8 artifact has ROM CRC32 C9BCBADE. The failed 1.7 artifact has ROM
CRC32 0C74E17D. The failed 1.6 artifact has ROM
CRC32 A7921899. The prior development artifact was labeled 1.5, ROM CRC32
30EAC01D; it was the first artifact containing the 1.6 handoff change, but its
version label was wrong. Static checks passed for each candidate.

## Next hardware check

1. Reload the core, mount the saved image for playback, rewind, LOAD, LIST and RUN.
   Expect all five lines, TAPE PASS, and values 7 and 9.
2. Confirm VERI and COMP after rewinding playback. Check failure reporting and
   return to READY using a blank or damaged tape.

Update this file with the exact version, ROM CRC, observed result and remaining
failure after each hardware report. Preserve the distinction between source
findings, assembly checks and hardware confirmation.
