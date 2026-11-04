; Patent rally rules using fixed collision bodies, independent of drawing slots.
; The caller owns persistent state and frame/interrupt scheduling.

PATENT_EVENT_WALL = $01
PATENT_EVENT_LEFT_SCORE = $02
PATENT_EVENT_RIGHT_SCORE = $04
PATENT_EVENT_NET_HIDE = $08
PATENT_EVENT_LEFT_IMAGE = $10
PATENT_EVENT_RIGHT_IMAGE = $20
PATENT_EVENT_PADDLE = $40
PATENT_EVENT_SIDE = $80

; R0/R2 = X integer/fraction, R1/R3 = Y integer/fraction.
; R4/R5 = VY low/high, R6/R7 = VX low/high. All pairs are signed 8.8.
; Advances X/Y modulo 65536. Preserves velocities and R8-R11/J.
; Clobbers A, W, K. Save fractions before calling PatentRallyResolve.
PatentBallAdvance:
        lr K,P
        lr A,2
        as 6
        lr 2,A
        lr A,0
        lnk
        as 7
        lr 0,A
        lr A,3
        as 4
        lr 3,A
        lr A,1
        lnk
        as 5
        lr 1,A
        pk

; R8 = remaining hits, initially 4. Call only for a paddle/side hit.
; The fourth and subsequent hits double VY/VX (R4-R7), modulo 65536.
; Returns R8 >= 1. Preserves R0-R3/J. Clobbers A, W, K.
PatentBallHitSpeed:
        lr K,P
        ds 8
        bnz PatentBallHitSpeedDone
        lis 1
        lr 8,A
        lr A,4
        as 4
        lr 4,A
        lr A,5
        lnk
        as 5
        lr 5,A
        lr A,6
        as 6
        lr 6,A
        lr A,7
        lnk
        as 7
        lr 7,A
PatentBallHitSpeedDone:
        pk

; R0/R1 = integer ball X/Y, R4-R7 = velocities as above.
; Reads logical paddle Y from bodies 22/23 ($0CDA/$0CDE).
; Returns corrected X/Y and velocities, R3 = event mask.
; On a paddle hit, R10 = side 0/1 and R2 = corrected logical paddle Y.
; Side hits may move the paddle; caller must redraw it with that Y.
; Fractions are retained by the caller, including at clamps, as in the patent.
; Preserves J. Clobbers R2/R3/R8/R10/R11, A, W, K, DC0, BIOS K-stack scratch.
; Requires initialized retail BIOS K stack and valid J, with interrupts off.
; No RAM writes. Replaces retail collision dispatch; do not run both paths.
PatentRallyResolve:
        lr K,P
        lr A,9
        lr 11,A
        ni $0f
        lr 9,A
        pi $40a9
        di
        lis 0
        lr 3,A
        lr A,1
        ci 56
        bnc PatentRallyLowerWall
        li 57
        br PatentRallyWall
PatentRallyLowerWall:
        ci 231
        bc PatentRallyNet
        li 231
PatentRallyWall:
        lr 1,A
        pi PatentBallReverseY
        lis PATENT_EVENT_WALL
        lr 3,A
PatentRallyNet:
        lr A,0
        ci 91
        bc PatentRallyImage
        ci 96
        bnc PatentRallyImage
        lr A,3
        oi PATENT_EVENT_NET_HIDE
        lr 3,A
PatentRallyImage:
        lr A,0
        ci 51
        bc PatentRallyRightImage
        ci 93
        bnc PatentRallyRightImage
        lr A,7
        ai 0
        bm PatentRallyScore
        lr A,3
        oi PATENT_EVENT_LEFT_IMAGE
        lr 3,A
        br PatentRallyScore
PatentRallyRightImage:
        lr A,0
        ci 93
        bc PatentRallyScore
        ci 136
        bnc PatentRallyScore
        lr A,7
        ai 0
        bp PatentRallyScore
        lr A,3
        oi PATENT_EVENT_RIGHT_IMAGE
        lr 3,A
PatentRallyScore:
        lr A,0
        ci 7
        bnc PatentRallyRightExit
        lis 8
        lr 0,A
        lr A,3
        oi PATENT_EVENT_RIGHT_SCORE
        lr 3,A
        jmp PatentRallyDone
PatentRallyRightExit:
        ci 180
        bc PatentRallyPaddles
        li 180
        lr 0,A
        lr A,3
        oi PATENT_EVENT_LEFT_SCORE
        lr 3,A
        jmp PatentRallyDone
PatentRallyPaddles:
        ci 28
        bnc PatentRallyLeftRegion
        jmp PatentRallyDone
PatentRallyLeftRegion:
        ci 39
        bc PatentRallyLeftPaddle
        ci 148
        bnc PatentRallyRightRegion
        jmp PatentRallyDone
PatentRallyRightRegion:
        ci 159
        bc PatentRallyRightPaddle
        jmp PatentRallyDone
PatentRallyLeftPaddle:
        lis 0
        lr 10,A
        dci $0cda
        br PatentRallyPaddleY
PatentRallyRightPaddle:
        lis 1
        lr 10,A
        dci $0cde
PatentRallyPaddleY:
        lm
        lr 2,A
        lr A,1
        com
        ai $ed
        as 2
        bnc PatentRallyBelowPaddle
        jmp PatentRallyDone
PatentRallyBelowPaddle:
        lr A,2
        com
        ai $ed
        as 1
        bnc PatentRallyPaddleTop
        jmp PatentRallyDone
PatentRallyPaddleTop:
        lr A,1
        com
        ai $ee
        as 2
        bnc PatentRallyPaddleBottom
        lr A,5
        ai 0
        bm PatentRallyPaddleBottom
        bz PatentRallyPaddleBottom
        lr A,2
        ci 75
        bnc PatentRallyPaddleTopY
        li 76
        lr 2,A
PatentRallyPaddleTopY:
        ai <-19
        br PatentRallySideHit
PatentRallyPaddleBottom:
        lr A,2
        com
        ai $ee
        as 1
        bnc PatentRallyPenetration
        lr A,5
        ai 0
        bp PatentRallyPenetration
        lr A,2
        ci 212
        bc PatentRallyPaddleBottomY
        li 212
        lr 2,A
PatentRallyPaddleBottomY:
        ai 19
PatentRallySideHit:
        lr 1,A
        pi PatentBallReverseY
        lr A,3
        oi PATENT_EVENT_PADDLE+PATENT_EVENT_SIDE
        lr 3,A
        br PatentRallyDone
PatentRallyPenetration:
        lr A,0
        ci 33
        bnc PatentRallyRightPenetration
        li 28
        lr 0,A
        br PatentRallyDone
PatentRallyRightPenetration:
        ci 154
        bc PatentRallyFrontHit
        li 160
        lr 0,A
        br PatentRallyDone
PatentRallyFrontHit:
        lr A,10
        lr 0,A
        pi PatentPaddleHit
        lr A,10
        ai 0
        li 40
        bz PatentRallyFrontX
        li 148
PatentRallyFrontX:
        lr 0,A
        lr A,3
        oi PATENT_EVENT_PADDLE
        lr 3,A
PatentRallyDone:
        pi $40bc
        lr A,11
        lr 9,A
        di
        pk

PatentBallReverseY:
        lr K,P
        lr A,5
        com
        lr 5,A
        lr A,4
        com
        inc
        lr 4,A
        lr A,5
        lnk
        lr 5,A
        pk
