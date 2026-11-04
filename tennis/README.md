# Tennis adaptation

Work in progress for stock VideoBrain hardware, based on retail Tennis EN03.
This is a playable-adaptation project, not a recovered historical ROM.
`candidate.asm` combines the complete scene, two-paddle controls and game
policy into a 4 KB cartridge. Integrated scanline/input timing and sound
remain unfinished; this is an experimental candidate.

Tennis is a lower-priority preservation project, independent of the core
release. The next milestone is stable field rendering, followed by a
complete playable game cycle and comparison with retail Tennis. Comparison
must separate patent evidence, reconstruction choices and observed retail
differences.

The reference `tennis.asm` remains separate and byte-exact in retail mode.
Its patent-court V2 transfers the patent's static court and net positions,
and shifts the ball's vertical boundary region. Player input and movement records remain
retail. V2 hardware and simulator validation are pending.

Sources: [Sean Riddle's retail disassembly](https://seanriddle.com/videobrain.html),
[patent-source collection](https://orphanedgames.com/videobrain/f8_programming/f8_source.htm),
and [US4232374](https://patents.google.com/patent/US4232374A/en).
Patent addresses below use e5frog's reconstructed cartridge layout.

[Adaptation design](DESIGN.md) covers the source differences, state and
object mapping, asset disagreements, and assembly batches. Hardware checks
are planned at integrated milestones; they are not required after each edit.

Run these commands from the VideoBrain-ASM repository root. Scripts use the
sibling VideoBrain_MiSTer checkout for reference ROMs and
`local/tennis-adaptation/` outputs. Pass `-CoreRoot <path>` for another
checkout location.

## Combined candidate

```powershell
.\tennis\check-candidate.ps1 -Dasm <path-to-dasm.exe>
```

This assembles `tennis-adaptation.bin` under `local/tennis-adaptation/`,
checks the 4 KB limit/header/vector, compares retained capture and interrupt
bytes with retail, and executes 400 combined control/game/scene/display
frames. The candidate uses the Standard mapper. Capture and BIOS K-stack
calls use boundary stubs. The field-service checks execute the supplied
RES1 BIOS transfer routine for both parities. They do not validate cold
startup, scanline deadlines, bus arbitration or interrupt execution.
Sound is not connected.

The field-service candidate V2 is packaged as `tennis-adaptation-v2.vbc`
with the Standard mapper and Tennis timing preset. It is separate from the
patent-court V2 reference. Focused instruction checks passed; correction of
the reported every-field red/green and sprite alternation remains unconfirmed
on hardware. A V1/V2 simulator comparison is pending review.

Raster events are scheduled independently of the game loop: green at line
52, red at 236, and next-field pointer transfer at 244. Scanline waits allow
interrupts. SMI requests are gated only around joystick capture edges, and
UV raster requests are restored after each capture. Actual timing and
interlaced output still require integrated validation.

The candidate omits all old four-player, movement, serve, collision, results
and reflected-graphics consumers. Its new state owns records 22/23 and
$0CE0-$0D08; $0D0C-$0D1B caches X origins after retirement of reflected assets.
It includes all 13 patent scene objects and hides unused slots explicitly.

## Paddle source work

`paddles.asm` implements the patent input clamp, two-paddle display/collision
adapter and five-band front-hit velocities. `paddle-images.inc` supplies both
frames and fields, retaining e5frog's marked fills at missing-byte sites.
The module is connected in the candidate; the patent-court V2 reference
retains retail controls.

`controls.asm` connects the unchanged stock capture routine to the paddle
adapter, selecting vertical axes 0/2 and scaling calibrated Y=70-214 to
70-218. The midpoint maps from 142 to 144. This is an adaptation choice
preserving retail calibration. The composed caller preserves saved status J
and returns with interrupts disabled for remaining scene writes. The
candidate replaces the old collision dispatch and its record 22/23 consumers.

```powershell
.\tennis\check-paddles.ps1 -Dasm <path-to-dasm.exe>
```

This assembles an isolated fixture and executes 1,458 instruction-level
cases: all mapped input values, both sides/frames at every Y byte, and
front contacts across all five angle bands. It also verifies the selected
384 asset bytes. These checks cover data and arithmetic, not ISR timing
or the integrated game. Timestamped stdout/stderr logs are saved alongside
the other local outputs. `paddles-unit.bin` is a test fixture, not a cartridge.

```powershell
.\tennis\check-controls.ps1 -Dasm <path-to-dasm.exe>
```

This verifies all 223 retained capture bytes, 256 conversion inputs and
3,072 composed control/update cases. Capture and BIOS stack calls use
boundary stubs; these checks do not validate ISR timing. The shared
instruction runner now models PI/PK returns, so mapper parameters use R1
rather than A. `controls-unit.bin` is also an isolated fixture.

## Rally source work

`rally.asm` supplies signed 8.8 motion, exact court clamps, score exits,
net hiding, front/side paddle contacts and hit-speed progression.
`rally-state.asm` connects them into a stateful step and redraws contacted
paddles through the shared adapter. It reserves $0CE0-$0CE9 for new state
after retirement of the retail movement/serve/collision consumers.
The candidate calls this replacement path.

```powershell
.\tennis\check-rally.ps1 -Dasm <path-to-dasm.exe>
```

The isolated fixture checks 12,570 arithmetic/collision cases, both serve
starts and 967 consecutive rally frames. BIOS stack calls are boundary
stubs; game scheduling and hardware validation remain pending. See the
[design](DESIGN.md) for register contracts, event bits and RAM ownership.

## Game and score source work

`game.asm` connects retrieval, both serve buttons, rally events, packed-decimal
scoring and restart at 15. `scores.asm` builds the patent digits in existing
score RAM and updates both field pointers for the black/blue score objects.
The replacement state uses $0CE0-$0CF4 after retirement of old retail policy.
The candidate calls the same game/score routines as the isolated fixture.

```powershell
.\tennis\check-game.ps1 -Dasm <path-to-dasm.exe>
```

Checks execute 7,420 controller frames, including both complete retrievals,
two natural 15-point games and restarts, plus all valid score increments
and 96 score-display cases. BIOS K-stack calls remain boundary stubs.
Integrated display/input timing validation remains pending.

## Scene and display checks

```powershell
.\tennis\check-scene.ps1 -Dasm <path-to-dasm.exe>
```

Checks cover 17 selected assets, all ball-X selection values, 228 full scene
updates and 229 display preparations/commits. They verify field pointers,
origins, palettes, visibility, fixed paddle bodies, cached scores and stable
X ordering. Provisional bitmap fills remain marked in `scene-images.inc`.
The right crowd uses blue in both fields, following the complete even-field
update. Odd/even BIOS transfers use separate shadow sets.

## Reference builds

From the repository root, with DASM F8 support:

```powershell
.\tennis\build.ps1 -Dasm <path-to-dasm.exe>
```

Outputs go to `local/tennis-adaptation/`, with timestamped assembly stdout,
stderr and verification logs. The script verifies the retail SHA256,
the first experiment's SHA256, all 12 changed bytes in V2, and the decoded
court geometry. All instruction bytes remain identical to retail.
Load `tennis-patent-court-v2.bin` with the Standard mapper on MiSTer.

`PATENT_COURT=0` builds retail; `1` builds the upper-line experiment;
`2` builds V2. The first experiment remains available as
`tennis-patent-upper-line-v1.bin`. Its Y=54 line position is not the patent's
upper boundary. MiSTer playback was reported working for that experiment.

## Display correspondence

Retail $1303 initializes six-byte records at $1DE5 through $142C:
height, width/flags, X center, Y center, then a pointer to two bitmap/color
descriptors. X origins subtract four times the byte width ($127B, $1585);
Y origins subtract half the height ($155C). Gameplay command $4C disables
vertical zoom. Command $64 at $1686 belongs to the results-screen setup.

The patent $1E50 routine consumes register-bank updates. Its Y list at
$12A3 (bank $50) is indexed by sorted slots, not object number. Each slot's
object number is the low nibble of the corresponding bank $70 entry at
$12B1. Matching these lists gives:

| Part | Patent slot | Patent object | X | Y | Width in bytes | Height | Retail object |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Upper line | 2 | 6 | 1 | 50 | 23 | 4 | 7 |
| Lower line | 3 | 7 | 1 | 234 | 23 | 4 | 8 |
| Net, top | 7 | 3 | 93 | 54 | 1 | 60 | 9 |
| Net, middle | 8 | 4 | 93 | 114 | 1 | 60 | 10 |
| Net, bottom | 9 | 5 | 93 | 174 | 1 | 60 | 11 |

The horizontal-line bitmaps match: patent $14E1 and retail $1D9D contain
four FF bytes, repeated across the width. The net bitmaps at patent $1469
and retail $1D49 contain 60 C0 bytes. V2 reuses these retail bitmaps.
The upper line ends at Y=53; the three contiguous net segments cover
Y=54-233; the lower line begins at Y=234.

## Movement and collision trace

Visible court objects 7-11 do not define movement bounds. Retail also
copies eight four-byte records from $1E4B to $0CC0 at $1146. These are
virtual objects 16-23, containing X center, X half-extent, Y center and
Y half-extent. $1297 tests overlaps; $1623 resolves movement against them.

| Purpose | Source | RAM | Virtual object | Center X/Y | Half-extents X/Y |
| --- | --- | --- | --- | --- | --- | --- |
| Ball court boundary | $1E4B | $0CC0 | 16 | 92/143 in V2; 92/141 retail | 72/85 |
| Left player region | $1E4F | $0CC4 | 17 | 44/130 | 12/72 |
| Right player region | $1E53 | $0CC8 | 18 | 142/130 | 14/72 |
| Net | $1E57 | $0CCC | 19 | 93/130 | 1/96 |
| Ball | $1E5F | $0CD4 | 21 | Updated during play | 4/3 |

The dispatch groups at $1E85 pair moving ball 21 with the collision list
at $1E6B. Its $90/03 entry selects virtual region 16 and handler $1925:
vertical boundary collisions reverse the velocity at $0D0B; horizontal
exits lead to scoring. Moving players 1/3 use the $1E7B list, including
$91/04; players 2/4 use $1E7F, including $92/04. Handler $1A94 rejects
movement outside their respective regions. The high object bit inverts
the overlap result; address calculation uses the low six object bits.

Thus changing the upper-line record alone does not change movement or
collision bounds. V2 changes only the ball region's Y center from 141 to
143. With the ball's half-height of 3, the retail overlap test's accepted
Y interval shifts from 54-229 to 56-231. Player regions are unchanged.

The patent uses explicit ball clamps at $19DF-$19F6: Y<=56 becomes 57,
and Y>231 becomes 231, reversing vertical velocity. V2 retains retail's
overlap response; the one-line difference at the upper edge remains open.

Retail joystick conversion at $1FB2-$1FBA offsets by 70 and caps at 214.
The patent's two paddle paths at $19A3-$19D2 offset by 39 and clamp to
70-218, then draw from center minus 15. Retail draws from center minus 16.
Input scaling, movement rectangles and sprite origins need to be adapted
together; V2 does not change them.

Player and ball graphics, input adaptation, horizontal gameplay bounds,
net collision behavior, scoring and the exact bounce clamps remain open.
