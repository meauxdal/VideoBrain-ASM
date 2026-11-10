# VideoBrain diagnostics

- [JoystickDiag](joystick-diag/README.md) (`joystick-diag/JoystickDiag.bin`): scans all eight joystick pot channels and shows the UV201 freeze registers. The raw values change as each stick moves. Standard cartridge at $1000.
- [TimingBaseline](timing/TimingBaseline.md) (`timing/TimingBaseline.bin`): repeats control, RAM read, RAM write and cartridge read workloads, with a marker pulse on the sound latch clock for logic-analyzer captures. Standard cartridge.
- [TimingScreen](timing/TimingScreen.md) (`timing/TimingScreen.bin`): runs the same four workloads and shows the raster line each one finishes on, as four hex bytes. Standard cartridge.
- `dac-test/dac_test.bin`: writes DAC codes 0, 1, 2 and 3 through CPU ports 0 and 1, then holds code 3. The audio trace shows steps to 1, 2 and 3, with no picture. Replaces RES1 (starts at $0000).
- `selftest/selftest.rom`: tests CPU, RAM, UV201 object registers, DMA, FIFO and rendering without the BIOS. Shows one solid 16x16 object at X=40, Y=64 on black. Replaces RES1.
- `selftest/selftest_int.rom`: tests UV201 Y compare, the F3853 interrupt vector and interrupt return. The background color changes at Y=100. Replaces RES1.
- [joystick-gain](joystick-gain/README.md) (`joystick-gain/cart.bin`): checks the BIOS joystick gain thresholds, multiplication, carry and clamping. Writes 19 result records and a completion byte $A5 to RAM; no picture. Uses a patched RES1 and a cartridge.

The three RES1 replacements can't be loaded as ordinary cartridges. They were run in the MiSTer core's simulator.

The [Information Manager test plan](infoman/HARDWARE-TEST-PLAN.md) covers database entry, review, editing, merging and reporting on the MiSTer core; record runs in its [results sheet](infoman/RESULTS.md).

## Running in the simulator

From the VideoBrain_MiSTer `verilator` directory, with the headless simulator built:

```sh
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/selftest/selftest.rom --frames 8 --shot-last --ascii
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/selftest/selftest_int.rom --frames 8 --shot-last --probe
./obj_dir_headless/Vtop --res1 ../../VideoBrain-ASM/diagnostics/dac-test/dac_test.bin --frames 1 --max-cycles 30000 --audio-log dac_test.csv
```

`dac-test/dac_test.csv` is a saved simulator capture of the DAC steps.

## Building

The `.asm` files use DASM's F8 processor. Build from each subfolder; the timing pair builds with `bash build_timing_baseline.sh`, which honors `DASM=<path>`:

```sh
dasm dac_test.asm -f3 -odac_test.bin
dasm selftest.asm -f3 -oselftest.rom
dasm selftest_int.asm -f3 -oselftest_int.rom
dasm JoystickDiag.asm -f3 -oJoystickDiag.bin
```
