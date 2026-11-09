; Two seven-line digits per score, interleaved into the retail score RAM area.
; Old score/results writers must be retired before enabling this adapter.
PATENT_SCORE_LEFT_BITMAP = $0f60
PATENT_SCORE_RIGHT_BITMAP = $0f6e

; R0 = side 0/1; reads the corresponding packed-decimal game score.
; Builds 14 bitmap bytes and display slot 12/13, with identical field pointers.
; Origins X=70/102, Y=58; left black, right blue. Paired Y is an adaptation choice.
; Uses initialized BIOS K stack/J; returns with interrupts disabled.
; Clobbers R1-R3, A, W, K, DC0/DC1, IS, BIOS K-stack scratch; preserves R0/J.
PatentScoreUpdate:
        lr K,P
        pi $40a9
        di
        dci PATENT_GAME_LEFT_SCORE
        lr A,0
        adc
        lm
        lr 3,A
        dci PATENT_SCORE_LEFT_BITMAP
        lr A,0
        ai 0
        bz PatentScoreDestination
        dci PATENT_SCORE_RIGHT_BITMAP
PatentScoreDestination:
        xdc
        lr A,3
        sr 4
        lr 1,A
        pi PatentScoreCopyDigit
        xdc
        li $f3
        adc
        xdc
        lr A,3
        ni $0f
        lr 1,A
        pi PatentScoreCopyDigit
        ifconst PATENT_CARTRIDGE
        ; Both digits are written; R3 and A are dead. Split the point-frame run.
        ei
        nop
        di
        endif
        dci $0cb0
        lr A,0
        sl 1
        sl 1
        adc
        lr A,0
        sl 4
        sl 1
        ai 78
        st
        lis 8
        st
        li 61
        st
        lis 3
        st
        dci $082c
        lr A,0
        adc
        li $42
        st
        dci $0c4c
        lr A,0
        adc
        lis 7
        st
        li 47
        adc
        lis 7
        st
        lr A,0
        ai 0
        li <PATENT_SCORE_LEFT_BITMAP
        bz PatentScorePointer
        li <PATENT_SCORE_RIGHT_BITMAP
PatentScorePointer:
        lr 1,A
        lr A,0
        sl 4
        sl 1
        ai $0f
        lr 2,A
        dci $0c2c
        lr A,0
        adc
        lr A,1
        st
        lis 15
        adc
        lr A,2
        st
        li 31
        adc
        lr A,1
        st
        lis 15
        adc
        lr A,2
        st
        pi $40bc
        di
        pk

; R1 = digit 0-9, DC1 = destination column. Writes seven bytes at stride two.
; Advances DC1 by 14. Clobbers R2, A, W, K, DC0/DC1. Preserves R0/R1/R3/J.
PatentScoreCopyDigit:
        lr K,P
        lr A,1
        sl 1
        sl 1
        sl 1
        lr 2,A
        lr A,1
        com
        inc
        as 2
        dci PatentScoreDigits
        adc
        lis 7
        lr 2,A
PatentScoreCopyRow:
        lm
        xdc
        st
        lis 1
        adc
        xdc
        ds 2
        bnz PatentScoreCopyRow
        pk

        include "score-digits.inc"
