; Patent paddle images from the e5frog reconstruction.
; Adam placeholders remain unresolved; selected nonzero fills are marked below.

PatentLP1O:
        db $1c,$1c,$1c,$1c,$1c,$18,$38,$7e ; TODO: verify Missing byte: e5frog $7E at $12f0
        db $fe,$fe,$ba,$ba,$ba,$ba,$ba,$ba
        db $38,$ba,$3a,$3f,$2f,$2f,$2f,$2f
        db $28,$28,$28,$28,$28,$28,$3c,$3c

PatentLP1E:
        db $1c,$3e,$1c,$1c,$1c,$18,$7c,$7e
        db $fe,$fa,$ba,$ba,$ba,$ba,$ba,$ba
        db $ba,$ba,$3a,$3f,$2f,$2f,$2f,$28
        db $28,$28,$28,$28,$28,$28,$3c,$3c ; TODO: verify Missing bytes: e5frog $3C,$3C at $1327

PatentLP2O:
        db $1c,$e0,$1c,$e0,$1c,$e0,$1c,$e0
        db $1c,$e0,$18,$40,$38,$40,$7c,$40
        db $ff,$c0,$ff,$00,$b8,$00,$b8,$00
        db $b8,$00,$b8,$00,$b8,$00,$b8,$00
        db $38,$00,$b8,$00,$3e,$00,$3e,$00
        db $22,$00,$22,$00,$22,$00,$22,$00
        db $22,$00,$22,$00,$22,$00,$e2,$00
        db $e2,$00,$82,$00,$83,$00,$03,$00

PatentLP2E:
        db $1c,$e0,$3e,$e0,$1c,$e0,$1c,$e0
        db $1c,$40,$18,$40,$7c,$40,$7e,$00
        db $ff,$c0,$fa,$00,$b8,$00,$b8,$00
        db $b8,$00,$b8,$00,$b8,$00,$b8,$00 ; TODO: verify Missing byte: e5frog $B8 at $1387
        db $b8,$00,$be,$00,$3e,$00,$3e,$00
        db $22,$00,$22,$00,$22,$00,$22,$00
        db $22,$00,$22,$00,$e2,$00,$e2,$00
        db $82,$00,$82,$00,$03,$00,$03,$00

PatentRP1O:
        db $38,$38,$38,$38,$38,$18,$1c,$7e
        db $7f,$7f,$5d,$5d,$5d,$5d,$5d,$5d
        db $1c,$5d,$5c,$fc,$f4,$f4,$f4,$f4
        db $14,$14,$14,$14,$14,$14,$3c,$3c

PatentRP1E:
        db $38,$7c,$38,$38,$38,$18,$3e,$7e
        db $7f,$5f,$5d,$5d,$5d,$5d,$5d,$5d
        db $5d,$5d,$5c,$fc,$f4,$f4,$f4,$14
        db $14,$14,$14,$14,$14,$14,$3c,$3c

PatentRP2O:
        db $07,$38,$07,$38,$07,$38,$07,$38
        db $07,$38,$02,$18,$02,$1c,$02,$3e
        db $03,$ff,$00,$ff,$00,$1d,$00,$1d
        db $00,$1d,$00,$1d,$00,$1d,$00,$1d
        db $00,$1c,$00,$1d,$00,$7c,$00,$7c
        db $00,$44,$00,$44,$00,$44,$00,$44
        db $00,$44,$00,$44,$00,$44,$00,$47
        db $00,$47,$00,$41,$00,$c1,$00,$c0

PatentRP2E:
        db $07,$38,$07,$7c,$07,$38,$07,$38
        db $02,$38,$02,$18,$02,$3e,$00,$7e
        db $03,$ff,$00,$5f,$00,$1d,$00,$1d
        db $00,$1d,$00,$1d,$00,$1d,$00,$1d
        db $00,$1d,$00,$7d,$00,$7c,$00,$7c
        db $00,$44,$00,$44,$00,$44,$00,$44 ; TODO: verify Missing byte: e5frog $44 at $1458
        db $00,$44,$00,$44,$00,$47,$00,$47
        db $00,$41,$00,$41,$00,$c0,$00,$c0
