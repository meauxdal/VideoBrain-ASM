# Tiny BASIC Enhanced progress

Updated: 2026-11-04. Current candidate: 2.0. Hardware LOAD/LIST/RUN and serial pass.

## Resume here

Version 2.0 reports TAPE OK after LOAD, lists all eight program lines and runs
correctly on hardware. The terminal transcript confirms continued serial
output through LOAD, LIST, RUN, INPUT and the final READY prompt.
Version 1.9 completed a two-record SAVE but a prior LOAD failed its smoke check
and stopped serial output.

Version 2.0 labels the receive-timeout change previously built under 1.9
(6C5DD5B6). The user has not identified which 1.9 build failed LOAD. Do not
reuse a version for changed candidates; the builder now rejects conflicting
release contents.

Use the working cartridge ASM as the reference. Compare setup, byte transfer,
completion and cleanup before introducing new diagnostics. No simulations or
full Quartus builds are requested. Keep assembly checks separate from hardware
results; prior native checks passed while hardware still failed.

## Latest hardware evidence

On November 4, the user reported TAPE OK on the first 2.0 LOAD and supplied
a capture-card screenshot, then a complete terminal transcript. LIST shows
all eight lines, 10-80. RUN prints IF OK, skips IF FAILED, accepts B:3, prints
TOTAL 10 and integer division result 3, then returns to READY. Serial remains
active throughout. This confirms a successful LOAD/LIST/RUN and serial return
for this program. The user also confirms multiple successful LOADs, serial
remaining active and segmented LIST commands working. Failure recovery remains
unverified.

On November 4, version 1.9 with Expander autoload enabled produced serial
output after reset. Loading a rewound diagnostic tape stopped serial output
at `READY)LOAD`. The screen returned to READY after `SMOKE CHECK FAIL`;
this was not a persistent CPU hang. The diagnostic reported:

- Program end: actual 12288 (3000 hex), expected 12420 (3084 hex).
- Sum: actual 25, expected 232. Roll: actual 35, expected 113.

The cleared program boundary is consistent with LOAD's failure path. The
final screen does not retain the tape-phase error. The user subsequently
confirmed `PRINT PEEK(16380)` returns 0 after failed LOAD, before reset:
serial is disabled. The earlier reading of 1 was after reset.

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
Candidate: `Tiny BASIC Enhanced v2.0 (2026.11.04) (Elle Ball).vbc`.

ROM CRC32: 4ACC6012. Full Python/DASM assembly passed in under one second.
Three version-guard tests passed: identical rebuild, changed BIN/VBC across
dates rejected, and other versions preserved. No simulation or instruction
execution substitutes were run. Hardware LOAD/LIST/RUN and continued serial
output pass as above; broader tape acceptance remains pending.

Source review: the read descriptor, receive bit sequence, 68-byte countdown
and dedicated completion ISR agree with Information Manager/Money Minder.
The receive-timeout refresh follows their activity-based waits. This does
not establish safe abort: Expander tape decode at 0337-03B5 does not check
the serial-mode host reset at 0480-0491. Recovery after a receive timeout
remains unresolved. No transport ASM was changed in this pass.

Hardware-confirmed 1.9 ROM CRC32: CEB0CDEA. Assembly and all 16 static tests passed. The generated main
assembly listings contain no errors. No simulation was
run for this fix. Hardware confirms multi-record SAVE, serial `TAPE OK`, return
to `READY`, and complete image data. The November 4 LOAD check failed as above.

The failed 1.8 artifact has ROM CRC32 C9BCBADE. The failed 1.7 artifact has ROM
CRC32 0C74E17D. The failed 1.6 artifact has ROM
CRC32 A7921899. The prior development artifact was labeled 1.5, ROM CRC32
30EAC01D; it was the first artifact containing the 1.6 handoff change, but its
version label was wrong. Static checks passed for each candidate.

## Next step

Hardware VERI, COMP (match and mismatch), and DUPE/copy reload remain pending.
Core examples 49-52 provide staged VBK4 checks using the existing 36/37
SAVE/LOAD fixture. Also pending: the existing smoke check after LOAD, blank or
damaged tape rejection, empty programs and missing-Expander/error recovery.
If a transfer fails, retain its exact tape
message and trace that phase against the working cartridge and Expander ASM.
Do not request another PEEK or add probes.

## Deferred scope decision

Named SAVE/LOAD and TLIST tape cataloguing are a future option, not approved
implementation scope or a 2.0 acceptance requirement. A design would need
program names/boundaries, sequential scanning and compatibility with existing
unnamed tapes. No tape-format or command changes are made for this plan.

`T_RETURN` calls `CON_SERIAL_INIT`, which clears 3FFC and only sets it after
all three setup bytes succeed. Setup and subsequent character-transmit
timeouts both disable serial, so the observed zero does not identify which
failed. Identify a concrete divergence from the working ASM before patching.
Existing codec tests replace the tape transport; the firmware SAVE test does
not supply playback input, so neither establishes production LOAD recovery.

Update this file with the exact version, ROM CRC, observed result and remaining
failure after each hardware report. Preserve the distinction between source
findings, assembly checks and hardware confirmation.
