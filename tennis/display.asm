; Retail display-list ordering, extended with explicit per-object Y-high bits.
; The frame scheduler owns the safe commit phase and field-pointer interrupts.
; Direct ROM images replace all old reflected graphics; $0D0C-$0D1B caches X.
PATENT_DISPLAY_X = $0d0c

; Configures normal three-bank BIOS field transfers from the two shadow sets.
; Requires interrupts disabled. Clobbers R7, A/W/K/DC0/DC1; preserves J.
PatentDisplayConfigure:
        lr K,P
        dci $0ffa
        xdc
        dci PatentDisplayFields
        lis 6
        lr 7,A
PatentDisplayConfigureByte:
        lm
        xdc
        st
        xdc
        ds 7
        bnz PatentDisplayConfigureByte
        dci $0880
        lis 0
        lr 0,A
PatentDisplayConfigureOrder:
        lr A,0
        st
        inc
        lr 0,A
        ci 15
        bc PatentDisplayConfigureOrder
        pk

; Sorts into inactive list B and caches X origins in R40-R55.
; Keep those registers intact until PatentDisplayCommit; call before waiting
; for the established retail commit phase.
; Uses initialized BIOS K stack/J; returns with interrupts disabled.
; Clobbers R0-R8/R10/R11/R40-R55, A/W/K/DC0/IS, BIOS K-stack scratch.
; Preserves J and all scene/collision state. List A remains active.
PatentDisplayPrepare:
        lr K,P
        pi $40a9
        di
        pi PatentDisplayOrigins
        lisu 5
        lisl 7
        dci PATENT_DISPLAY_X
        li 16
        lr 0,A
PatentDisplayCacheX:
        lr A,13
        com
        st
        br7 PatentDisplayCacheNext
        lisu 6
PatentDisplayCacheNext:
        ifconst PATENT_CARTRIDGE
        ei
        nop
        di
        endif
        ds 0
        bnz PatentDisplayCacheX
        lis 1
        lr 0,A
PatentDisplayInsert:
        dci $0880
        lr A,0
        adc
        lm
        ni $0f
        lr 1,A
        dci PATENT_DISPLAY_X
        adc
        lm
        lr 2,A
        lr A,0
        lr 5,A
PatentDisplayInsertCompare:
        lr A,5
        ai 0
        bz PatentDisplayInsertStore
        ai $ff
        dci $0880
        adc
        lm
        ni $0f
        lr 4,A
        dci PATENT_DISPLAY_X
        adc
        lr A,2
        cm
        bnc PatentDisplayInsertStore
        bnz PatentDisplayInsertShift
        lr A,4
        com
        as 1
        bp PatentDisplayInsertStore
PatentDisplayInsertShift:
        dci $0880
        lr A,5
        adc
        lr A,4
        st
        ifconst PATENT_CARTRIDGE
        ; Raster IRQ window inside the shift chain; A is reloaded at the compare.
        ei
        nop
        di
        endif
        ds 5
        br PatentDisplayInsertCompare
PatentDisplayInsertStore:
        dci $0880
        lr A,5
        adc
        lr A,1
        st
        ifconst PATENT_CARTRIDGE
        ; Insertion index R5 survives the stock IRQ (only R3 is clobbered).
        ei
        nop
        di
        endif
        lr A,0
        inc
        lr 0,A
        ci 15
        bc PatentDisplayInsert
        pi $40bc
        di
        pk

        include "display-sort.inc"

; Commits prepared X, both Y lists and both object-order lists.
; Call in the established retail commit phase; field pointers transfer via ISR.
; Clobbers R0-R3, A/W/K/DC0/IS and BIOS K-stack scratch. Preserves J.
PatentDisplayCommit:
        lr K,P
        pi $40a9
        di
PatentDisplayLists:
        lis 0
        lr 0,A
PatentDisplayListEntry:
        dci $0880
        lr A,0
        adc
        lm
        ni $0f
        lr 1,A
        dci PATENT_SCENE_FLAGS
        adc
        lm
        as 1
        lr 3,A
        dci $0880
        lr A,0
        adc
        lr A,3
        st
        dci $0870
        lr A,0
        adc
        lr A,3
        st
        dci $0c82
        lr A,1
        sl 1
        sl 1
        adc
        lm
        lr 2,A
        lm
        com
        inc
        as 2
        lr 2,A
        dci $0860
        lr A,0
        adc
        lr A,2
        st
        dci $0850
        lr A,0
        adc
        lr A,2
        st
        ifconst PATENT_CARTRIDGE
        ei
        nop
        di
        endif
        lr A,0
        inc
        lr 0,A
        ci 15
        bc PatentDisplayListEntry
        lisu 5
        lisl 7
        dci $0840
        li 16
        lr 0,A
PatentDisplayWriteX:
        lr A,13
        com
        st
        br7 PatentDisplayWriteXNext
        lisu 6
PatentDisplayWriteXNext:
        ifconst PATENT_CARTRIDGE
        ei
        nop
        di
        endif
        ds 0
        bnz PatentDisplayWriteX
        pi $40bc
        di
        pk

PatentDisplayFields:
        db 16,1,>$0c20,<$0c20,>$0c50,<$0c50
