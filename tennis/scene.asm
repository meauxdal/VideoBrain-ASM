; Complete patent scene through retail display records and field shadows.
; Retire all old policy/graphics consumers before enabling this path.
PATENT_SCENE_FLAGS = $0cf5
PATENT_SCENE_SELECTION = $0d05
PATENT_SCENE_SAVED_J = $0d06
PATENT_SCENE_SCORE_CACHE = $0d07

; R0 = slot 0-15, DC0 = eight-byte descriptor:
; height, DX, center X/Y, odd pointer/color lo/hi, even pointer/color lo/hi.
; Height is 1-63 and DX width is 1-31; zero has hardware wrap semantics.
; Makes the slot visible. Caller may set its Y-high flag afterward.
; Interrupts must be disabled. Preserves R0/J; clobbers R1-R8/R10/R11, A/W/K/DC0.
PatentSceneWriteObject:
        lr K,P
        lm
        lr 6,A
        lm
        lr 5,A
        lm
        lr 1,A
        lm
        lr 2,A
        lm
        lr 7,A
        lm
        lr 8,A
        lm
        lr 10,A
        lm
        lr 11,A
        dci $0c80
        lr A,0
        sl 1
        sl 1
        adc
        lr A,1
        st
        lr A,5
        ni $1f
        sl 1
        sl 1
        st
        lr A,2
        st
        lr A,6
        sr 1
        st
        dci $0820
        lr A,0
        adc
        lr A,5
        st
        dci $0c40
        lr A,0
        adc
        lr A,6
        st
        li 47
        adc
        lr A,6
        st
        dci $0c20
        lr A,0
        adc
        lr A,7
        st
        lis 15
        adc
        lr A,8
        st
        li 31
        adc
        lr A,10
        st
        lis 15
        adc
        lr A,11
        st
        dci PATENT_SCENE_FLAGS
        lr A,0
        adc
        lis 0
        st
        pk

; Initializes all 16 slots, fixed court and paddle bodies, then the live scene.
; Requires initialized game state/BIOS K stack, interrupts off and J's I bit clear.
; Clobbers R0-R8/R10/R11, A/W/K/DC0/DC1/IS, BIOS K-stack scratch; preserves J.
PatentSceneInit:
        lr K,P
        pi $40a9
        di
        dci PATENT_SCENE_SCORE_CACHE
        li $ff
        st
        st
        lis 0
        lr 0,A
PatentSceneInitBlank:
        dci PatentSceneBlank
        pi PatentSceneWriteObject
        dci PATENT_SCENE_FLAGS
        lr A,0
        adc
        li $80
        st
        lr A,0
        inc
        lr 0,A
        ci 15
        bc PatentSceneInitBlank
        lis 7
        lr 0,A
        dci PatentSceneUpper
        pi PatentSceneWriteObject
        lis 8
        lr 0,A
        dci PatentSceneLower
        pi PatentSceneWriteObject
        lis 0
        lr 0,A
        li 144
        lr 1,A
        lis 0
        lr 2,A
        pi PatentPaddleUpdate
        lis 1
        lr 0,A
        li 144
        lr 1,A
        lis 0
        lr 2,A
        pi PatentPaddleUpdate
        pi PatentSceneUpdate
        pi $40bc
        di
        pk

; Updates all dynamic objects and visibility. Game/control state must be ready.
; Preserves J and returns with interrupts disabled. Not reentrant.
; Clobbers R0-R8/R10/R11, A/W/K/DC0/DC1/IS and BIOS K-stack scratch.
PatentSceneUpdate:
        lr K,P
        di
        dci PATENT_SCENE_SAVED_J
        lr A,9
        st
        ni $0f
        lr 9,A
        pi $40a9
        dci PATENT_SCENE_FLAGS+1
        lis 0
        st
        st
        lr 0,A
        dci $0cda
        lm
        lr 1,A
        dci PATENT_BALL_EVENTS
        lm
        ni PATENT_EVENT_LEFT_IMAGE
        sr 4
        lr 2,A
        pi PatentPaddleUpdate
        lis 1
        lr 0,A
        dci $0cde
        lm
        lr 1,A
        dci PATENT_BALL_EVENTS
        lm
        ni PATENT_EVENT_RIGHT_IMAGE
        sr 4
        sr 1
        lr 2,A
        pi PatentPaddleUpdate
        dci PATENT_BALL_STATE
        lm
        lr 1,A
        pi PatentSceneSelect
        dci PATENT_SCENE_SELECTION
        st
        ni 1
        sl 1
        sl 1
        sl 1
        dci PatentSceneBalls
        adc
        lis 0
        lr 0,A
        pi PatentSceneWriteObject
        dci PATENT_SCENE_SELECTION
        lm
        ni 1
        li 2
        bz PatentSceneBallX
        li $fe
PatentSceneBallX:
        dci PATENT_BALL_STATE
        am
        dci $0c80
        st
        dci PATENT_BALL_STATE+1
        lm
        dci $0c82
        st
        dci PATENT_BALL_EVENTS
        lm
        ni PATENT_EVENT_NET_HIDE
        sl 4
        dci PATENT_SCENE_FLAGS
        st
        lis 9
        lr 0,A
PatentSceneNetLoop:
        lr A,0
        ai <-9
        sl 1
        sl 1
        sl 1
        lr 1,A
        dci PATENT_SCENE_SELECTION
        lm
        ni 2
        lis 0
        bz PatentSceneNetOffset
        li 24
PatentSceneNetOffset:
        as 1
        dci PatentSceneNets
        adc
        pi PatentSceneWriteObject
        lr A,0
        inc
        lr 0,A
        ci 11
        bc PatentSceneNetLoop
        dci PATENT_GAME_SERVER
        lm
        sl 1
        lr 1,A
        dci PATENT_GAME_BOY_IMAGE
        lm
        as 1
        sl 1
        sl 1
        sl 1
        dci PatentSceneBoys
        adc
        lis 5
        lr 0,A
        pi PatentSceneWriteObject
        dci PATENT_GAME_BOY_X
        lm
        dci $0c94
        st
        dci PATENT_GAME_BOY_Y
        lm
        ai 16
        dci $0c96
        st
        dci PATENT_GAME_BOY_Y
        lm
        ci $ff
        lis 0
        bnz PatentSceneBoyFlag
        li $80
PatentSceneBoyFlag:
        dci PATENT_SCENE_FLAGS+5
        st
        lis 6
        lr 0,A
        dci PATENT_SCENE_SELECTION
        lm
        ni 2
        sl 1
        sl 1
        sl 1
        dci PatentSceneCrowds
        adc
        pi PatentSceneWriteObject
        lis 3
        lr 0,A
        dci PATENT_SCENE_SELECTION
        lm
        ni 2
        sl 1
        sl 1
        sl 1
        ai 8
        dci PatentSceneCrowds
        adc
        pi PatentSceneWriteObject
        lis 0
        lr 0,A
PatentSceneScoreLoop:
        dci PATENT_GAME_LEFT_SCORE
        lr A,0
        adc
        lm
        lr 1,A
        dci PATENT_SCENE_SCORE_CACHE
        lr A,0
        adc
        lr A,1
        cm
        bz PatentSceneScoreNext
        dci PATENT_SCENE_SCORE_CACHE
        lr A,0
        adc
        lr A,1
        st
        pi PatentScoreUpdate
PatentSceneScoreNext:
        lr A,0
        inc
        lr 0,A
        ci 1
        bc PatentSceneScoreLoop
        dci PATENT_GAME_MODE
        lm
        ci PATENT_MODE_PLAY
        lis 0
        bnz PatentSceneScoreFlag
        li $80
PatentSceneScoreFlag:
        dci PATENT_SCENE_FLAGS+12
        st
        st
        pi $40bc
        dci PATENT_SCENE_SAVED_J
        lm
        lr 9,A
        di
        pk

; R1 = logical ball X. A returns bit 0=right ball bitmap, bit 1=right net/crowd.
; Uses the patent CHIM comparisons. Clobbers A/W/K; preserves scratch/J.
PatentSceneSelect:
        lr K,P
        lr A,1
        ci 33
        bc PatentSceneSelectBR
        ci 43
        bc PatentSceneSelectBL
        ci 94
        bc PatentSceneSelectBR
        ci 144
        bc PatentSceneSelectBLNR
        ci 154
        bc PatentSceneSelectBRNR
PatentSceneSelectBLNR:
        lis 2
        pk
PatentSceneSelectBRNR:
        lis 3
        pk
PatentSceneSelectBR:
        lis 1
        pk
PatentSceneSelectBL:
        lis 0
        pk

PatentSceneBlank:
        db 1,$41,4,255,<PatentSceneZero,>PatentSceneZero,<PatentSceneZero,>PatentSceneZero
PatentSceneUpper:
        db 4,$d7,93,52,<PatentCB,>PatentCB+$e0,<PatentCB,>PatentCB+$e0
PatentSceneLower:
        db 4,$d7,93,236,<PatentCB,>PatentCB+$e0,<PatentCB,>PatentCB+$e0
PatentSceneBalls:
        db 6,$41,0,0,<PatentBL,>PatentBL+$e0,<PatentBL,>PatentBL+$e0
        db 6,$41,0,0,<PatentBR,>PatentBR+$e0,<PatentBR,>PatentBR+$e0
PatentSceneNets:
        db 60,$41,97,84,<PatentNL,>PatentNL+$e0,<PatentNL,>PatentNL+$e0
        db 60,$41,97,144,<PatentNL,>PatentNL+$e0,<PatentNL,>PatentNL+$e0
        db 60,$41,97,204,<PatentNL,>PatentNL+$e0,<PatentNL,>PatentNL+$e0
        db 60,$41,91,84,<PatentNR,>PatentNR+$e0,<PatentNR,>PatentNR+$e0
        db 60,$41,91,144,<PatentNR,>PatentNR+$e0,<PatentNR,>PatentNR+$e0
        db 60,$41,91,204,<PatentNR,>PatentNR+$e0,<PatentNR,>PatentNR+$e0
PatentSceneBoys:
        db 32,$42,0,0,<PatentLB1O,>PatentLB1O+$e0,<PatentLB1E,>PatentLB1E+$e0
        db 32,$42,0,0,<PatentLB2O,>PatentLB2O+$e0,<PatentLB2E,>PatentLB2E+$e0
        db 32,$42,0,0,<PatentRB1O,>PatentRB1O+$e0,<PatentRB1E,>PatentRB1E+$e0
        db 32,$42,0,0,<PatentRB2O,>PatentRB2O+$e0,<PatentRB2E,>PatentRB2E+$e0
PatentSceneCrowds:
        db 12,$c5,67,44,<PatentCR1O,>PatentCR1O+$c0,<PatentCR1E,>PatentCR1E+$c0
        db 12,$c5,122,44,<PatentCR1O,>PatentCR1O+$20,<PatentCR1E,>PatentCR1E+$20
        db 12,$c5,67,44,<PatentCR2O,>PatentCR2O+$c0,<PatentCR2E,>PatentCR2E+$c0
        db 12,$c5,122,44,<PatentCR2O,>PatentCR2O+$20,<PatentCR2E,>PatentCR2E+$20
PatentSceneZero:
        db 0

        include "scene-images.inc"
