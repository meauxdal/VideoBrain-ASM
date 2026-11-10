# VideoBrain joystick diagnostic

On the MiSTer core, set `Joystick` to `On` and the cartridge type to `Standard`, then load `JoystickDiag.bin` through `F1 -> BIN -> Load Cartridge`. The program scans pot channels 0-7 continuously. Channel 00 is P1 vertical, 01 P1 horizontal, 02 P2 vertical, 03 P2 horizontal, and so on through 06/07 for P4.

Each screen row shows two channels side by side, eight hex digits per channel:

1. Channel number
2. UV201 X freeze (`$08F8`)
3. UV201 Y freeze low (`$08F9`)
4. UV201 Y freeze high/status (`$08FA`): bit 7 field, bit 1 live Y bit 8, bit 0 frozen Y bit 8

For each channel the program enables EJOY, waits for the timer, disables EJOY and reads all three freeze registers. The values are raster coordinates, not 0-255 pot readings. Leave the stick centered for a while, then sweep it slowly through its range.

`JoystickDiag.asm` is the source: a standard cartridge at `$1000`, entry at `$1012`.
