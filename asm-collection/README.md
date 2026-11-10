# ASM collection

Historical VideoBrain disassemblies, patent-source transcriptions and homebrew source. Original filenames, instructions, data and attribution are kept; only comments were added.

Sources: the [Orphaned Games source collection](https://orphanedgames.com/videobrain/f8_programming/f8_source.htm) and [Sean Riddle's VideoBrain page](https://seanriddle.com/videobrain.html). The disassemblies are by Sean Riddle and Kurt Woloch, the patent-source transcriptions by Adam Trionfo, and Tiny BASIC by Jerry D. Fox, ported to the VideoBrain by Sean Riddle.

## Added comments

- `vbfinancier.asm`: the listing covers only $1000-$1FFF. NEXT calls $30F7, which is missing from the dump. It can't be a mirror of $10F7, since that address is the operand of a DCI.
- `uvres-1n-2129-7802.asm` and the `_rev1` listing: $4686 copies bytes with their bits reversed, with adjustable source and destination spacing. Nothing in RES1 calls it, but `vbdemo.asm` does, at $13A4 and $13B1.
- `vbexp1.asm` and `Money_Minder_vb1000mm.asm`: three identical blocks of 28, 106 and 139 bytes. The Expander I copies still use main-machine addresses, so they look like leftover code.
- `vbdemo.asm`: decoded demo text, including VIDEO BASIC samples, the kitchen inventory line and HELLO BOB.
- `viceversa-en06.asm`: message 10 reads YOU LPAY WHITE but is never shown; the colour announcement always selects message 9 (YOU PLAY BLACK). The opponent names are marked here and in `checkers-en04.asm`.

The Tiny BASIC archive also contains the text ` FAIRBUG USES3E6-3FF9ABCDEF` after the SORRY message, at file offset $043A of the VideoBrain binary. The MON command jumps to $0000 and is marked NO MONITOR.

## Checks

Every instruction and data line matches the source copies; files without added comments are byte-identical. The $4688-$469C loop was checked against bit reversal for all 256 byte values. These listings are not assembled here, and the automatic disassembly sometimes decodes data as instructions. Information Manager has its own byte-verified build, described in the repository README.
