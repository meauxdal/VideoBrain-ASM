VideoBrain Tiny BASIC - stored-record count correction (experimental)

Base: TINYBASICVB-expanded-runbank.bin (CRC32 DC9724E6)
New:  TINYBASICVB-expanded-recordfix.bin (CRC32 D40A8E2B)

In ST3, PUSHDC saves the start of the line in R10:R11. The two ST
instructions overwrite the ASCII line number with its two-byte binary
form but do not change R10:R11. The original count, EOL - R11 (low byte),
already includes the two header bytes. A previous patch added 2 and
created a two-byte gap after each line. LIST and RUN could interpret
those bytes as additional lines beyond the final valid record.

The original five-instruction count is restored and the unused helper
removed. All other runbank ROM fixes are retained. No RTL changes.

Load the ROM using Mapper Fallback -> 4K RAM. Enter NEW first to
discard any program records stored using the broken length format.
Then test:
10 PRINT "HI"
20 PRINT "BYE"
LIST
RUN

Expected: LIST shows only lines 10/20; RUN prints HI and BYE, returns
READY, and does not show WHAT or a bogus third line.

This is a static source/byte-level fix; it has not been hardware-tested.
Rebuild: python build_tinybasic_record_count_restore.py
