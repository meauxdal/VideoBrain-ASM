; Information Manager VB-1200 prototype, September 25/26, 1978.
; DASM F8 source generated from infoman.lst; original ROM bytes preserved.
; Printer corrections are documented here but are not applied.
; DB outside confirmed data ranges may be untraced code.

        processor F8

; vb1200a_1000-17ff_9_25_78_51
; SHA1 39c2821f73c86c3e368fe5429628672cfe594306

; Cartridge signature AA 55; color 02; title 'INFO MANAGER'.
        org $1000
        db   $AA,$55,$02,$00,$01,$2B,$1D,$13
        db   $00,$29,$11,$2B,$11,$1B,$0B,$09
        db   $00,$00

; Cartridge entry: initialize video and workspace, then peripheral setup.
L1012:
        li   $44
        dci  $08F7
        st
        dci  $0FEA
        st
        li   $94
        dci  $0FB9
        st
        li   $F0
        dci  $0FC2
        st
        li   $41
        dci  $0828
        st
        lis  $07
        dci  $0FCB
        st
        clr
        outs 1
        dci  $0FDE
        st
        dci  $0FE3
        st
        dci  $0C26
        st

; Initialize FLD/SORT/TOT selections at 1B0C..1B0E to FF (no field selected).
        com
        dci  $1B0C
        st
        st
        st
        sl   1
        dci  $1BEC
        st
        dci  $1B03
        lis  $03
        st
        clr
        com
        st
        lis  $03
        dci  $1BCE
        st
        pi   L3AF5
        lis  $01
        dci  $1B0B
        st
        dci  $10A1
        pi   L33DD

; Menu prefix checks: EN -> ENTER, ED -> EDIT, R -> REVIEW; trailing text ignored.
L1068:
        dci  $0C01
        lm
        ci   $0B
        bnz  L107F
        lm
        ci   $2B
        bnz  L1078
        jmp  L10AD
L1078:
        ci   $1F
        bnz  L108C
        jmp  L11E1
L107F:
        ci   $09
        bnz  L108C
        clr
        com
        dci  $0C26
        st
        jmp  L119D
L108C:
        dci  $10A7
        pi   L33DD
        br   L1068

; Bitmap data; followed by six-byte input descriptors at 10A1 and 10A7.
        db   $FF,$9F,$9F,$9F,$81,$81,$FF,$99
        db   $99,$99,$81,$81,$FF,$3F,$51,$61
        db   $0C,$01,$06,$3F,$6D,$11,$0C,$01
        db   $06

; EN menu path: clear field count, then collect field definitions.
L10AD:
        lis  $01
        dci  $1BCE
        st
        pi   L3AF5
        dci  $117D
        pi   L33DD
        clr
        dci  $180C
        st
        lr   7,A
L10C1:
        clr
        xs   7
        bnz  L10E6
        lis  $01
        dci  $1B0B
        st
L10CA:
        dci  $180C
        lm
        ci   $13
        bnc  L10E6
        dci  $180C
        lm
        lr   3,A
        pi   L31E4
        clr
        xs   7
        bm   L10E6
        dci  $180C
        pi   L391E
        br   L10CA
L10E6:
        dci  $18AD
        li   $19
        st
        lr   QU,A
        lis  $03
        st
        lr   QL,A
        lis  $01
        lr   3,A
L10F2:
        lr   A,3
        inc
        dci  $180C
        cm
        bnc  L1115
        pi   L1189
        lr   A,3
        ai   $FF
        dci  $18AD
        adc
        adc
        lm
        lr   QU,A
        lm
        as   4
        lr   QL,A
        lr   A,QU
        lnk
        lr   QU,A
        st
        lr   A,QL
        st
        lr   A,3
        inc
        lr   3,A
        br   L10F2
L1115:
        dci  $180C
        clr
        xm
        bz   L1156
        pi   L1189
        lr   DC,Q
        adc
        lr   H,DC
        dci  $1B00
        lr   Q,DC
        pi   $22BF
        bc   L112E
        clr
        br   L1157
L112E:
        clr
        lr   QU,A
        lr   QL,A
        pi   $22BF
        dci  $1903
        lr   H,DC
        pi   $22BF
        dci  $18FD
        lr   A,QU
        st
        lr   A,QL
        st
        lis  $01
        dci  $1B0B
        st
        dci  $1183
        pi   L33DD
        dci  $0C23
        lis  $05
        cm
        bz   L1166
        br   L115B
L1156:
        lis  $03
L1157:
        lr   10,A
        pi   L3F2A
L115B:
        lis  $02
        dci  $1B0B
        st
        pi   L31C5
        jmp  L10C1
L1166:
        pi   L3BD1
        lis  $01
        dci  $1B0B
        st
L116E:
        pi   L3320
        clr
        xs   7
        bm   L117A
        pi   L3B8C
        br   L116E
L117A:
        jmp  L121D

; Six-byte input descriptors: NAME and LENGTH.
        db   $3F,$71,$04,$18,$02,$0A,$3F,$7E
        db   $09,$0C,$23,$01

; Field length lookup: code 11 uses stored length; other types use 8 bytes.
L1189:
        lr   K,P
        lr   A,3
        ai   $FF
        dci  $18E9
        adc
        lm
        ci   $11
        lis  $08
        bnz  L119B
        li   $EB
        adc
        lm
L119B:
        lr   4,A
        pk

; R menu path: record processing through interpreter requests at 11DB/11DE.
L119D:
        lis  $02
        dci  $1BCE
        st
        pi   L3AF5
        pi   L3BAF
        pi   L3B49
L11AB:
        pi   L1228
        dci  $11DB
        pi   L1641
        bnz  L11C6
        dci  $0C00
        clr
        st
        lis  $03
        dci  $1B0B
        st
        dci  $11DE
        pi   L1641
L11C6:
        clr
        xs   7
        bp   L11AB
L11CA:
        lis  $03
        dci  $1BCE
        st
        pi   L3AF5
        jmp  L1012

; Six-byte input descriptor; two three-byte interpreter requests follow.
        db   $3F,$70,$01,$0C,$01,$0F,$01,$05
        db   $00,$01,$05,$01

; ED menu path: record processing through interpreter requests at 1222/1225.
L11E1:
        clr
        dci  $1BCE
        st
        pi   L3AF5
        pi   L3BAF
        pi   L3BD1
        pi   L3B49
L11F2:
        pi   L1228
        dci  $1222
        pi   L1641
        bnz  L120D
        dci  $0C00
        clr
        st
        lis  $02
        dci  $1B0B
        st
        dci  $1225
        pi   L1641
L120D:
        clr
        xs   7
        bp   L11F2
L1211:
        dci  $1B1B
        clr
        xm
        bm   L121D
        pi   L3B40
        br   L1211
L121D:
        pi   L3BE2
        br   L11CA

; Three-byte interpreter requests.
        db   $10,$05,$00,$10,$05,$01
L1228:
        lr   K,P
        pi   $40A9
        lis  $01
        dci  $1B0B
        st
        dci  $11D5
        pi   L33DD
        dci  $0C00
        clr
        st
        jmp  L15D6

; TOTAL report: requires TOT field at 1B0E. SORT at 1B0D enables per-key counts/sums and grand total.
L123F:
        lis  $03
        dci  $1B0B
        st
        dci  $1B0E
        clr
        xm
        bp   L124E
        jmp  L12EE
L124E:
        dci  $1B0E
        lm
        dci  $180D
        sl   1
        sl   1
        adc
        adc
        lr   H,DC
        dci  $1303
        pi   L33F1
        clr
        dci  $1B0D
        xm
        bm   L12D6
        dci  $180D
        sl   1
        sl   1
        adc
        adc
        lr   H,DC
        dci  $1307
        pi   L33F1
        dci  $1B0E
        lm
        dci  $18E9
        adc
        lm
        dci  $0C24
        st
        clr
        lr   6,A

; Report groups in slot/first-encounter order; stop at empty key or ten slots. No key ordering pass.
L1284:
        lis  $0A
        xs   6
        bz   L12C9
        lr   A,6
        dci  $1B24
        sl   1
        sl   1
        sl   1
        adc
        clr
        xm
        bz   L12C9
        li   $FF
        adc
        lr   H,DC
        dci  $130B
        pi   L33F1
        lr   A,6
        dci  $1B74
        adc
        lm
        lr   0,A
        dci  $1BDC
        pi   L3839
        dci  $12F1
        pi   L33DD
        lr   A,6
        sl   1
        sl   1
        sl   1
        dci  $1B7E
        adc
        lis  $0F
        lr   0,A
        pi   L3A77
        dci  $12F7
        pi   L33DD
        lr   A,6
        inc
        lr   6,A
        br   L1284
L12C9:
        dci  $1B1C
        lis  $0F
        lr   0,A
        pi   L3A77
        dci  $12FD
        br   L12EB
L12D6:
        lm
        dci  $18E9
        adc
        lm
        dci  $0C24
        st
        dci  $1B1C
        lis  $0F
        lr   0,A
        pi   L3A77
        dci  $12F7
L12EB:
        pi   L33DD
L12EE:
        jmp  L331D

; Input/display descriptors; not F8 instructions.
        db   $3F,$D9,$06,$1B,$DC,$03,$3F,$DF
        db   $11,$1B,$DC,$0F,$3F,$E6,$11,$1B
        db   $DC,$0F,$3F,$B9,$12,$08,$3F,$C6
        db   $12,$08,$3F,$D2,$07,$08

; REVIEW copy/advance accounting: requires TOT; add numeric field to grand total, then optional SORT bucket.
L130F:
        dci  $1B0E
        clr
        xm
        bm   L138A
        dci  $1B0E
        lm
        lr   0,A
        pi   L393A
        xdc
        dci  $1B1C
        pi   L3997
        clr
        dci  $1B0D
        xm
        bm   L138A
        dci  $1B24
        xdc
        dci  $1B0D
        lm
        lr   0,A
        pi   L393A

; Search nine named SORT buckets by exact eight-byte key equality; field width is not consulted.
        lis  $09
        lr   0,A
        pi   L14BA
        bz   L136E
        lis  $09
        lr   0,A
        dci  $1B24

; Find first unused key slot. If all nine are occupied, use slot 9 (OTHER).
L1344:
        clr
        xm
        bz   L1350
        lis  $07
        adc
        ds   0
        bnz  L134E
        lm
L134E:
        bnz  L1344
L1350:
        lr   A,0
        com
        ai   $0A
        lr   1,A
        li   $FF
        adc
        xdc
        lis  $09
        xs   1
        bz   L136E
        dci  $1B0D
        lm
        lr   0,A
        pi   L393A
        lis  $08
        lr   0,A
L1367:
        lm
        xdc
        st
        xdc
        ds   0
        bnz  L1367

; Accumulate group numeric sum at 1B7E+8*index and increment byte count at 1B74+index.
L136E:
        dci  $1B0E
        lm
        lr   0,A
        pi   L393A
        xdc
        lr   A,1
        dci  $1B7E
        sl   1
        sl   1
        sl   1
        adc
        pi   L3997
        lr   A,1
        dci  $1B74
        adc
        pi   L391E
L138A:
        jmp  L15D6

; FLD setup: push slot 0 for the shared field-name resolver (1B0C).
L138D:
        pi   L38C6
        clr
        br   L139D

; SORT setup: push slot 1 for the shared field-name resolver (1B0D). REVIEW grammar requires SORT=fieldname.
L1393:
        pi   L38C6
        lis  $01
        br   L139D
L1399:
        pi   L38C6
        lis  $02
L139D:
        st
        br   L1409

; Resolve an exact field name against eight-byte names at 180D; reject unknown names.
L13A0:
        dci  $180C
        lm
        lr   0,A
        dci  $180D
        xdc
        dci  $0C10
        pi   L14BA
        bz   L13B9
L13B1:
        lis  $01
        lr   7,A
        lisu 5
        lisl 0
        lis  $02
        lr   12,A
        br   L1409

; Pop target slot; store zero-based field index in 1B0C + slot. FLD has no type restriction.
L13B9:
        pi   L38DD
        lm
        lm
        lr   0,A
        dci  $1B0C
        adc
        lr   A,1
        st
        dci  $18E9
        lr   A,1
        adc
        lr   A,0

; SORT slot 1 requires A/text (glyph 11); reject numeric keys and reset selection to FF.
        ci   $01
        bnz  L13F8
        lm
        ci   $11
        bz   L13DE
L13D4:
        dci  $1B0C
        lr   A,0
        adc
        li   $FF
        st
        br   L13B1

; Reset 170-byte group workspace: ten 8-byte keys, ten byte counts, ten 8-byte sums; label final key OTHER.
L13DE:
        li   $AA
        lr   0,A
        dci  $1B24
        pi   L3986
        dci  $1B6C
        li   $13
        st
        lis  $07
        st
        li   $19
        st
        lis  $0B
        st
        lis  $09
        st
        br   L1409
L13F8:
        ci   $02
        bnz  L1409
        lm
        ci   $11
        bz   L13D4
        lis  $08
        lr   0,A
        dci  $1B1C
        pi   L3986
L1409:
        jmp  L171E
L140C:
        clr
        com
        lr   7,A
        br   L1409

; PTR suffix: set printer flag 1B1A=FF, then process current output command.
L1411:
        clr
        com
        br   L1416

; Output without PTR: clear printer flag 1B1A. This is also EDIT's output continuation.
L1415:
        clr
L1416:
        dci  $1B1A
        st
        jmp  L3267
L141D:
        br   L1432
L141F:
        lis  $03
        br   L142E

; DESC: set processing mode 1B0F = 0; 3267 displays the database definition.
L1422:
        clr
        br   L142E
L1425:
        lis  $0C
        lr   0,A
        dci  $1B0F
        pi   L3986
        lis  $01
L142E:
        dci  $1B0F
L1431:
        st
L1432:
        br   L1451

; ALL selection: no initial advance (1B10=0), unlimited count (1B11=7F).
L1434:
        clr
        dci  $1B10
        st
        li   $7F
        br   L1431
L143D:
        dci  $1B10
        clr
        xs   6
        bnz  L1446
        br   L144A
L1446:
        ci   $01
        bnz  L144D
L144A:
        st
        br   L1450
L144D:
        lis  $01
        st
        lr   A,6
L1450:
        st
L1451:
        clr
        lr   7,A
        jmp  L171E

; Bare PRINT/DELETE selection: 1B10=1, 1B11=1; handlers interpret these differently.
L1456:
        dci  $1B10
        lis  $01
        br   L144A
L145C:
        dci  $180C
        lm
        lr   0,A
        dci  $180D
        xdc
        dci  $0C10
        pi   L14BA
        bz   L1470
        jmp  L13B1
L1470:
        dci  $1B10
        st
        lis  $02
        dci  $1B0F
L1478:
        st
L1479:
        br   L1451
L147B:
        dci  $0C10
        xdc
L147F:
        dci  $1B12
        lm
        ci   $06
        bnc  L1497
        adc
        xdc
        clr
        xm
        xdc
        bz   L1497
        st
        dci  $1B12
        pi   L391E
        br   L147F
L1497:
        br   L1479
L1499:
        clr
        dci  $1B12
L149D:
        br   L1478
L149F:
        dci  $1B12
        lm
        ci   $06
        bnc  L14B1
        adc
        li   $3A
        st
        dci  $1B12
        pi   L391E
L14B1:
        br   L1497
L14B3:
        clr
        com
        dci  $1B11
        br   L149D
L14BA:
        lr   K,P
        pi   $40A9
        lr   Q,DC
        xdc
        lr   H,DC
        clr
        lr   1,A
L14C3:
        ds   0
        bnc  L14EB
        lis  $08
        lr   2,A
        lr   DC,H
        xdc
        lr   DC,Q
L14CB:
        lm
        xdc
        cm
        xdc
        bnz  L14D4
        ds   2
        bnz  L14CB
L14D4:
        clr
        xs   2
        bnz  L14DF
        pi   $40BC
        clr
        ns   12
        lr   A,1
        pk
L14DF:
        lr   A,1
        inc
        lr   1,A
        lr   DC,H
        lis  $08
        adc
        lr   H,DC
        pi   L3948
        br   L14C3
L14EB:
        jmp  L15CB

; EDIT ADD: copy current buffer, enter/write additions without advancing source. EOF skips loop.
L14EE:
        dci  $1B1B
        clr
        xm
        bm   L1502
L14F5:
        pi   L3B8C
        lis  $01
        dci  $1B0B
        st
        pi   L3320
        bp   L14F5
L1502:
        br   L14B1

; EDIT DELETE: numeric count = 1B11 - 1B10 + 1; discard by reading without writing.
L1504:
        ds   3
        dci  $1B0B
        st
        dci  $1B0F
        lm
        ci   $01
        bnz  L1540
        dci  $1B10
        lm
        com
        ai   $02
        am
        dci  $1B10
        st
        bp   L1527
        dci  $1B1B
        clr
        com
        st
        br   L153E
L1527:
        dci  $1B10
        pi   L3922
        bnc  L153E
        dci  $1B1B
        clr
        xm
        bm   L153E
        pi   L3320
        pi   L3B49
        br   L1527
L153E:
        br   L1565
L1540:
        dci  $1B1B
        clr
        xm
        bm   L1551
        pi   L15AC
        bz   L1558
        pi   L3B40
        br   L1540
L1551:
        lis  $01
        lr   10,A
        pi   L3F2A
        br   L1565
L1558:
        pi   L3320
        pi   L3B49
        dci  $1B11
        clr
        xm
        bnz  L1540
L1565:
        br   L1502

; EDIT REPLACE: input mode 1 clears/re-enters current record; write deferred until copy/advance.
L1567:
        lis  $01
        dci  $1B0B
        st
        pi   L3320
L156F:
        br   L1565

; EDIT MERGE/M: copy current and remaining source records via 3B40; no output end marker yet.
L1571:
        dci  $1B1B
        clr
        xm
        bm   L157D
        pi   L3B40
        br   L1571

; MERGE pause: set mode bit 0 and reinitialize Expander; display REWIND / KEY NEXT.
L157D:
        dci  $1BCE
        lr   Q,DC
        lis  $01
        om
        lr   DC,Q
        st
        pi   L3AF5
        lis  $02
        lr   10,A
        pi   L3F2A

; Wait for NEXT key code (43/44). Operator must prepare the next input; no automatic rewind here.
L158D:
        pi   L37E3
        bz   L158D
        ai   $BD
        ci   $01
        bnc  L158D

; Resume mode, read replacement definition and first record, then return to command grammar. No schema comparison/header write.
        dci  $1BCE
        lr   Q,DC
        li   $FE
        nm
        lr   DC,Q
        st
        pi   L3AF5
        pi   L3BAF
        pi   L3B49
        br   L156F
L15AC:
        lr   K,P
        pi   $40A9
        dci  $1B10
        lm
        lr   0,A
        pi   L393A
        xdc
        dci  $1B12
        lm
        lr   0,A
L15BE:
        ds   0
        bnc  L15D6
        lm
        xdc
        cm
        xdc
        bz   L15D1
        ci   $3A
        bz   L15D1
L15CB:
        pi   $40BC
        clr
        com
        pk
L15D1:
        pi   L3948
        br   L15BE
L15D6:
        pi   $40BC
        clr
        ns   12
        pk
L15DC:
        lr   A,6
        lr   0,A
        pi   L393A
        li   $FF
        br   L1609
L15E5:
        dci  $0C22
        lm
        lr   3,A
        br   L15F3
L15EC:
        clr
        lr   3,A
        pi   L161A
        clr
        lr   3,A
L15F3:
        pi   L161A
L15F6:
        jmp  L171E
L15F9:
        lr   A,6
        lr   0,A
        pi   L393A
        lis  $07
        adc
        lr   Q,DC
        dci  $0C22
        lm
        sl   4
L1606:
        lr   DC,Q
        am
        lr   DC,Q
L1609:
        st
        br   L15F6
L160C:
        lr   A,6
        lr   0,A
        pi   L393A
        lis  $07
        adc
        lr   Q,DC
        dci  $0C22
        lm
        br   L1606
L161A:
        lr   K,P
        pi   $40A9
        lr   A,6
        lr   0,A
        pi   L393A
        lis  $07
        lr   0,A
        adc
        lr   H,DC
L1627:
        lr   DC,H
        lm
        sr   4
        lr   4,A
        lr   DC,H
        lm
        sl   4
        as   3
        lr   DC,H
        st
        lr   A,4
        lr   3,A
        pi   L3948
        lr   DC,H
        li   $FF
        adc
        lr   H,DC
        ds   0
        bnz  L1627
        jmp  L15D6

; Interpret table entries; dispatch through 3000 and 16F9.
L1641:
        lr   K,P
        pi   L38F4
        lm
        lr   1,A
        lm
        lr   3,A
        lm
        lisu 5
        lisl 0
        lr   12,A
        pi   L1741
L1650:
        lis  $01
        ns   3
        bz   L166A
        lr   DC,H
        lm
        lr   4,A
        ni   $80
        bnz  L165E
        jmp  L16C3
L165E:
        pi   L38C6
        lr   A,1
        st
        lr   A,4
        ni   $7F
        lr   1,A
        pi   L1741
L166A:
        lis  $01
        ns   3
        bnz  L169B
        lis  $02
        ns   3
        bz   L1680
        jmp  L16FD
L1675:
        bz   L169E
        lr   A,3
        oi   $01
        lr   3,A
        pi   L1741
        br   L169B
L1680:
        lr   DC,H
        cm
        lm
        ni   $80
        bz   L168B
        lr   A,1
        lr   2,A
        br   L16B0
L168B:
        li   $80
        nm
        bnz  L169E
        lr   A,1
        inc
        lr   1,A
        lr   DC,H
        lis  $03
        adc
        lr   H,DC
        lr   A,3
        oi   $01
        lr   3,A
L169B:
        jmp  L1650
L169E:
        pi   L38DD
        bz   L16AC
        cm
        lm
        lr   1,A
        pi   L1741
        jmp  L1650
L16AC:
        clr
        lr   QU,A
        br   L16BC
L16B0:
        lis  $03
        lr   10,A
        pi   L3F2A
L16B5:
        pi   L38DD
        bnz  L16B5
        lis  $01
        lr   QU,A
L16BC:
        lr   A,QU
        ai   $00
        lr   9,W
        jmp  L33CE
L16C3:
        clr
        xs   4
        bnz  L16CE
        lr   A,3
        oi   $02
        ni   $FE
        br   L16F2
L16CE:
        lis  $04
        ns   3
        bz   L16E4
        dci  $16F9
        lr   A,3
        sr   4
        adc
        lm
        lr   KU,A
        lm
        lr   KL,A

; Computed subroutine call through K; execution continues at 16DD.
        pk
L16DD:
        lr   A,3
        ni   $FB
        lr   3,A
        pi   L1741
L16E4:
        lr   A,4
        xs   5
        bnz  L16EF
        lr   A,3
        oi   $06
        ni   $FE
        br   L16F2
L16EF:
        lr   A,3
        ni   $FC
L16F2:
        lr   3,A
        pi   L3948
        jmp  L166A

; Big-endian parser callback addresses: 3036, 317C.
        db   $30,$36,$31,$7C

; Dispatch nonzero operation through table 3000 (one-based index).
L16FD:
        lisu 5
        lisl 0
        lis  $01
        ns   12
        bz   L1734
        lr   DC,H
        cm
        lm
        ni   $7F
        bz   L1734
        dci  $2FFE
        adc
        adc
        lm
        lr   KU,A
        lm
        lr   KL,A
        lr   A,1
        lisu 5
        lisl 1
        lr   13,A
        lr   A,3
        lr   13,A
        lr   A,5
        lr   13,A
        lr   A,6
        lr   13,A

; Computed handler call; handlers rejoin at 171E.
        pk
L171E:
        pi   L3948
        lisu 5
        lisl 1
        lr   A,13
        lr   1,A
        lr   A,13
        lr   3,A
        lr   A,13
        lr   5,A
        lr   A,12
        lr   6,A
        lisu 5
        lisl 0
        lis  $02
        ns   12
        bz   L1734
        jmp  L16B0
L1734:
        pi   L1741
        lis  $02
        adc
        lm
        ni   $7F
        lr   1,A
        lr   9,W
        jmp  L1675

; H = 1748 + 3 * R1: locate a three-byte interpreter entry.
L1741:
        lr   K,P
        dci  $1748
        lr   A,1
        adc
        adc
        adc
        lr   H,DC
        pk

; REVIEW grammar starts at entry 01: FLD -> 08 ('=') -> 09 (field name) -> 07 (end). EDIT starts at 10, excluding FLD.
        db   $27,$04,$08,$29,$05,$0A,$2B,$06
        db   $0C,$31,$02,$0E,$98,$00,$0E,$1F
        db   $03,$07,$7F,$80,$80,$2E,$80,$89

; Entry 09: required field-name token 21, operation 08 (13A0), then end-of-command entry 07.
        db   $21,$88,$87,$2E,$80,$8B,$21,$88
        db   $87,$2E,$80,$8D,$21,$88,$87,$0F

; Entries 0E/0F at 1772/1775: REVIEW output accepts trailing PTR (op 0A), otherwise op 07 clears it; then require end.
        db   $0A,$07,$00,$07,$87,$1B,$14,$17
        db   $0B,$0C,$16,$1D,$0D,$16,$19,$0E
        db   $16,$1F,$03,$16,$98,$07,$16,$7F
        db   $80,$80,$9B,$8B,$96,$11,$14,$99

; Entry 19: DESC -> operation 0F. Entry 18 optionally consumes PRINT, allowing PRINT DESC / P DESC.
        db   $17,$0F,$00,$9B,$80,$80,$21,$12
        db   $1F,$15,$10,$00,$03,$11,$00,$00
        db   $09,$80,$2E,$95,$A0,$21,$93,$A1
        db   $3A,$16,$23,$00,$00,$A6,$3A,$16
        db   $23,$21,$13,$21,$03,$13,$21,$2C
        db   $00,$28,$00,$00,$80,$15,$81,$80
        db   $30,$00,$29,$1C,$17,$2C,$03,$18
        db   $AE,$09,$00,$2C,$03,$18,$AE,$03
        db   $18,$2E,$00,$00,$80,$09,$00,$30
        db   $A9,$00,$00,$00,$00,$80,$09,$00
        db   $33,$A9,$00,$35,$B6,$00,$80,$12
        db   $19,$38,$00,$19,$80,$03,$1A,$B9
        db   $03,$1B,$80,$F0,$F0,$BD,$BD,$BD
        db   $BD,$BD,$BD,$BD,$BD
; vb1200c_3000-37ff_9_25_78_51
; SHA1 d98b94ae1cce2ce6e6ae933180a7bf001b73932f

; Operation 01 -> L14B3.

; 27 big-endian command-handler addresses, indexed from one.

; Cartridge image has a 2 KB zero-filled gap.
        org $2000, $00
        rorg $3000
        db   $14,$B3

; Operation 02 -> L141F.
        db   $14,$1F

; Operation 03 -> L140C.
        db   $14,$0C

; Operation 04 -> L138D.
        db   $13,$8D

; Operation 05 -> L1393.
        db   $13,$93

; Operation 06 -> L1399.
        db   $13,$99

; Operation 07 -> L1415.
        db   $14,$15

; Operation 08 -> L13A0.
        db   $13,$A0

; Operation 09 -> L1456.
        db   $14,$56

; Operation 0A -> L1411.
        db   $14,$11

; Operation 0B -> L1504.
        db   $15,$04

; Operation 0C -> L14EE.
        db   $14,$EE

; Operation 0D -> L1567.
        db   $15,$67

; Operation 0E -> L1571.
        db   $15,$71

; Operation 0F -> L1422.
        db   $14,$22

; Operation 10 -> L1434.
        db   $14,$34

; Operation 11 -> L143D.
        db   $14,$3D

; Operation 12 -> L145C.
        db   $14,$5C

; Operation 13 -> L147B.
        db   $14,$7B

; Operation 14 -> L1425.
        db   $14,$25

; Operation 15 -> L1499.
        db   $14,$99

; Operation 16 -> L149F.
        db   $14,$9F

; Operation 17 -> L15DC.
        db   $15,$DC

; Operation 18 -> L15E5.
        db   $15,$E5

; Operation 19 -> L15EC.
        db   $15,$EC

; Operation 1A -> L15F9.
        db   $15,$F9

; Operation 1B -> L160C.
        db   $16,$0C

; Parse next token from input buffer; command keyword lookup at 3115.
L3036:
        lr   K,P
        pi   $40A9
        lis  $0F
        lr   0,A
        dci  $0C10
        pi   L3986
L3042:
        pi   L3097
        ci   $00
        bz   L3042
        clr
        lr   5,A
        lr   6,A
        pi   L30C3
        ci   $01
        bnz  L3070
L3053:
        pi   L30B0
        pi   L30C3
        ci   $01
        bz   L3053
        ci   $03
        bz   L3053
        dci  $0C00
        pi   L3922
        jmp  L30E3
L306A:
        bnz  L3094
        li   $21
        br   L3093
L3070:
        ci   $03
        bnz  L3092
L3074:
        lr   A,6
        sl   1
        sl   1
        as   6
        sl   1
        lr   6,A
        pi   L38B6
        as   6
        lr   6,A
        pi   L30B0
        pi   L30C3
        ci   $03
        bz   L3074
        dci  $0C00
        pi   L3922
        lis  $03
        br   L3093
L3092:
        lr   A,8
L3093:
        lr   5,A
L3094:
        jmp  L37DD
L3097:
        lr   K,P
        dci  $0C00
        lm
        ci   $0E
        bc   L30A4
        li   $7F
        lr   8,A
        pk
L30A4:
        adc
        lm
        lr   8,A
        dci  $0C00
        pi   L391E
        clr
        xs   8
        pk
L30B0:
        lr   K,P
        pi   $40A9
        dci  $0C10
        lr   A,5
        adc
        inc
        lr   5,A
        lr   A,8
        st
        pi   L3097
        jmp  L15D6
L30C3:
        lr   K,P
        pi   $40A9
        lis  $01
        ns   8
        bz   L30D3
        lr   A,8
        ci   $33
        bnc  L30DC
        lis  $01
        br   L30DC
L30D3:
        pi   L38B6
        bm   L30DB
        lis  $03
        br   L30DC
L30DB:
        lr   A,8
L30DC:
        lr   0,A
        pi   $40BC
        clr
        xs   0
        pk
L30E3:
        dci  $0C10
        lr   Q,DC
        xdc
        dci  $3115
L30EB:
        lm
        lr   5,A
        ci   $7F
        bz   L3112

; Match the complete scanned word and dictionary terminator; no arbitrary keyword prefixes.
L30F1:
        pi   L3948
        lm
        lr   0,A
        xdc
        ci   $00
        bnz  L3102
        cm
        bnz  L3108
        clr
        com
        br   L3112
L3102:
        cm
        bnz  L3108
        xdc
        br   L30F1
L3108:
        lr   DC,Q
        xdc
L310A:
        clr
        xs   0
        bz   L30EB
        lm
        lr   0,A
        br   L310A
L3112:
        jmp  L306A

; Keyword 'P', interpreter index 11; 00 terminator.

; Keyword records: operation byte, glyph string, 00; final 7F sentinel.
        db   $11,$25,$00

; Keyword 'PRINT', interpreter index 11; 00 terminator.
        db   $11,$25,$09,$01,$2B,$07,$00

; Keyword 'T', interpreter index 31; 00 terminator.
        db   $31,$07,$00

; Keyword 'TOTAL', interpreter index 31; 00 terminator.
        db   $31,$07,$13,$07,$11,$27,$00

; Keyword 'E', interpreter index 1F; 00 terminator.
        db   $1F,$0B,$00

; Keyword 'EXIT', interpreter index 1F; 00 terminator.
        db   $1F,$0B,$33,$01,$07,$00

; Keyword 'A', interpreter index 0B; 00 terminator.
        db   $0B,$11,$00

; Keyword 'ADD', interpreter index 0B; 00 terminator.
        db   $0B,$11,$1F,$1F,$00

; Keyword 'R', interpreter index 1D; 00 terminator.
        db   $1D,$09,$00

; Keyword 'REPLACE', interpreter index 1D; 00 terminator.
        db   $1D,$09,$0B,$25,$27,$11,$31,$0B
        db   $00

; Keyword 'D', interpreter index 1B; 00 terminator.
        db   $1B,$1F,$00

; Keyword 'DELETE', interpreter index 1B; 00 terminator.
        db   $1B,$1F,$0B,$27,$0B,$07,$0B,$00

; Keyword 'M', interpreter index 19; 00 terminator.
        db   $19,$29,$00

; Keyword 'MERGE', interpreter index 19; 00 terminator.
        db   $19,$29,$0B,$09,$1B,$0B,$00

; Keyword 'DESC', interpreter index 17; 00 terminator.
        db   $17,$1F,$0B,$21,$31,$00

; Keyword 'ALL', interpreter index 15; 00 terminator.
        db   $15,$11,$27,$27,$00

; Keyword 'FLD', interpreter index 27; 00 terminator.
        db   $27,$1D,$27,$1F,$00

; Keyword 'SORT', interpreter index 29; 00 terminator.
        db   $29,$21,$13,$09,$07,$00

; Keyword 'TOT', interpreter index 2B; 00 terminator.
        db   $2B,$07,$13,$07,$00

; Keyword 'PTR', interpreter index 0F; 00 terminator.
        db   $0F,$25,$07,$09,$00

; Keyword table sentinel.
        db   $7F

; Parser callback for buffered numeric/field input.
L317C:
        lr   K,P
        pi   $40A9
        lr   A,6
        dci  $18D5
        adc
        lm
        dci  $1BDB
        cm
        bnz  L3191
        li   $7F
        lr   5,A
        br   L31C2
L3191:
        dci  $1BDB
        lm
        dci  $1BDC
        adc
        clr
        xm
        lr   8,A
        bnz  L31A1
        lis  $09
        br   L31BB
L31A1:
        pi   L30C3
        ci   $01
        bnz  L31AC
        li   $21
        br   L31BB
L31AC:
        ci   $03
        bnz  L31BA
        pi   L38B6
        dci  $0C22
        st
        lis  $03
        br   L31BB
L31BA:
        lr   A,8
L31BB:
        lr   5,A
        dci  $1BDB
        pi   L391E
L31C2:
        jmp  L15D6

; Database definition: DB, then every field's NAME/LENGTH/TYPE. Mode 3 makes DESC read-only; ignores FLD selection.
L31C5:
        lr   K,P
        pi   L38F4
        dci  $117D
        pi   L33DD
        clr
        lr   3,A
L31D1:
        lr   A,3
        dci  $180C
        cm
        bz   L31E2
        lr   A,3
        lr   0,A
        pi   L31E4
        lr   A,3
        inc
        lr   3,A
        br   L31D1
L31E2:
        br   L31FB
L31E4:
        lr   K,P
        pi   L38F4
L31E8:
        dci  $180D
        lr   A,3
        sl   1
        sl   1
        adc
        adc
        lr   H,DC
        dci  $3259
        pi   L33F1
        clr
        xs   7
        bp   L31FD
L31FB:
        br   L3256
L31FD:
        lr   A,3
        dci  $18D5
        adc
        lm
        lr   0,A
        dci  $0C18
        pi   L3839
        dci  $325D
        pi   L33DD
        dci  $0C18
        pi   L3888
        lr   A,3
        dci  $18D5
        adc
        clr
        xs   1
        st
        bz   L324E
        ci   $7E
        bnc  L324E
        lr   A,3
        dci  $18E9
        adc
        lr   H,DC
        dci  $3263
        pi   L33F1
        lr   A,3
        dci  $18E9
        adc
        lm
        ci   $11
        bz   L324C
        ci   $01
        bz   L3242
        ci   $29
        bnz  L324E
L3242:
        lr   A,3
        dci  $18D5
        adc
        lm
        ci   $0F
        bnc  L324E
L324C:
        br   L3256
L324E:
        lis  $03
        lr   10,A
        pi   L3F2A
        jmp  L31E8
L3256:
        jmp  L33CE

; Descriptors at 3259/325D/3263: NAME (8 chars), LENGTH (3), TYPE (1).
        db   $3F,$87,$06,$08,$3F,$8D,$08,$0C
        db   $18,$03,$3F,$F3,$06,$01
L3267:
        dci  $1B0F
        clr
        xm
        bnz  L3279
        lis  $03
        dci  $1B0B
        st
        pi   L31C5
        jmp  L331D
L3279:
        ci   $01
        bnz  L32DD
L327D:
        dci  $1B1B
        clr
        xm
        bm   L32A4
        dci  $1B10
        clr
        xm
        bz   L32A4
        pi   L3B40
        dci  $1B11
        lm
        ci   $7F
        bz   L329C
        dci  $1B11
        pi   L3922
L329C:
        dci  $1B10
        pi   L3922
        br   L327D
L32A4:
        dci  $1B11
        clr
        xm
        bm   L32CA
        bz   L32CA
        dci  $1B1B
        clr
        xm
        bm   L32CA
        pi   L3320
        pi   L3B40
        dci  $1B11
        lm
        ci   $7F
        bz   L32C8
        dci  $1B11
        pi   L3922
L32C8:
        br   L32A4
L32CA:
        clr
        dci  $1B1B
        xm
        bm   L32D6
        pi   L3320
        br   L32DB
L32D6:
        lis  $01
        lr   10,A
        pi   L3F2A
L32DB:
        br   L331D
L32DD:
        ci   $02
        bnz  L331A
        dci  $1B1B
        clr
        xm
        bm   L32F2
        dci  $1B11
        clr
        xm
        bm   L32F2
        pi   L3B40
L32F2:
        dci  $1B1B
        clr
        xm
        bm   L3303
        pi   L15AC
        bz   L3303
L32FE:
        pi   L3B40
        br   L32F2
L3303:
        bm   L330A
        pi   L3320
        br   L3311
L330A:
        lis  $01
        lr   10,A
        pi   L3F2A
        br   L3318
L3311:
        dci  $1B11
        clr
        xm
        bnz  L32FE
L3318:
        br   L331D
L331A:
        jmp  L123F
L331D:
        jmp  L141D
L3320:
        lr   K,P
        pi   L38F4
        clr
        lr   6,A
L3326:
        lr   A,6
        inc
        dci  $180C
        cm
        bc   L3331
        jmp  L33DA

; FLD display gate: negative 1B0C shows all fields; otherwise process only matching zero-based R6. Stored record is unchanged.
L3331:
        clr
        dci  $1B0C
        xm
        bm   L3340
        com
        inc
        as   6
        bz   L3340
        jmp  L33D4
L3340:
        dci  $0C18
        xdc
        dci  $180D
        lr   A,6
        sl   1
        sl   1
        adc
        adc
        clr
        lr   4,A
L334E:
        lis  $08
        xs   4
        bz   L335E
        clr
        xm
        bz   L335E
        xdc
        st
        xdc
        lr   A,4
        inc
        lr   4,A
        br   L334E
L335E:
        xdc
        li   $2A
        st
        clr
        st
        lis  $02
        as   4
        lr   4,A
        dci  $0C10
        lis  $0C
        st
        li   $18
        st
        lr   A,4
        st
        lr   A,6
        dci  $18E9
        adc
        lm
        ci   $11
        bnz  L3399
        dci  $18AD
        lr   A,6
        adc
        adc
        lm
        xdc
        dci  $0C13
        st
        xdc
        lm
        xdc
        st
        xdc
        dci  $18D5
        lr   A,6
        adc
        lm
        xdc
        st
        pi   L340C
        br   L33C6
L3399:
        dci  $0C24
        st
        lr   A,6
        dci  $18D5
        adc
        lm
        lr   1,A
        lr   A,6
        lr   0,A
        pi   L393A
        lr   A,1
        lr   0,A
        pi   L3A77
        dci  $0C13
        li   $1B
        st
        li   $DC
        st
        xdc
        lr   A,6
        dci  $18D5
        adc
        lm
        xdc
        st
        pi   L340C
        pi   L3A29
L33C6:
        clr
        xs   7
        bp   L33D4
        clr
        xs   6
        bnz  L33D4
L33CE:
        pi   L3908
        clr
        xs   7
        pk
L33D4:
        lr   A,6
        inc
        lr   6,A
        jmp  L3326
L33DA:
        jmp  L34E7

; Copy six-byte input descriptor to 0C10, then enter input routine.
L33DD:
        lr   K,P
        pi   L38F4
        xdc
        dci  $0C10
        xdc
        lis  $06
        lr   0,A
L33E8:
        lm
        xdc
        st
        xdc
        ds   0
        bnz  L33E8
        br   L3410

; Build input descriptor using H as buffer pointer.
L33F1:
        lr   K,P
        pi   L38F4
        xdc
        dci  $0C10
        lis  $03
        lr   0,A
L33FB:
        xdc
        lm
        xdc
        st
        ds   0
        bnz  L33FB
        lr   A,10
        st
        lr   A,11
        st
        xdc
        lm
        xdc
        st
        br   L3410
L340C:
        lr   K,P
        pi   L38F4
L3410:
        clr
        lr   7,A
        lis  $01
        dci  $1B0B
        xm
        bnz  L342B
        pi   $41C8
        dci  $0C13
        lm
        lr   10,A
        lm
        lr   11,A
        lm
        lr   0,A
        clr
        lr   DC,H
L3427:
        st
        ds   0
        bnz  L3427
L342B:
        clr
        lisu 4
        lisl 0
        lr   13,A
        lr   13,A
        lr   13,A
        lr   13,A
        lr   13,A
        li   $70
        lisl 2
        lr   12,A
        pi   L3556
        lisu 4
        lisl 2
        lr   A,12
        dci  $0FDF
        st
        pi   $45B0

; Mode 3 bypasses keyboard editing through 3544, including DESC in EDIT.
        lis  $03
        dci  $1B0B
        cm
        bnz  L344E
        jmp  L3544
L344E:
        dci  $0877
        lis  $07
        st
L3453:
        pi   L37E3
        bz   L3453
        ci   $3A
        bnc  L346D
        pi   L37BD
        dci  $0C13
        pi   L3934
        lisu 4
        lisl 1
        lr   A,12
        adc
        lr   A,8
        st
        br   L3488
L346D:
        ci   $3E
        bnc  L3484
        clr
        lr   8,A
        pi   L37BD
        dci  $0C13
        pi   L3934
        lisu 4
        lisl 1
        lr   A,12
        adc
        lr   A,8
        st
        br   L34A7
L3484:
        ci   $40
        bnc  L34A9
L3488:
        lisu 4
        lisl 0
        lr   A,12
        com
        lisl 4
        as   12
        ai   $FF
        bnc  L3499
        lis  $01
        lr   0,A
        pi   L36E4
        br   L34A7
L3499:
        dci  $0C15
        lm
        ai   $FF
        lisu 4
        lisl 1
        xs   12
        bz   L34A7
        pi   L3556
L34A7:
        br   L34D0
L34A9:
        ci   $42
        bnc  L34B2
        clr
        com
        lr   7,A
        br   L34E9
L34B2:
        ci   $44
        bnc  L34EC
        clr
        com
        lisu 4
        lisl 2
        as   12
        lisl 4
        as   12
        dci  $0FDF
        lr   H,DC
        xm
        sr   4
        bz   L34D2
        lr   DC,H
        lm
        ni   $0F
        com
        ai   $11
        lr   0,A
        pi   L36E4
L34D0:
        br   L34DF
L34D2:
        lisu 4
        lisl 3
        lr   A,13
        as   13
        dci  $0C15
        xm
        bz   L34E1
        pi   L3556
L34DF:
        br   L351F
L34E1:
        dci  $0877
        li   $87
        st
L34E7:
        clr
        lr   7,A
L34E9:
        jmp  L33CE
L34EC:
        ci   $46
        bnc  L3521
        lisu 4
        lisl 2
        lr   A,12
        dci  $0FDF
        lr   H,DC
        xm
        sr   4
        bz   L3512
        lr   DC,H
        lm
        ni   $0F
        ai   $10
        lr   0,A
        lisl 0
        com
        inc
        as   12
        lr   A,0
        bc   L350A
        lr   A,12
L350A:
        com
        inc
        lr   0,A
        pi   L36E4
        br   L351F
L3512:
        lisl 3
        xs   14
        bz   L351B
        pi   L3641
        br   L351F
L351B:
        lisl 0
        clr
        lr   13,A
        lr   12,A
L351F:
        br   L3535
L3521:
        lisu 4
        lisl 0
        clr
        xs   13
        bz   L352F
        li   $FF
        lr   0,A
        pi   L36E4
        br   L3535
L352F:
        xs   12
        bz   L3535
        pi   L3641
L3535:
        lisu 4
        lisl 0
        lr   A,12
        lisl 2
        as   12
        dci  $0FDF
        st
        pi   $45B0
        jmp  L3453
L3544:
        lisu 4
        lisl 3
        lr   A,13
        as   13
        dci  $0C15
        xm
        bz   L3553
        pi   L3556
        br   L3544
L3553:
        jmp  L34E7
L3556:
        lr   K,P
        pi   $40A9
        lisu 4
        lisl 2
        lr   A,12
        com
        ai   $11
        bp   L3563
        clr
L3563:
        dci  $0C16
        st
        lr   A,12
        ci   $70
        bnz  L35B0
        dci  $0C12
        lm
        sr   4
        inc
        lr   0,A
        pi   L36C6
        dci  $0C12
        lm
        sr   4
        sl   4
        com
        ai   $61
        dci  $0FDF
        st
        dci  $0C10
        lm
        lr   10,A
        lm
        lr   11,A
        lm
        lr   0,A
        lr   DC,H
        pi   L36F2
        lisu 4
        lisl 2
        dci  $0FDF
        lm
        lr   12,A
        dci  $0C12
        lm
        ni   $0F
        com
        ai   $11
        lr   0,A
        dci  $0C15
        com
        inc
        am
        lr   A,0
        bc   L35AE
        dci  $0C15
        lm
L35AE:
        br   L35CE
L35B0:
        lis  $01
        lr   0,A
        pi   L36C6
        dci  $0C16
        lm
        lisu 4
        lisl 2
        as   12
        ai   $F0
        lr   12,A
        lisl 3
        lr   A,13
        as   13
        com
        inc
        dci  $0C15
        am
        ci   $10
        bc   L35CE
        li   $10
L35CE:
        dci  $0C17
        st
        dci  $0C17
        lm
        lr   0,A
        dci  $0C13
        pi   L3934
        lisu 4
        lisl 3
        lr   A,13
        as   12
        adc
        pi   L36F2
        dci  $0C16
        lm
        com
        inc
        am
        lisu 4
        lisl 4
        as   12
        lr   12,A
        lisl 2
        as   12
        com
        ai   $71
        lr   0,A
        clr
        lr   8,A
L35F8:
        ds   0
        bnc  L3600
        pi   L37BD
        br   L35F8
L3600:
        dci  $0C16
        lm
        lisu 4
        lisl 3
        as   12
        lr   14,A
        lr   A,12
        com
        ai   $61
        bp   L360F
        clr
L360F:
        lisl 0
        lr   12,A
        lisl 3
        as   12
        lisl 1
        lr   12,A

; After screen formatting, mode 3 plus nonzero PTR flag invokes printer output; otherwise normal display pacing.
        lis  $03
        dci  $1B0B
        xm
        bnz  L3628
        clr
        dci  $1B1A
        xm
        bz   L3628
        pi   L3716
        br   L363E
L3628:
        lis  $03
        dci  $1B0B
        xm
        bnz  L363E
        lisu 2
        lisl 4
        li   $1E
        lr   12,A
        pi   L37E3
        bz   L363E
L3639:
        pi   L37E3
        bz   L3639
L363E:
        jmp  L15D6
L3641:
        lr   K,P
        pi   $40A9
        lisu 4
        lisl 3
        lr   A,12
        ci   $10
        bc   L364E
        li   $10
L364E:
        dci  $0C16
        st
        lisl 2
        lr   A,12
        lisl 4
        as   12
        ai   $A0
        bp   L365B
        clr
L365B:
        st
        lis  $05
        lr   2,A
L365E:
        lr   A,2
        inc
        sl   4
        dci  $0FDF
        st
        dci  $0F3F
        lr   A,2
        sl   4
        adc
        li   $10
        lr   0,A
        pi   L36F2
        ds   2
        bp   L365E
        dci  $0FDF
        clr
        st
        dci  $0C16
        lm
        ci   $0F
        bnc  L368E
        dci  $0C10
        lm
        lr   10,A
        lm
        lr   11,A
        lm
        lr   0,A
        lr   DC,H
        pi   L36F2
L368E:
        dci  $0C13
        lm
        lr   10,A
        lm
        lr   11,A
        dci  $0C16
        lm
        lr   0,A
        com
        inc
        lisu 4
        lisl 3
        as   12
        lr   DC,H
        adc
        pi   L36F2
        dci  $0C16
        lm
        com
        ai   $11
        lisu 4
        lisl 2
        lr   12,A
        lm
        com
        inc
        dci  $0C16
        am
        lisl 4
        as   12
        lr   14,A
        dci  $0C16
        lm
        com
        inc
        as   12
        lr   12,A
        lisl 1
        lr   14,A
        clr
        lr   12,A
        br   L36E1
L36C6:
; R0 is the formatter scroll count; the original printer path does not copy it to 0C28.
        lr   K,P
        pi   $40A9
; Optional printer correction hooks here, using padding at 17F8 and 3FF9.
        clr
        dci  $0FDF
        st
        lr   A,0
        lr   2,A
        ci   $06
        bnc  L36E1
        sl   4
        dci  $0F3F
        adc
        com
        ai   $71
        lr   0,A
        pi   L36F2
L36E1:
        jmp  L15D6
L36E4:
        lr   K,P
        pi   $40A9
        lisu 4
        lisl 0
        lr   A,12
        as   0
        lr   13,A
        lr   A,12
        as   0
        lr   12,A
        br   L36E1
L36F2:
        lr   K,P
        pi   $40A9
L36F6:
        clr
        xm
        lr   Q,DC
        bm   L3701
        lr   8,A
        pi   L37BD
        br   L370F
L3701:
        com
        lr   1,A
        clr
        lr   8,A
L3705:
        pi   L37BD
        ds   0
        ds   1
        bp   L3705
        lis  $01
        as   0
        lr   0,A
L370F:
        lr   DC,Q
        ds   0
        bnz  L36F6
        jmp  L15D6

; Printer dump: send Expander command bytes 04 02 02 (300-baud selector, host-to-printer route).
L3716:
        lr   K,P
        pi   $40A9
        pi   L3B26
        lis  $04
        lr   0,A
        pi   L3DEC
        bm   L377F
        lis  $02
        lr   0,A
        pi   L3DEC
        bm   L377F
        lis  $02
        lr   0,A
        pi   L3DEC
        bm   L377F

; Each buffered line: NUL, five ASCII spaces, sixteen converted screen glyphs, then CR/LF.
L3732:
        clr
        lr   0,A
        pi   L3E2D
        lis  $05
        lr   1,A
L3739:
        li   $20
        lr   0,A
        pi   L3E2D
        ds   1
        bnz  L3739
        dci  $0C28
        lm
        sl   4
        com
        ai   $71
        dci  $0F3F
        adc
        lr   H,DC
        li   $10
        lr   1,A

; Read sixteen glyphs from the screen buffer; convert to ASCII with table 3782 before serial transmission.
L3752:
        lr   DC,H
        lm
        lr   H,DC
        dci  $3782
        adc
        lm
        lr   0,A
        pi   L3E2D
        bm   L377F
        ds   1
        bnz  L3752

; Terminate printer line with CR (0D) and LF (0A); repeat for buffered line count 0C28.
        lis  $0D
        lr   0,A
        pi   L3E2D
        bm   L377F
        lis  $0A
        lr   0,A
        pi   L3E2D
        bm   L377F
        dci  $0C28
        pi   L3922
        bnz  L3732
        li   $60
        outs 1
        pi   L3E64
L377F:
        jmp  L3B19

; BIOS glyph -> printer/ASCII lookup, indexed at 3755.
        db   $20,$49,$27,$55,$21,$59,$2F,$54
        db   $2A,$52,$39,$45,$38,$57,$37,$51
        db   $25,$41,$2E,$4F,$23,$4B,$29,$4A
        db   $28,$48,$2F,$47,$5F,$46,$36,$44
        db   $35,$53,$34,$5A,$31,$50,$23,$4C
        db   $24,$4D,$3A,$4E,$2C,$42,$3D,$56
        db   $2B,$43,$33,$58,$32,$3F,$30,$3B
        db   $5C,$27,$2A
L37BD:
        lr   K,P
        pi   $40A9
        pi   $40D9
        dci  $0FDF
        lm
        dci  $0F3F
        adc
        lr   A,8
        st
        dci  $0FDF
        lm
        inc
        ci   $6F
        bc   L37D9
        li   $6F
L37D9:
        dci  $0FDF
        st
L37DD:
        pi   L3948
        jmp  L15D6
L37E3:
        lr   K,P
        pi   $40A9
L37E7:
        pi   $4361
        bz   L37F1
        pi   $41C8
        br   L37E7
L37F1:
        clr
        xs   8
        dci  $0FE3
        lr   Q,DC
        bnz  L37FC
        st
        br   L382B
L37FC:
        cm
        bnz  L3803
        clr
; vb-1200_3800-3fff_9_26_78
; SHA1 3a38a889b552acaa1a284e2ca7447f142b494737

        lr   8,A
        br   L382B
L3803:
        lr   DC,Q
        st
        dci  $0FE2
        lr   Q,DC
        ci   $1E
        bnz  L3822
        lis  $01
        xm
        lr   DC,Q
        st
        dci  $0FB9
        lr   Q,DC
        lm
        ci   $94
        li   $9A
        bz   L381E
        li   $94
L381E:
        lr   DC,Q
        st
        br   L382B
L3822:
        sl   1
        lr   8,A
        clr
        xm
        bnz  L3829
        ds   8
L3829:
        br   L3832
L382B:
        pi   $41C8
        lisl 4
        ds   12
        bnz  L37E7
L3832:
        lisu 3
        pi   $40BC
        clr
        xs   8
        pk

; Convert unsigned byte R0 to three decimal glyphs at DC.
L3839:
        lr   K,P
        pi   $40A9
        lr   Q,DC
        pi   $41C8
        clr
        lr   1,A
        lr   A,0
        ci   $63
        bc   L384E
        lis  $01
        lr   1,A
        li   $9C
        as   0
        lr   0,A
L384E:
        ci   $63
        bc   L3858
        lis  $02
        lr   1,A
        li   $9C
        as   0
        lr   0,A
L3858:
        lr   A,1
        lr   8,A
        pi   L38AD
        lr   DC,Q
        st
        lr   Q,DC
        clr
        lr   1,A
L3862:
        lr   A,1
        inc
        lr   1,A
        li   $F6
        as   0
        lr   0,A
        bp   L3862
        ai   $0A
        lr   0,A
        clr
        xs   1
        bz   L387A
        ds   1
        lr   A,1
        lr   8,A
        pi   L38AD
        br   L387B
L387A:
        clr
L387B:
        lr   DC,Q
        st
        lr   Q,DC
        lr   A,0
        lr   8,A
        pi   L38AD
        lr   DC,Q
        st
        jmp  L15D6

; Convert three decimal glyphs at DC to binary value.
L3888:
        lr   K,P
        pi   $40A9
        lr   Q,DC
        pi   $41C8
        lis  $03
        lr   2,A
        clr
        lr   1,A
L3894:
        lr   DC,Q
        lm
        lr   Q,DC
        lr   8,A
        pi   L38B6
        bm   L38A7
        lr   A,1
        sl   1
        sl   1
        as   1
        sl   1
        as   0
        lr   1,A
        ds   2
        bnz  L3894
L38A7:
        pi   $40BC
        clr
        xs   1
        pk

; Decimal digit -> BIOS glyph, using reverse table ending at 2467.
L38AD:
        lr   K,P
        dci  $2468
        lr   A,8
        com
        adc
        lm
        pk
L38B6:
        lr   K,P
        lis  $09
        lr   0,A
        lr   A,8
        dci  $245E
L38BD:
        cm
        bz   L38C3
        ds   0
        bp   L38BD
L38C3:
        clr
        xs   0
        pk
L38C6:
        lr   K,P
        dci  $1B03
        lr   Q,DC
        clr
        xm
        lr   9,W
        bnz  L38D1
        pk
L38D1:
        ai   $FF
        lr   DC,Q
        st
        lr   Q,DC
        lm
        inc
L38D8:
        lr   DC,Q
        st
        adc
        lr   W,9
        pk
L38DD:
        lr   K,P
        dci  $1B03
        lr   Q,DC
        lm
        ci   $03
        lr   9,W
        bnz  L38E9
        pk
L38E9:
        lr   DC,Q
        lm
        inc
        lr   DC,Q
        st
        lr   Q,DC
        clr
        com
        am
        br   L38D8
L38F4:
        di
        xdc
        dci  $1BEC
        lm
        inc
        inc
        dci  $1BEC
        st
        adc
        lr   A,KU
        st
        lr   A,KL
L3904:
        st
        xdc
        lr   W,9
        pop
L3908:
        di
        xdc
        dci  $1BEC
        lm
        adc
        lm
        lr   KU,A
        lm
        lr   KL,A
        dci  $1BEC
        lm
        ai   $FE
        dci  $1BEC
        br   L3904

; Increment byte at DC.
L391E:
        di
        lis  $01
        br   L3925

; Decrement byte at DC.
L3922:
        di
        clr
        com
L3925:
        am
        lr   0,A
        lr   A,9
        lr   9,W
        ni   $F0
        xs   9
        lr   9,A
        clr
        com
        adc
        lr   A,0
        st
        lr   W,9
        pop

; Load pointer from memory at DC.
L3934:
        di
        br   L3941
L3937:
        di
        br   L393E
L393A:
        di
        dci  $18AD
L393E:
        lr   A,0
        adc
        adc
L3941:
        lm
        lr   QU,A
        lm
        lr   QL,A
        lr   DC,Q
        lr   9,W
        pop
L3948:
        lr   K,P
        lisu 4
        lisl 6
        lr   A,10
        lr   13,A
        lr   A,11
        lr   12,A
        lr   H,DC
        dci  $1BCF
        lr   A,10
        st
        lr   A,11
        st
        xdc
        lr   H,DC
        xdc
        lr   A,10
        st
        lr   A,11
        st
        li   $90
        dci  $08FB
        cm
        bnc  L396F
        pi   $40A9
        pi   $41C8
        pi   $40BC
L396F:
        dci  $1BCF
        lm
        lr   10,A
        lm
        lr   11,A
        xdc
        lr   DC,H
        xdc
        lm
        lr   10,A
        lm
        lr   11,A
        lr   DC,H
        xdc
        lisu 4
        lisl 6
        lr   A,13
        lr   10,A
        lr   A,12
        lr   11,A
        pk

; Clear R0 bytes starting at DC.
L3986:
        lr   K,P
        pi   $40A9
L398A:
        ds   0
        bnc  L3994
        clr
        st
        pi   L3948
        br   L398A
L3994:
        jmp  L15D6
L3997:
        lr   K,P
        pi   $40A9
        lr   Q,DC
        xdc
        lr   H,DC
        lr   DC,Q
        lisu 3
        lisl 0
L39A1:
        lm
        lr   13,A
        br7  L39A1
        lm
        lr   13,A
        lr   DC,H
        lisu 4
L39A9:
        lm
        lr   13,A
        br7  L39A9
        lm
        lr   13,A
        pi   $41C8
        pi   L39C1
        lr   DC,Q
        lisu 3
        lisl 0
L39B8:
        lr   A,13
        st
        br7  L39B8
        lr   A,13
        st
        jmp  L15D6
L39C1:
        lr   K,P
        lisl 0
        lisu 3
        lr   A,12
        lisu 4
        xs   12
        bnz  L39ED
L39C9:
        lis  $01
        lr   6,A
        lis  $07
        lr   5,A
        com
        lr   9,W
        lisl 7
L39D0:
        lr   A,12
        ai   $66
        lr   W,9
        bnc  L39DA
        asd  6
        lr   9,W
        ai   $66
L39DA:
        lisu 3
        asd  12
        lr   14,A
        lisu 4
        bnc  L39E1
        lr   9,W
L39E1:
        ds   5
        bnz  L39D0
        pk

; Unreferenced entry: select alternate eight-byte arithmetic path at 39CA.
L39E5:
        lr   K,P
        lisl 0
        lisu 3
        lr   A,12
        lisu 4
        xs   12
        bnz  L39C9
L39ED:
        lis  $07
        lr   5,A
        li   $66
        lr   7,A
        lis  $01
        lisl 7
L39F4:
        lr   6,A
        lr   A,12
        com
        lisu 3
        asd  12
        lr   9,W
        as   6
        asd  7
        bnc  L39FF
        lr   9,W
L39FF:
        lr   14,A
        lisu 4
        lis  $02
        ns   9
        sr   1
        ds   5
        bnz  L39F4
        lisu 3
        clr
        lr   8,A
        xs   9
        clr
        bnz  L3A25
        lis  $07
        lr   5,A
        lis  $01
        lisl 7
L3A12:
        lr   6,A
        lr   A,12
        com
        asd  8
        lr   9,W
        as   6
        asd  7
        bnc  L3A1C
        lr   9,W
L3A1C:
        lr   14,A
        lis  $02
        ns   9
        sr   1
        ds   5
        bnz  L3A12
        clr
        com
L3A25:
        lisl 0
        xs   12
        lr   12,A
        pk
L3A29:
        lr   K,P
        pi   $40A9
        clr
        dci  $1BDB
        st
        lr   A,6
        lr   0,A
        pi   L393A
        lis  $08
        lr   0,A
        pi   L3986
        lisl 4
L3A3D:
        lisu 5
        lr   A,12
        lisu 3
        lr   14,A
        br7  L3A3D
        dci  $1B03
        lm
        lr   12,A
        dci  $1B03
        lis  $03
        st
        lr   A,6
        dci  $18E9
        adc
        lm

; Numeric conversion: type I (glyph 01) uses request 30; M uses request 33 with fractional grammar.
        ci   $01
        dci  $3A71
        bz   L3A5D
        dci  $3A74
L3A5D:
        pi   L1641
        lisu 3
        lisl 7
        lr   A,12
        dci  $1B03
        st
        lisl 4
L3A68:
        lisu 3
        lr   A,12
        lisu 5
        lr   14,A
        br7  L3A68
        jmp  L15D6

; Three-byte interpreter requests for field input.
        db   $30,$25,$01,$33,$25,$01
L3A77:
        lr   K,P
        pi   $40A9
        lr   Q,DC
        lis  $07
        lr   1,A
        lr   A,0
        ai   $FF
        lr   2,A
        ai   $FE
        lr   4,A
L3A85:
        clr
        xs   2
        bz   L3AC8
        lr   A,1
        lr   DC,Q
        adc
        lm
        lr   3,A
        ni   $0F
        lr   8,A
        pi   L38AD
        lr   8,A
        lr   A,2
        dci  $1BDC
        adc
        lr   A,8
        st
        ds   2
        bz   L3AC8
        lr   A,3
        sr   4
        lr   8,A
        pi   L38AD
        lr   8,A
        lr   A,2
        dci  $1BDC
        adc
        lr   A,8
        st
        ds   2
        bz   L3AC8
        lr   A,2
        xs   4
        bnz  L3AC5

; Only M (glyph 29) inserts a decimal point before the final two digits. I displays whole numbers.
        dci  $0C24
        lm
        ci   $29
        bnz  L3AC5
        lr   A,2
        dci  $1BDC
        adc
        li   $12
        st
        ds   2
L3AC5:
        ds   1
        br   L3A85
L3AC8:
        lr   DC,Q
        clr
        xm
        bnz  L3AD0
        clr
        br   L3AD2
L3AD0:
        li   $1C
L3AD2:
        dci  $1BDC
        st
        lis  $01
        lr   2,A
L3AD8:
        lr   A,0
        ai   $FF
        xs   2
        bz   L3AF2
        lr   A,2
        dci  $1BDC
        adc
        lm
        ci   $36
        bnz  L3AF2
        li   $FF
        adc
        clr
        st
        lis  $01
        as   2
        lr   2,A
        br   L3AD8
L3AF2:
        jmp  L15D6

; Initialize Expander link; send 05, 00 and mode byte from 1BCE.
L3AF5:
        lr   K,P
        pi   $40A9
        pi   L3B26
        lis  $05
        lr   0,A
        pi   L3DEC
        bm   L3B24
        clr
        lr   0,A
        pi   L3DEC
        bm   L3B24
        dci  $1BCE
        lm
        lr   0,A
        pi   L3DEC
        bm   L3B24
        pi   L3E64
        bm   L3B24
L3B19:
        clr
        outs $0E
        dci  $0C25
        clr
        com
        st
        jmp  L3E76
L3B24:
        br   L3B7F
L3B26:
        lr   K,P
        lis  $01
        outs $0E
        clr
        dci  $0C25
        st
        lisu 3
        lisl 3
        li   $10
        lr   12,A
        dci  $1BD9
        li   $3E
        st
        li   $E6
        st
        li   $40
        outs 1
        pk

; Copy/advance: commit current record via 3B8C, then read next source record.
L3B40:
        lr   K,P
        pi   $40A9
        pi   L3B8C
        br   L3B4D

; Read next source record without committing current buffer; used to omit deleted records.
L3B49:
        lr   K,P
        pi   $40A9
L3B4D:
        dci  $0C27
        clr
        xm
        bz   L3B5C
        dci  $1901
        pi   L3C36
        br   L3B4D
L3B5C:
        dci  $18FD
        lm
        xdc
        dci  $0C29
        st
        xdc
        lm
        xdc
        st
        lis  $03
        dci  $0C27
        st
L3B6E:
        dci  $1901
        pi   L3C36
        bz   L3B89
        bm   L3B89
        dci  $0C27
        clr
        xm
        bnz  L3B6E
L3B7F:
        lis  $04
        lr   10,A
        pi   L3F2A
L3B84:
        pi   $41C8
        br   L3B84
L3B89:
        jmp  L15D6

; Write current record in EDIT/ENTER; REVIEW suppresses tape writes via 0C26.
L3B8C:
        lr   K,P
        pi   $40A9
        dci  $0C26
        clr
        xm
        bz   L3B9A
        jmp  L130F
L3B9A:
        dci  $18FD
        lm
        xdc
        dci  $1901
        st
        xdc
        lm
        xdc
        st
L3BA7:
        dci  $1901
L3BAA:
        pi   L3BEE
        br   L3B89

; Load 253-byte definition payload at 1802..18FE, including record length; 1800/1801 hold block length. No schema comparison.
L3BAF:
        lr   K,P
        pi   $40A9
        dci  $0C29
        clr
        st
        li   $FD
        st
        lis  $03
        dci  $0C27
        st
L3BC0:
        dci  $1800
        pi   L3C36
        bz   L3B89
        dci  $0C27
        clr
        xm
        bnz  L3BC0
        br   L3B7F

; Write database definition. EDIT calls this once before its first record; MERGE does not call it.
L3BD1:
        lr   K,P
        pi   $40A9
        dci  $1800
        clr
        st
        li   $FD
        st
        dci  $1800
        br   L3BAA

; Write zero-length output end marker; EDIT uses this on EXIT after copying remaining input.
L3BE2:
        lr   K,P
        pi   $40A9
        clr
        dci  $1901
        st
        st
        br   L3BA7
L3BEE:
        lr   K,P
        pi   $40A9
        lr   H,DC
        pi   L3D25
        lr   A,5
        st
        lr   A,6
        st
        lisu 4
        lisl 6
        lis  $03
        lr   13,A
L3BFE:
        lis  $02
        lr   12,A
        dci  $3C32
        pi   L3DDA
        pi   L3D79
        bc   L3C2F
        pi   L3D5F
        lm
        lr   0,A
        lis  $04
        am
        lr   1,A
        lr   A,0
        lnk
        lr   0,A
        lr   DC,H
        pi   L3D6D
        pi   L3D79
        bc   L3C2F
        pi   L3DB9
        pi   L3D5F
        lisu 4
        lisl 6
        ds   13
        bnz  L3BFE
L3C2A:
        lr   9,W
        pi   $40BC
        pk
L3C2F:
        jmp  L3B7F

; Four-byte peripheral transfer descriptor.
        db   $02,$01,$01,$28
L3C36:
        lr   K,P
        pi   $40A9
        lr   H,DC
        lisu 4
        lisl 7
        lis  $02
        lr   12,A
        dci  $3C9B
        pi   L3DDA
        pi   L3D79
        bc   L3C89
        lisu 4
        lisl 7
        lis  $01
        lr   12,A
        dci  $0C29
        lm
        lr   0,A
        lis  $03
        am
        lr   1,A
        lr   A,0
        lnk
        lr   0,A
        pi   L3D5F
        pi   L3D66
        pi   L3D79
        bc   L3C7C
        pi   L3DB9
        clr
        xs   5
        bnz  L3C89
        pi   L3D5F
        pi   L3D25
        lm
        xs   5
        bnz  L3C89
        lm
        xs   6
        bnz  L3C89
        clr
        br   L3C8A
L3C7C:
        dci  $1901
        clr
        om
        om
        om
        om
        bnz  L3C89
        com
        br   L3C8A
L3C89:
        lis  $01
L3C8A:
        dci  $1B1B
        st
        dci  $0C27
        pi   L3922
        dci  $1B1B
        clr
        xm
        br   L3C2A

; Four-byte peripheral transfer descriptor.
        db   $01,$01,$01,$01

; Unreferenced entry: port status and register/flag restoration.
L3C9F:
        lr   6,A
        lr   A,9
        lr   4,A
        lr   9,W
        clr
        outs 1
        ins  1
        ci   $20
        bz   L3CAB
        ds   5
L3CAB:
        lr   W,9
        lr   A,4
        lr   9,A
        lis  $01
        lr   0,A
        lr   1,A
        di
        lr   9,W
        lr   A,6
        pop

; Interrupt-driven byte transfer through host port 1.
L3CB5:
        lr   6,A
        lr   A,IS
        lisu 4
        lisl 0
        lr   13,A
        lr   A,9
        lr   13,A
        lr   9,W
        lr   A,10
        lr   13,A
        lr   A,11
        lr   13,A
        lr   H,DC
        lr   A,10
        lr   13,A
        lr   A,11
        lr   13,A
        clr
        lr   2,A
        outs 1
        nop
        nop
        nop
        ins  1
        ni   $20
        bz   L3CD7
        ds   5
L3CD2:
        clr
        lr   0,A
        lr   1,A
        br   L3D12
L3CD7:
        lisl 7
        lis  $01
        xs   12
        bz   L3CF6
        ds   3
        bp   L3CEB
        ds   1
        bc   L3CE5
        ds   0
        bnc  L3CD2
L3CE5:
        lr   DC,Q
        lm
        lr   4,A
        lr   Q,DC
        lis  $07
        lr   3,A
L3CEB:
        lr   A,4
        sr   1
        sr   1
        ni   $20
        outs 1
        lr   A,4
        sl   1
        lr   4,A
        br   L3D12
L3CF6:
        lr   A,4
        sl   1
        lr   4,A
        ins  1
        sr   4
        sr   1
        sr   1
        ni   $01
        as   4
        lr   4,A
        ds   3
        bnz  L3D12
        lr   DC,Q
        lr   A,4
        st
        clr
        lr   4,A
        lr   Q,DC
        ds   1
        bc   L3D10
        ds   0
        bnc  L3CD2
L3D10:
        lis  $08
        lr   3,A
L3D12:
        lisu 4
        lisl 5
        lr   A,14
        lr   11,A
        lr   A,14
        lr   10,A
        lr   DC,H
        lr   A,14
        lr   11,A
        lr   A,14
        lr   10,A
        lr   W,9
        lr   A,14
        lr   9,A
        lr   A,12
        lr   IS,A
        lr   A,6
        ei
        pop

; Compute two-byte checksum over a length-prefixed block.
L3D25:
        lr   K,P
        pi   $40A9
        clr
        lr   5,A
        lr   6,A
        lr   Q,DC
        lm
        lr   0,A
        lis  $02
        am
        lr   1,A
        lr   A,0
        lnk
        lr   0,A
L3D35:
        pi   L3948
        lr   DC,Q
        ds   1
        bc   L3D3F
        ds   0
        bnc  L3D47
L3D3F:
        lm
        lr   Q,DC
        lr   4,A
        pi   L3D4A
        br   L3D35
L3D47:
        jmp  L15D6
L3D4A:
        lr   A,4
        xs   6
        lr   7,A
        sr   4
        xs   7
        lr   7,A
        sl   4
        xs   5
        lr   6,A
        lr   A,7
        sr   1
        sr   1
        sr   1
        xs   6
        lr   6,A
        lr   A,7
        sl   4
        sl   1
        xs   7
        lr   5,A
        pop
L3D5F:
        lr   K,P
        lr   A,7
        lr   10,A
        lr   A,8
        lr   11,A
        lr   DC,H
        pk
L3D66:
        lr   K,P
        pi   L3D6D
        lis  $08
        lr   3,A
        pk
L3D6D:
        lr   Q,DC
        li   $3C
        outs $0C
        li   $B5
        outs $0D
        clr
        lr   3,A
        lis  $01
        outs $0E
        pop
L3D79:
        lr   K,P
        ei
        lr   9,W
        pi   $40A9
        lisu 3
        lisl 2
        clr
        lr   12,A
L3D83:
        lis  $07
        lr   2,A
L3D85:
        pi   $41C8
        ds   2
        bm   L3D94
        bnz  L3D85
        lisu 3
        lisl 2
        ds   12
        bnz  L3D83
        br   L3DAB
L3D94:
        lis  $0F
        lr   2,A
L3D96:
        clr
        as   5
        bnz  L3DAB
        as   0
        as   3
        bnz  L3DA1
        as   1
        bz   L3DB3
L3DA1:
        pi   $41C8
        ds   2
        bz   L3DB6
        bm   L3D94
        bp   L3D96
L3DAB:
        di
        li   $60
        outs 1
        clr
L3DB0:
        inc
        bnc  L3DB0
L3DB3:
        jmp  L3DD4
L3DB6:
        com
        br   L3DB3
L3DB9:
        lr   K,P
        pi   $40A9
        li   $3C
        outs $0C
        li   $9F
        outs $0D
        lis  $0A
        lr   0,A
        lr   1,A
        ei
        lr   9,W
        lis  $01
        outs $0E
L3DCA:
        pi   $41C8
        ds   0
        bnz  L3DCA
        ds   1
        bnz  L3DCA
        sr   1
L3DD4:
        di
        clr
        outs $0E
        jmp  L3C2A
L3DDA:
        lr   K,P
        lr   A,10
        lr   7,A
        lr   A,11
        lr   8,A
        clr
        lr   5,A
        lr   0,A
        lis  $04
        lr   1,A
        pi   L3D6D
        li   $40
        outs 1
        ei
        pk

; Send eight bits, MSB first, via timed callback 3E17.
L3DEC:
        lr   K,P
        pi   $40A9
        li   $3E
        lr   QU,A
        li   $17
        lr   QL,A
        lis  $08
        lisu 3
        lisl 7
        lr   12,A
L3DFA:
        lr   A,0
        sr   1
        sr   1
        sr   1
        sr   4
        lr   2,A
        lr   A,0
        sl   1
        lr   0,A
        pi   L3E13
        bp   L3E0B
        jmp  L15CB
L3E0B:
        lisu 3
        lisl 7
        ds   12
        bnz  L3DFA
        jmp  L15D6
L3E13:
        lr   K,P
        jmp  L3E76

; Output bit on port 1 bit 5; check peripheral response.
L3E17:
        lis  $01
        dci  $1B1B
        xm
        bz   L3E25
        clr
        outs 1
        ins  1
        ni   $20
        bz   L3E28
L3E25:
        clr
        com
        pk
L3E28:
        lr   A,2
        sl   4
        sl   1
        outs 1
        pk

; Serial byte output with framing through callback 3E17.
L3E2D:
        lr   K,P
        pi   $40A9
; Original serial startup; the optional idle correction replaces these six bytes.
        li   $3E
        lr   QU,A
        li   $17
        lr   QL,A
        clr
        lr   2,A
        pi   L3E13
        bm   L3E5E
        lis  $08
        lisu 3
        lisl 7
        lr   12,A
L3E42:
        lis  $01
        ns   0
        lr   2,A
        lr   A,0
        sr   1
        lr   0,A
        pi   L3E13
        bm   L3E5E
        lisu 3
        lisl 7
        ds   12
        bnz  L3E42
        lis  $01
        lr   2,A
        pi   L3E13
        bm   L3E5E
        pi   L3E13
        bp   L3E61
L3E5E:
        jmp  L15CB
L3E61:
        jmp  L15D6

; Sample peripheral status through timed callback 3E6E.
L3E64:
        lr   K,P
        li   $3E
        lr   QU,A
        li   $6E
        lr   QL,A
        jmp  L3E76
L3E6E:
        clr
        outs 1
        ins  1
        ci   $20
        clr
        ns   12
        pk
L3E76:
        li   $3E
        outs $0C
        li   $B5
        outs $0D
        lisu 3
        lisl 4
        lr   A,10
        lr   13,A
        lr   A,11
        lr   13,A
        pi   $40A9
        lisu 3
        lisl 6
        lis  $0A
        lr   12,A
        dci  $1BD3
        lm
        lr   10,A
        lm
        lr   11,A
        xdc
        lr   DC,H
        xdc
        lm
        lr   10,A
        lm
        lr   11,A
        lis  $02
        adc
        lm
        lr   KU,A
        lm
        lr   KL,A
        lr   P,K
        dci  $1BD7
        lm
        lr   KU,A
        lm
        lr   KL,A
        lr   DC,H
        xdc
        lr   W,9
        lisu 3
        lisl 3
        lr   A,14
        lr   9,A
        lr   A,14
        lr   11,A
        lr   A,14
        lr   10,A
        lr   A,14
        lr   IS,A
        lr   A,8
        ei
        pop

; Save context and install interrupt transfer state.
L3EB5:
        lr   8,A
        lr   A,IS
        lisu 3
        lisl 0
        lr   13,A
        lr   A,10
        lr   13,A
        lr   A,11
        lr   13,A
        lr   A,9
        lr   13,A
        lr   H,DC
        dci  $1BD3
        lr   A,10
        st
        lr   A,11
        st
        xdc
        lr   H,DC
        xdc
        lr   A,10
        st
        lr   A,11
        st
        lr   A,KU
        st
        lr   A,KL
        st
        lr   K,P
        lr   A,KU
        st
        lr   A,KL
        st
        lr   9,W
        lisu 3
        lisl 6
        lis  $0A
        lr   12,A
        lisl 4
        lr   A,13
        lr   10,A
        lr   A,13
        lr   11,A
        pi   $40BC
        lr   P0,Q

; Expander interrupt service continuation.
L3EE6:
        dci  $0FE5
        li   $E0
        st
        dci  $1B1B
        li   $FE
        nm
        dci  $1B1B
        st
L3EF6:
        pi   $4501
        pi   $424D
        lisu 3
        lisl 6
        ds   12
        bc   L3F0C
        pi   L3F1F
        lis  $01
        dci  $1B1B
        st
        pi   L3EB5
L3F0C:
        dci  $0C25
        clr
        xm
        bz   L3EF6
        dci  $0FE5
        li   $F5
        st
        pi   $40BC
        jmp  L15D6
L3F1F:
        di
        clr
        outs $0E
        li   $60
        outs 1
        clr
L3F26:
        inc
        bnz  L3F26
        pop

; Display message selected by HU through pointer table 3F47.
L3F2A:
        lr   K,P
        pi   $40A9
        lis  $01
        lr   0,A
        pi   L36C6
        li   $60
        dci  $0FDF
        st
        dci  $3F47
        lr   A,10
        lr   0,A
        pi   L3937
        li   $10
        lr   0,A
        jmp  L36F6

; Five big-endian message pointers; glyph strings follow.
        db   $3F,$75,$3F,$95,$3F,$A1,$3F,$6D
        db   $3F,$B1

; Glyph text: 'PROGRAM'.

; Menu and prompt text in BIOS glyph encoding; F0 padding at 3FF9.
        db   $25,$09,$13,$1B,$09,$11,$29,$E7

; Glyph text: 'ENTER'.
        db   $0B,$2B,$07,$0B,$09,$F5

; Glyph text: 'REVIEW'.
        db   $09,$0B,$2F,$01,$0B,$0D,$F6

; Glyph text: 'EDIT'.
        db   $0B,$1F,$01,$07,$E4,$2A,$F1,$35
        db   $F1,$2A,$1A,$1F,$2D,$2A,$00

; Glyph text: 'TOO LONG'.
        db   $07,$13,$13,$00,$27,$13,$2B,$1B
        db   $F8

; Glyph text: 'OK'.
        db   $13,$15

; Glyph text: '(Y/N)?'.
        db   $18,$05,$1A,$2B,$16,$35,$00

; Glyph text: 'NAME:'.
        db   $2B,$11,$29,$0B,$2A,$00

; Glyph text: 'LENGTH:'.
        db   $27,$0B,$2B,$1B,$07,$19,$2A,$00

; Glyph text: 'END OF TAPE'.
        db   $0B,$2B,$1F,$00,$13,$1D,$00,$07
        db   $11,$25,$0B,$FB

; Glyph text: 'REWIND'.
        db   $09,$0B,$0D,$01,$2B,$1F,$2C,$00

; Glyph text: 'KEY NEXT'.
        db   $15,$0B,$05,$00,$2B,$0B,$33,$07

; Glyph text: 'I/O ERR'.
        db   $01,$1A,$13,$00,$0B,$09,$09,$F7

; Glyph text: 'TOTAL FIELD:'.
        db   $07,$13,$07,$11,$27,$00,$1D,$01
        db   $0B,$27,$1F,$2A,$FA

; Glyph text: 'SORT FIELD:'.
        db   $21,$13,$09,$07,$00,$1D,$01,$0B
        db   $27,$1F,$2A,$F9

; Glyph text: 'VALUE:'.
        db   $2F,$11,$27,$03,$0B,$2A,$00

; Glyph text: 'COUNT='.
        db   $31,$13,$03,$2B,$07,$2E

; Glyph text: 'TOTAL='.
        db   $07,$13,$07,$11,$27,$2E,$F5

; Glyph text: 'GRAND TOTAL='.
        db   $1B,$09,$11,$2B,$1F,$00,$07,$13
        db   $07,$11,$27,$2E,$FB

; Glyph text: 'TYPE:'.
        db   $07,$05,$25,$0B,$2A,$00,$F0,$F0
        db   $F0,$F0,$F0,$F0,$F0

        rend
