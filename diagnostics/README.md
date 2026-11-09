# VideoBrain diagnostics

The [Information Manager hardware test plan](infoman/HARDWARE-TEST-PLAN.md) covers cartridge database entry, review, editing, merging and reporting. Use its [results sheet](infoman/RESULTS.md) to record physical MiSTer observations and output-tape reloads.

| ROM | Purpose | Expected result |
| --- | --- | --- |
| [timing/TimingBaseline.bin](timing/TimingBaseline.md) | Repeat marked control, RAM and cartridge access workloads for timing captures. | Four recurring groups of 64 marker pulses; hardware validation pending. |
| [timing/TimingScreen.bin](timing/TimingScreen.md) | Show coarse raster positions after fixed timing workloads. | Four hexadecimal bytes; original-hardware validation pending. |
| [joystick-diag/JoystickDiag.bin](joystick-diag/README.md) | Scan all eight joystick pot channels and display UV201 freeze registers. | Raw raster captures change as each stick moves. |
| `dac-test/dac_test.bin` | Latch DAC codes 0, 1, 2, 3 through CPU ports 0/1, then hold code 3. | Audio trace reports transitions to 1, 2, 3; no picture or continuous tone. |
| `selftest/selftest.rom` | Exercise CPU, RAM, UV201 object registers, DMA, FIFO and rendering without BIOS. | One solid 16x16 object at programmed X=40, Y=64, on a black background. |
| `selftest/selftest_int.rom` | Exercise UV201 Y compare, F3853 vector fetch and F8 interrupt return. | Background color increments at Y=100, producing a raster split. |
| [joystick-gain/cart.bin](joystick-gain/README.md) | Check BIOS joystick gain thresholds, multiplication, carry and clamping. | 19 RAM result records and completion byte `$A5`; no picture. |

JoystickDiag is a standard cartridge. The DAC and two selftest images start at `$0000` and replace RES1; they cannot be loaded as ordinary cartridges. joystick-gain uses a patched RES1 and a cartridge; see its README.

From the VideoBrain_MiSTer `verilator` directory, with the headless simulator built:

```sh
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/selftest/selftest.rom --frames 8 --shot-last --ascii
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/selftest/selftest_int.rom --frames 8 --shot-last --probe
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/dac-test/dac_test.bin --frames 1 --max-cycles 30000 --audio-log dac_test.csv
```

The matching `.asm` files use DASM's F8 processor. Rebuild from each subfolder; the timing pair builds with `bash build_timing_baseline.sh`, which honors `DASM=<path>`:

```sh
dasm dac_test.asm -f3 -odac_test.bin
dasm selftest.asm -f3 -oselftest.rom
dasm selftest_int.asm -f3 -oselftest_int.rom
dasm JoystickDiag.asm -f3 -oJoystickDiag.bin
```

`dac-test/dac_test.csv` preserves a simulator capture of the DAC transitions. These three RES1 diagnostics have not been validated on physical hardware.
