# Screen timing diagnostic

`TimingScreen.bin` is a 2 KB standard cartridge that shows four hex bytes. Each test waits for video line `$20`, runs 255 iterations, and reads the current line again. The bytes are the finishing lines, left to right:

1. Control: load a RAM address, `LIS 0`
2. RAM read: load a RAM address, read it
3. RAM write: load a RAM address, write it
4. Cartridge read: load a cartridge address, read it

The results include instruction fetches and loop overhead, so they give a coarse raster position rather than a wait-state count, and can vary by a line between runs. The first set of results stays on screen. To compare machines, use 480i on MiSTer and photograph the whole display. For signal captures, use [TimingBaseline](TimingBaseline.md).

One MiSTer run in 480i showed `BB CD CE CD`.

Cartridge SHA-256: `903e083987dc9621b5721ff2f2af5ecbb6ff91cebc9183e3529a5fccf8a4ce85`. Build both timing diagnostics in WSL or Linux with `bash build_timing_baseline.sh`.
