; Stock VideoBrain paddle adapter. Caller owns frame/interrupt scheduling.
; Retire retail collision consumers of virtual records 22/23 before calling.

PATENT_PADDLE_MIN = 70
PATENT_PADDLE_MAX = 218
PATENT_PADDLE_Y_OFFSET = 39
PATENT_PADDLE_HEIGHT = 32
PATENT_PADDLE_HALF_HEIGHT = 16
PATENT_PADDLE_HALF_WIDTH = 4
PATENT_PADDLE_LEFT_X = 34
PATENT_PADDLE_RIGHT_X = 154
; DX cache for slots 1/2. The red field service copies it to $0821/$0822
; with the BIOS pointer transfer, so width and image change together.
PATENT_PADDLE_DX = $0d0a

; R1 = patent MAP result, 0-199. Returns logical center Y in A.
; Clobbers A, W, K. This does not replace the stock joystick capture ISR.
        ifnconst PATENT_CARTRIDGE
PatentPaddleMapInput:
        lr K,P
        lr A,1
        ai PATENT_PADDLE_Y_OFFSET
        ci PATENT_PADDLE_MIN-1
        bnc PatentPaddleMapUpper
        li PATENT_PADDLE_MIN
PatentPaddleMapUpper:
        ci PATENT_PADDLE_MAX
        bc PatentPaddleMapDone
        li PATENT_PADDLE_MAX
PatentPaddleMapDone:
        pk
        endif

; R0 = side (0 left, 1 right), R1 = logical center Y, R2 = hit image (0/1).
; Returns clamped logical Y in R1. Clobbers R3-R8, R10-R11, A, W, K, DC0.
; Updates display slots 1/2 (DX via PATENT_PADDLE_DX) and collision bodies 22/23.
; Call with interrupts disabled during the scene update phase.
PatentPaddleUpdate:
        lr K,P
        lr A,1
        ci PATENT_PADDLE_MIN-1
        bnc PatentPaddleUpdateUpper
        li PATENT_PADDLE_MIN
PatentPaddleUpdateUpper:
        ci PATENT_PADDLE_MAX
        bc PatentPaddleUpdateY
        li PATENT_PADDLE_MAX
PatentPaddleUpdateY:
        lr 1,A
        lr A,0
        sl 4
        lr 3,A
        lr A,2
        sl 1
        sl 1
        sl 1
        as 3
        dci PatentPaddleDescriptors
        adc
        lm
        lr 4,A
        lm
        lr 5,A
        lm
        lr 7,A
        lm
        lr 8,A
        lm
        lr 6,A
        lm
        lr 10,A
        lm
        lr 11,A
        lm
        lr 3,A
        dci $0c84
        lr A,0
        sl 1
        sl 1
        adc
        lr A,4
        st
        lr A,5
        st
        lr A,1
        inc
        st
        li PATENT_PADDLE_HALF_HEIGHT
        st
        dci $0c21
        lr A,0
        adc
        lr A,8
        st
        lis 15
        adc
        lr A,6
        st
        li 31
        adc
        lr A,10
        st
        lis 15
        adc
        lr A,11
        st
        dci PATENT_PADDLE_DX
        lr A,0
        adc
        lr A,7
        st
        dci $0c41
        lr A,0
        adc
        li PATENT_PADDLE_HEIGHT
        st
        li 47
        adc
        li PATENT_PADDLE_HEIGHT
        st
        dci $0cd8
        lr A,0
        sl 1
        sl 1
        adc
        lr A,3
        st
        lis PATENT_PADDLE_HALF_WIDTH
        st
        lr A,1
        st
        li PATENT_PADDLE_HALF_HEIGHT
        st
        pk

; Front contact only: R0 = side, R1 = ball Y, R2 = paddle Y, difference -19..19.
; Returns VY low/high in R4/R5 and VX low/high in R6/R7, all 8.8 signed.
; Clobbers R8, A, W, K, DC0. Speed progression is applied by the caller.
PatentPaddleHit:
        lr K,P
        lis 5
        lr 8,A
        lr A,2
        com
        as 1
        ai $ed
PatentPaddleHitBand:
        ds 8
        ai 8
        bm PatentPaddleHitBand
        lr A,8
        sl 1
        dci PatentPaddleHitVelocities
        adc
        lm
        lr 4,A
        lm
        lr 5,A
        li $80
        lr 6,A
        lr A,0
        ni 1
        bz PatentPaddleHitLeft
        li $fe
        lr 7,A
        pk
PatentPaddleHitLeft:
        lis 1
        lr 7,A
        pk

PatentPaddleHitVelocities:
        db $aa,$fd,$fd,$fe,$00,$00,$03,$01,$56,$02

; Draw center X, draw half-width, DX, odd pointer/color, even pointer/color,
; collision center X. Image growth must not move or widen the collision body.
PatentPaddleDescriptors:
        db 34,4,$41,<PatentLP1O,>PatentLP1O+$c0,<PatentLP1E,>PatentLP1E+$c0,34
        db 38,8,$42,<PatentLP2O,>PatentLP2O+$c0,<PatentLP2E,>PatentLP2E+$c0,34
        db 154,4,$41,<PatentRP1O,>PatentRP1O+$20,<PatentRP1E,>PatentRP1E+$20,154
        db 150,8,$42,<PatentRP2O,>PatentRP2O+$20,<PatentRP2E,>PatentRP2E+$20,154

        include "paddle-images.inc"
