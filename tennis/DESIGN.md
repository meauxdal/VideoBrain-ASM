# Patent Tennis adaptation

Target: a 4 KB cartridge for stock VideoBrain hardware, using the working
retail Tennis machine interface and display routines. Transfer the patent
game's appearance and rules in coherent groups. Hardware checks belong at
playable milestones, not between individual source changes.

Sources are the retail disassembly, Adam Trionfo's symbolic transcription
and e5frog's reconstruction, credited in [README.md](README.md). Addresses
refer to the reconstructed $1800 program layout, not the patent's $F800
loading address. A source guess is not recovered historical evidence.

`candidate.asm` now combines the replacement policies and complete scene in
a stock 4 KB cartridge. It excludes the old retail policy and reflected
graphics code; `tennis.asm` remains the retail/V1/V2 reference. Integrated
startup, scanline/input timing and sound remain unfinished. Instruction
fixtures establish policy/data contracts, not hardware timing.

## Next milestones

1. Establish stable field rendering. The field-service candidate V2 moves
   background changes and next-field pointer transfers into the interrupt
   chain, with transfer at line 244. Focused checks passed; the hardware fix
   for every-field red/green and sprite alternation remains unconfirmed.
   The V1/V2 simulator comparison awaits review.
2. Validate a complete playable cycle on hardware: cold startup, both
   controls and serve buttons, rally, retrieval, scoring, restart and sound.
   Reconcile the right serve button mask with the selected joystick axes.
3. Compare with retail using reproducible observations. Keep preserved
   patent evidence, reconstructed choices and observed retail differences
   distinct; retain unresolved source gaps as unresolved.

Tennis remains a lower-priority preservation project, independent of core
release readiness. Playable completion is a milestone, not a verified status.

## What differs

| Area | Patent | Retail | Adaptation |
| --- | --- | --- | --- |
| Scene | 13 objects: ball, two paddles, three net segments, two boundaries, two scores, ball boy, two crowd objects | 16 display slots, including four player slots and auxiliary objects | Transfer the 13-object scene through retail's display path |
| Paddles | Fixed X centers 34/154; vertical input; width changes for hit images | Two-dimensional object records and four moving player slots | Couple graphics, fixed X, input limits and collision bodies |
| Ball | 8.8 fixed-point position and velocity in scratchpad $00-$07 | Object position records with per-object deltas; ball duplicated in virtual object 21 | Convert the state deliberately; do not paste scratchpad assignments |
| Hits | Position-dependent vertical velocity table at $1200; horizontal velocity starts at $0180 | Response tables at $1A7C/$1A88, movement resolver and velocity at $0D0A/$0D0B | Port the hit policy with its speed/progression rules |
| Serving | Ball boy retrieves and delivers the ball; explicit serve/play state | Ball-boy/serve path at $1736-$18EF | Port state transitions and animation together |
| Score | Two packed-decimal counters, limit $15; digits from $1214 | Two score buffers, score conversion and results screen | Port numeric rules and score display together |
| Display | Sorted Y/order lists, bank-update stream, field-specific images, red/green raster changes | Object records, sorter and frame update; generated reflected graphics | Keep retail's transport; translate patent scene data and animation requests |
| Input/sound | Shared timer/interrupt path and command shadow | Working BIOS/interrupt setup plus cartridge joystick and sound routines | Retain stock machine services and adapt their callers |

The visual similarity does not establish matching game-state layouts.
The successful court graft demonstrates data conversion, not interchangeability
of the complete programs.

## Reuse and replace

Retain these retail facilities initially:

- Cartridge header/startup and stock BIOS calls.
- Data copy at $1272; display-record initialization at $142C/$1468.
- Sorting and display commit at $127B/$14FB.
- Joystick capture at $1EED, including its saved registers and command shadow.
- Sound output at $148F until the patent's event-to-tone mapping is defined.
- Collision overlap/resolution at $1297/$1623 where their rectangle semantics
  express the intended rule exactly.

Replace or retire the retail policy that selects four-player configurations,
updates extra player slots, drives its serve sequence and presents results.
Do not copy the prototype's interrupt handler, display update stream or
scratchpad initialization over the retained facilities.

The main frame should remain one assembly control flow:

1. Read the two vertical controls and serve buttons.
2. Advance serve/retrieval state or ball motion.
3. Apply court, paddle and net rules; update score and sound events.
4. Select sprite frames and write the display records.
5. Commit/sort with the retained display routines at the established phase.

Use named state and geometry labels in ordinary assembly. Keep one candidate
configuration; the existing retail and V1/V2 modes are references, not a
pattern for adding a separate mode for every edit.

## Scene and asset conversion

Keep the retail numbering where it already works. The proposed final slot
assignment minimizes changes to the court and score paths:

| Patent object | Purpose | Proposed retail display slot |
| --- | --- | --- |
| 0 | Ball | 0 |
| 1/2 | Left/right paddle | 1/2 |
| 3/4/5 | Net segments | 9/10/11 |
| 6/7 | Upper/lower line | 7/8 |
| 8/9 | Left/right score | 12/13 |
| 10 | Ball boy | 5 |
| 11/12 | Left/right crowd | 6/3 |

Slots 4/14/15 become inactive after the four-player and auxiliary paths
are retired. Slot 3 cannot become crowd while retail still moves it as a
player. Hide unused objects explicitly; DX=0 means a 32-byte-wide object,
and DY=0 means 64 lines, so neither is a disable value.

The patent's Y list must be joined to its sorted object-number list.
Each image request also includes width, height, pointer/color bits, X-copy
mode, field parity and an origin. A bitmap address alone is insufficient.
Retail center conversion is X+4*byte-width and Y+floor(height/2).

Byte comparison across all 26 named assets finds exact retail occurrences
of BL, BR, NL, CB, LB1O, LB1E, LB2E, CR1O and CR1E. These include the ball,
left net, boundary, three left ball-boy frames and first crowd pair.
The other assets need conversion or a source decision; absence of an exact
byte match does not prove different visible pixels because retail also
generates reflected images in RAM.

Paddle image 1 is one byte wide; image 2 is two bytes wide. Patent paddle
collision width remains PW2=4. The retail display initializer derives a
half-width from image width, so copying an animation's width into that
record can also change collisions. Keep the intended collision body
separate from the current drawing width.

Transfer colors with the objects. DAT0 explicitly assigns RED+GRN to the
left paddle, BLU to the right paddle, no RGB flags to the left score and
BLU to the right score. Retail's white scene is not the intended palette
for all prototype objects. Background changes occur at scanlines 52
and 236, switching to green and red respectively; integrate those writes
with the retained frame schedule rather than copying blocking sync calls.

Virtual records 22/23 are candidates for fixed-size left/right paddle
collision bodies once the retail collision consumers are retired. The
$16/$17 entries at $1E75/$1E77 dispatch to $1B05 during rallies, stopping
horizontal motion and changing the ball image through $1B10. They are not
limited to serving. Retire that dispatch when installing the new rally path.
Copy paddle centers into those records during scene update. This keeps the
24-record allocation and avoids making hit animation alter the hit box.

## Source disagreements

The 1,301-byte reconstructed data blocks differ at 12 addresses:

| Address | e5frog | Adam | Role |
| --- | --- | --- | --- |
| $126C | 3C | 00 | Object height table |
| $12A1 | 36 | 00 | Pointer/color table |
| $12AE | 54 | 00 | Sorted Y table |
| $12F0 | 7E | 00 | LP1O |
| $1327/$1328 | 3C/3C | 00/00 | LP1E |
| $1387 | B8 | 00 | LP2E |
| $1458 | 44 | 00 | RP2E |
| $158D/$158E | 1F/40 | 00/00 | LB2O |
| $170A | 1C | 5C | CR2E transcription disagreement |
| $170B | 7F | 00 | CR2E |

Adam explicitly marks missing bytes at every listed address except $170A.
Both sources also retain zero values at some missing-byte sites, so equal
bytes alone do not resolve every gap. In LB2O, retail's corresponding two
bytes are 18/00; it does not corroborate either reconstruction there.

$126C can be reconstructed as NH=60 from the neighboring net segments and
the declared scene geometry. $12AE needs a separate decision: e5frog's $54
places the right score at Y=84, while the left score uses SY=58. Use paired
Y=SY for the adaptation unless the patent listing establishes a deliberate
offset, and label that as an adaptation decision. Do not treat $54 as a
confirmed score position. The candidate uses blue for both right-crowd
fields, following the complete even-field update. Scene assets retain
e5frog's fills at $158D/$158E and $170B and his $1C at the $170A disagreement.
These remain provisional choices, marked with unresolved zero-valued gaps
in `scene-images.inc`; no recovered-byte claim is made.

e5frog marks 21 guessed instruction sites: $1807, $1873, $18AD, $18CF,
$1A1C, $1A4E, $1AF3, $1B50, $1C42, $1C9E, $1C9F, $1D43, $1D71,
$1D95, $1DAE, $1E46, $1E7D, $1EA6, $1EB2, $1EBB and $1F8F.
Keep these attached to the affected rule, frame update or machine service.
Do not import them as an undifferentiated patch set.

Run `compare-assets.ps1` with the original retail ROM and both archives
to regenerate the asset matches, all data disagreements, missing-byte
sites and guessed-instruction inventory. Reports contain addresses and
comparisons, not exported ROM data.

## State and space constraints

The prototype calls its scratchpad slots octal in comments. LPY/RPY are
decimal 18/19 ($12/$13), not hexadecimal $22/$23. Its $00-$07 position
and velocity pairs and scratchpad command/status fields overlap registers
used by the retail routines. New persistent policy state belongs in a
named RAM allocation after auditing the retained BIOS and ISR users.
Do not declare a region free from the absence of a direct DCI alone.

Retail already owns these regions:

| RAM | Use |
| --- | --- |
| $0C20-$0C7F | Display pointer/attribute shadows |
| $0C80-$0CDF | 24 position/half-extent records |
| $0CE0 onward | Per-object deltas; ball delta at $0D0A/$0D0B |
| $0D0C-$0F0B | Reflected graphics built by the two $4686 calls at $1126/$1132 |
| $0F0C-$0F5F | Reflected net/crowd data from $1143 |
| $0F60-$0F89 | Score area cleared by $110B |
| $0FA1 onward | Live policy, display and saved-register fields |

In particular, the reflected-graphics area is not spare state RAM. Its
generation assumes the retail two-byte-wide asset layout, so replacing
paddles also requires changing that generation or its consumers.

The retail image has only 52 trailing padding bytes at $1FCC-$1FFF.
Fit new code/data by replacing unused retail policy and assets. Record
the reclaimed ranges and their remaining callers before reuse. Retain
the 4 KB stock-cartridge target; a mapper change is a separate project.

## Assembly batches and validation

| Batch | Changes that belong together | Evidence before completion |
| --- | --- | --- |
| Scene | Asset-source choices, named records, object mapping, inactive slots, reflected-image generation, raster colors | All 13 objects decoded with correct origins, widths, fields and pointers |
| Controls and hits | Two-player setup, fixed X, Y scaling/clamps, stable collision bodies, hit frames and paddle response | Endpoint and collision tables checked against the patent branches |
| Rally | Fixed-point motion, five hit-angle bands, speed progression, exact wall clamps and net occlusion | State transitions and arithmetic cases checked without changing display scheduling |
| Serve and score | Ball-boy movement, both serve buttons, retrieval, decimal score updates, $15 limit and restart | Both sides can serve, score and restart through the same state path |
| Integration | Full scene, rules, sound events and stock machine services | One combined simulation/hardware session covering a complete game cycle |

Analyze all batches before starting the next one. Implement their members
one at a time in source without requiring a new hardware test or distributable
ROM after each member. Rebuild when a batch is coherent; keep the byte-exact
retail reference, verify ROM bounds and inspect the changed routines/data.
Use focused arithmetic checks for rule boundaries. Save expensive simulator
and hardware checks for meaningful integrated milestones.

The exact bounce clamps cannot be expressed by merely translating the
retail symmetric region: the patent accepts Y=57-231, an odd-length
interval. V2's region accepts 56-231. Fix that in rule code, rather than
continuing to adjust the symmetric rectangle by single pixels.

The complete two-paddle path is installed in the candidate. Next work is
integrated timing validation, deadline optimization and sound event mapping.
The patent-court V2 reference remains a separate comparison ROM from the
field-service candidate V2.

## Paddle implementation status

`paddles.asm` now supplies three callable routines, without persistent
state allocation:

| Routine | Input | Output/use |
| --- | --- | --- |
| PatentPaddleMapInput | R1 = patent MAP value, 0-199 | A = logical Y, offset by 39 and clamped to 70-218 |
| PatentPaddleUpdate | R0 = side 0/1, R1 = logical Y, R2 = image 0/1 | Display slots 1/2, both field pointers, collision records 22/23 |
| PatentPaddleHit | Side, ball Y and paddle Y; front-contact difference -19..19 | Signed 8.8 VY from five bands, VX = +/-$0180 |

The frame adapter draws at logical Y minus 15 by storing logical Y plus 1
in retail's center record. The collision center remains the logical Y.
Left hit-image growth changes the drawing center from 34 to 38; right
growth changes 154 to 150. Collision X stays 34/154 and half-width stays
4 for both images. The half-height is 16. The image palette and both field
addresses are updated together.

The five front-contact bands are -19..-13, -12..-5, -4..3, 4..11 and
12..19. Their vertical velocities are -$0256, -$0103, zero, $0103 and
$0256. Side contacts, speed progression and event/state changes are still
caller work; this routine does not substitute for the whole collision path.

The current module is 599 bytes including 384 image bytes. Those images
match the selected e5frog data, including provisional fills at $12F0,
$1327/$1328, $1387 and $1458; missing zero-valued sites remain unresolved.
They are marked in the asset source. No newly inferred historical bytes
are claimed.

The RAM writes are confined to $0C84-$0C8B (drawing bounds), $0CD8-$0CDF
(collision bodies), the corresponding display-pointer/height shadows,
and DX registers $0821/$0822. Routines use only scratch registers $00-$0B
plus the normal K return pair, preserving R9 (retail saved status J).
Mapper inputs use R1 because PI replaces A with the destination high byte.
No prototype scratchpad state is installed.
The frame adapter requires interrupts disabled while it changes records.

The BIOS text buffer at $0F3F overlaps the game's reflected graphics,
and BIOS globals extend through the upper RAM area. Consequently neither
the text area nor apparently unused bytes near those globals are assigned
to new persistent policy state. This module avoids that allocation problem.

The candidate replaces the four-player dispatch and all retail consumers
of virtual 22/23, connects capture/update and routes hits through the new
response. Those retirements apply to the candidate only; reference builds
continue to use their original policy.
The isolated fixture is checked at instruction level; timing and integrated
game checks remain at the planned milestone.

## Stock control connection

`stock-input.asm` contains the unchanged 223-byte retail capture routine,
shared with the reference cartridge through an include. Calibration, command
shadow writes, BIOS calls and interrupt scheduling remain byte-identical.
`StockJoystickCapture` names the existing $1EED entry.

`controls.asm` supplies `PatentPaddleMapStockInput` and
`PatentPaddleCaptureUpdate`. The first accepts a calibrated retail Y in R1,
clamps it to 70-214 and returns
`Y + floor((Y - 70) / 36)` in A. This stretches the travel to 70-218,
with midpoint 142 becoming 144. This is an adaptation choice retaining stock
calibration, distinct from the patent's freeze-reading MAP calculation.
The patent MAP helper remains available for actual 0-199 MAP results.

The composed caller takes side in R0 and image in R2, selects vertical axis
0/2, captures one paddle, maps its Y and updates both its drawing and fixed
collision body. It preserves R0/R2/J and uses the initialized retail BIOS K
stack. It returns with interrupts disabled for further scene updates.
The frame scheduler must choose when to call each side and restart the
normal display/interrupt phase afterward; the caller does not replace that
scheduler. The candidate's scheduler now calls it for both vertical axes;
actual capture timing remains to be validated.

Instruction checks cover all 256 conversion inputs and 3,072 composed
side/image/input/status cases. Capture and BIOS K-stack calls are boundary
stubs in these checks; they establish axis selection, register/return
contracts, exact scene writes and disabled interrupts at those writes.
They do not establish capture timing or execute the BIOS stack implementation.

## Rally replacement

`rally.asm` implements 8.8 motion, hit-speed progression and a replacement
collision dispatcher. It reads paddle Y from fixed bodies 22/23 rather
than animated display records. It does not call the retail overlap resolver
or its object-ID-dependent graphics handlers.

`PatentBallAdvance` takes X integer/fraction in R0/R2, Y integer/fraction
in R1/R3, VY low/high in R4/R5 and VX low/high in R6/R7. Addition wraps
at 16 bits. `PatentRallyResolve` takes integer X/Y and those velocities;
R3 becomes an event mask, so fractions must first be saved by the caller.
Paddle hits return side in R10 and corrected paddle Y in R2.

The dispatcher follows the patent's executable comparison branches:

- Y below 57 or above 231 clamps and reverses VY; fractions are retained.
- X below 8 or above 180 clamps and reports the opposite player's score.
- X=92-96 hides the ball behind the net without reversing velocity.
- Paddle regions are X=29-39 and 149-159, with vertical difference -19..19.
- Side contacts occur at difference -19 with positive VY high byte, or
  +19 with negative VY high byte. The patent tests the high byte alone.
- Penetration behind a face moves X to 28/160 without a front bounce.
- Front hits move X to 40/148 and select the five-band velocity response.
- Image flags use X=52-93 with nonnegative VX, or 94-136 with negative VX.

The missing left-image VX read at $1A1C and right-exit comparison at $1A4E
use the explicit behavior reconstructed by e5frog. These remain adaptation
choices at missing instruction sites. They are not newly recovered bytes.
The dispatcher masks J's interrupt-enable bit around BIOS K-stack calls,
then restores J with interrupts still disabled, preserving its event result
across the retail ISR's use of R3 as accumulator-save scratch.

`PatentBallHitSpeed` takes a remaining-hit counter in R8, initially four.
It decrements on front or side hits; the fourth and subsequent hits double
both velocities. Front hits first reset their base velocities, as in the
patent. Doubling retains 16-bit wrap behavior.

`rally-state.asm` joins these routines into `PatentRallyStart` and
`PatentRallyStep`. Its proposed state replaces ten old per-object delta
bytes at $0CE0-$0CE9: X/Y integers, X/Y fractions, VY low/high, VX low/high,
remaining hits and last events. This region is already cartridge-owned;
it is available to this path only after all retail delta/serve/collision
users are removed. No reflected graphics or BIOS RAM is reassigned.

The step saves fractions before dispatch, applies hit progression, saves
state and redraws a contacted paddle with its returned Y. It returns the
event mask in A with interrupts disabled. The caller must stop rally steps
after scoring, handle serve/ball-boy/score/sound state, select ball/net and
paddle images, and commit the display. The candidate supplies these callers;
the rally fixture remains the focused arithmetic/policy check.

| Event bit | Meaning |
| --- | --- |
| $01 | Wall sound/event |
| $02/$04 | Left/right player scored |
| $08 | Ball hidden at net |
| $10/$20 | Left/right paddle hit image |
| $40 | Paddle hit; advance hit counter and sound |
| $80 | Side contact, combined with $40 |

Checks cover 726 motion cases, 484 speed cases, 11,360 collision cases,
both serve starts and 967 consecutive stateful rally frames. They verify
exact RAM write sets and coupled paddle-body/drawing updates. BIOS K-stack
calls remain boundary stubs; these checks do not establish integrated-game
timing or retirement of live retail callers.

## Serve, score and restart controller

`game.asm` connects retrieval and serving to `PatentRallyStep`.
`PatentGameInit` initializes replacement state; `PatentGameStep` takes an
active-high button mask in R0 (left $01, right $04) and returns ball events
in A. The caller captures paddles before the step and renders afterward.
Both routines leave J intact; the step returns with interrupts disabled.

| Mode | Action |
| --- | --- |
| Pause | Hold the ball at the scored boundary for 60 frames |
| Carry | Ball boy starts at X=85/103, Y=202; walks outward at one pixel/frame and upward at two, carrying the ball from X=75/113, Y=210 |
| Exit | Delivery stops at ball-boy X=54/134 and ball X=40/148, Y=148; the boy continues upward |
| Ready | Hide the boy at Y=$FF after reaching Y=54; accept only the selected server's button |
| Play | Run rally motion/contacts and route a scored exit back to pause |

Pickup starts on the 60th pause frame. Delivery stops after 31 moving carry
frames, and the boy becomes hidden on frame 134 of the complete retrieval.
His visible image is selected before advancing the seven-frame animation
phase, matching the patent's ordering. Animation during hidden periods is
omitted because pickup resets both frame and counter.

The serve button moves X from 40/148 to 39/149 with zero velocity. The
ordinary front-contact path supplies the launch angle and advances the
hit counter. A paddle away from the delivered Y can leave the ball waiting
until it is moved into contact. This replaces the earlier flat-launch
helper for game serving; `PatentRallyStart` remains a standalone rally helper.

The player who scores serves next. Scores use packed decimal, increment
through 09->10, and stop at 15. The next valid serve after either score
reaches $15 clears both scores; wrong-side presses do not restart the game.
Initial ball Y=144 is an explicit adaptation choice for incomplete startup
state, not a recovered patent value.

The complete state allocation is $0CE0-$0CF4, conditional on retiring all
old movement/serve/collision consumers:

| RAM | State |
| --- | --- |
| $0CE0-$0CE9 | Rally state and last ball events |
| $0CEA-$0CEC | Mode, server, pause counter |
| $0CED/$0CEE | Left/right packed-decimal score |
| $0CEF/$0CF0 | Ball-boy X/Y |
| $0CF1/$0CF2 | Visible ball-boy image and animation counter |
| $0CF3/$0CF4 | Captured buttons and next animation phase |

`scores.asm` renders the two-digit scores into $0F60-$0F7B, inside the
existing 42-byte retail score allocation, and updates display slots 12/13.
Each bitmap is 14 bytes: two interleaved columns over seven rows. Both fields
use the same RAM bitmap. Origins are X=70/102, Y=58; left is black and right
blue. Paired Y=58 remains the explicit adaptation choice at the missing
right-score Y entry. The caller controls score visibility during rallies.
`score-digits.inc` preserves all 70 digit bytes agreed by both transcriptions
at $1214-$1259. Old score/results writers must be retired before use.

The game fixture exercises 7,420 controller frames, including both complete
retrievals, launch angles, delayed contact, two natural 15-point games and
restarts. It also checks every valid packed-decimal increment and 96 score
rendering cases covering sides, values, saved status, both fields, palette,
geometry and exact RAM write sets. This is connected policy execution in
the instruction runner. The candidate includes the same routines in a stock
input/display schedule that still needs timing validation. BIOS K-stack
calls in instruction fixtures are stubs.

## Combined scene and machine path

`scene.asm` installs all 16 display slots, initializes paddle bodies and
updates the 13 patent objects. Slots 4/14/15 use one-byte blank descriptors
and Y-high flags that place them offscreen; zero width/height is never used
as a disable value. Ball-boy Y=$FF also maps to offscreen Y=511. Scores are
visible during serving and hidden during play.

Ball/net bitmap alignment follows CHIM. BL starts at logical X-2, BR at
X-6. NL starts at X=93 and NR at X=87, so their set pixels stay at 93/94
while byte-origin ordering changes. Crowd frames switch after ball X=94;
left/right crowds use yellow/blue. Both field/frame pointers change together.
The 17 additional scene assets total 696 bytes, including eight ball-boy
field/frame images. All provisional fills are marked in the source.

Scene flags occupy $0CF5-$0D04, followed by selection and saved J at
$0D05/$0D06 and cached score values at $0D07/$0D08. Scene updates mask J's
interrupt bit across all nested BIOS K-stack calls, preventing partial
shadow transfers. Score bitmaps rebuild only when their values change.

`display.asm` retains retail's X-origin calculation. Preparation stably
sorts the previous inactive order by byte origin, then object number, using
insertion rather than repeating a full selection walk. $0D0C-$0D1B caches
origins; this is safe only because the candidate no longer generates or
uses the retired reflected graphics. R40-R55 retain the origins until commit.
No intervening caller may overwrite those scratch registers.

Preparation changes only inactive list B and the X cache. Commit applies
both nine-bit Y/order lists and X registers in the retail scanline-164 phase.
Normal BIOS field transfers use odd shadows at $0C20 and even shadows at
$0C50. The 115-byte retail interrupt wrapper dispatches a field-service
leaf; only that call target changes. The retained 223-byte capture routine
supplies calibration.
The external interrupt vector must already have bit 7 set because the 3853
forces that bit; the candidate checks this at assembly time.

The candidate initializes the stock calibration records and BIOS stack,
then game/scene/display state. Its loop waits for line 56, captures both
vertical controls/buttons, advances game and scene, prepares the order,
then waits for line 164 and commits. Scanline waits enable interrupts.
The interrupt chain independently writes green at line 52, red at 236,
and transfers next-field pointers at 244 before scheduling line 52 again.
Line 244 follows the visible objects and leaves time to read current field
parity before the field seam. SMI is gated only across the two joystick
captures because their timer edges share the external interrupt input.
The combined instruction check runs 400 compute/prepare/commit sequences
with capture/BIOS K-stack boundary stubs. It does not execute cold startup,
arbitration or actual interrupts. Separate checks exercise a missed-scanline
wait with interrupts enabled and execute the supplied RES1 field-transfer
routine for both parities. Meeting all scanline deadlines and connecting sound remain
required integrated work; no frame-rate claim is made.
