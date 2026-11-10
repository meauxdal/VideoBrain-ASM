# Timing baseline, revision 1

`TimingBaseline.bin` is a 2 KB standard cartridge for logic-analyzer captures. It disables interrupts, leaves the video running, and toggles CPU port 1 bit 4 (the sound latch clock) as a marker around each test. The screen and audio output don't show results.

Each cycle has a long sync gap, then four groups of 64 pulses separated by shorter gaps:

1. Control: `DCI $0C80`, `LIS 0`
2. RAM read: `DCI $0C80`, `LM`
3. RAM write: `DCI $0C80`, `ST`
4. Cartridge read: `DCI $1000`, `LM`

A marked interval runs from the port 1 write of `$10` to the write of `$00`, so it includes the `DCI`, instruction fetches and the OUT instructions. The control group shows that overhead. The port outputs are inverted at the pins. Video DMA can stretch individual intervals, so compare distributions rather than averages.

Useful probe points: the sound clock net (F3850 I/O-14), CPU PHI, CPU request 0 and 1, UV201 DMA request 0, and BRCLK, WACK, ROMC and WRITE where you can reach them. A video sync reference helps relate waits to raster position.

Cartridge SHA-256: `f3236d9629838e1769d007cefb967e649036b853d2eb22553d96a78613e2f163`. Build in WSL or Linux from this directory with `bash build_timing_baseline.sh`.

UV201 register access, timer and interrupt latency, and DAC edge timing need separate tests.
