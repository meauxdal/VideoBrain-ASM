# ASM collection

Historical VideoBrain disassemblies, patent-source transcriptions and homebrew
source, with additional analysis comments. Original filenames, instructions,
data and existing attribution are retained. New comments do not patch ROMs.

Public sources: [Orphaned Games source collection](https://orphanedgames.com/videobrain/f8_programming/f8_source.htm)
and [Sean Riddle's VideoBrain research](https://seanriddle.com/videobrain.html).
The collection credits Sean Riddle and Kurt Woloch for the annotated historical
disassemblies, Adam Trionfo for the patent-source transcriptions, and Jerry D.
Fox and Sean Riddle for Tiny BASIC and its VideoBrain port.

## Added annotations

- `vbfinancier.asm`: the listing covers only $1000-$1FFF. NEXT submission
  calls missing code at $30F7; a simple mirror enters an instruction operand
  at $10F7. The missing bytes, cartridge decoding and physical ROM capacity
  remain unverified. No replacement code or speculative mapping is supplied.
- `uvres-1n-2129-7802.asm` and its `_rev1` listing: $4686 reverses the bits
  in each byte while copying with adjustable source and destination spacing.
  The demo calls it at $13A4 and $13B1, so it is not globally unused.
- `vbexp1.asm` and `Money_Minder_vb1000mm.asm`: three matching blocks of
  28, 106 and 139 bytes. Main-machine addresses support a remnant hypothesis;
  nonexecution and development order remain unverified.
- `vbdemo.asm`: decoded VIDEO BASIC, sample programming, kitchen inventory
  and HELLO BOB text. These do not establish shipped software or authorship.
- `viceversa-en06.asm`: unused message 10 contains the literal YOU LPAY
  WHITE typo. All ten direct printer callers select other entries; the colour
  announcement fixes the selector at 9 (YOU PLAY BLACK). Named opponents
  are annotated here and in `checkers-en04.asm`.

The unchanged Tiny BASIC archive also contains ` FAIRBUG USES3E6-3FF9ABCDEF`
after the SORRY error-message terminator. The VideoBrain binary stores this
text at file offset $043A. The source's MON command jumps to $0000 and is
marked NO MONITOR; it does not provide a hidden monitor.

## Verification

The import was checked against its source copies: every non-comment source
line is identical, and files without new annotations are byte-identical.
The $4688-$469C loop was checked for all 256 byte values against bit reversal.
No assembler or hardware validation is claimed for this collection. Retained
automatic disassembly can interpret data as instructions, and older comments
can contain mistakes. Information Manager has separate byte-verified build
tools described in the repository README.
