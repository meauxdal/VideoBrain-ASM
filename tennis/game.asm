; Serve/score controller. Replaces retail policy, never runs beside it.
; State extends the replacement delta allocation through $0CF4.
PATENT_GAME_MODE = $0cea
PATENT_GAME_SERVER = $0ceb
PATENT_GAME_DELAY = $0cec
PATENT_GAME_LEFT_SCORE = $0ced
PATENT_GAME_RIGHT_SCORE = $0cee
PATENT_GAME_BOY_X = $0cef
PATENT_GAME_BOY_Y = $0cf0
PATENT_GAME_BOY_IMAGE = $0cf1
PATENT_GAME_BOY_TICK = $0cf2
PATENT_GAME_BUTTONS = $0cf3
PATENT_GAME_BOY_PHASE = $0cf4

PATENT_MODE_PAUSE = 0
PATENT_MODE_CARRY = 1
PATENT_MODE_EXIT = 2
PATENT_MODE_READY = 3
PATENT_MODE_PLAY = 4

; Initializes replacement state only. Caller initializes paddles/display.
; Initial ball Y=144 is an adaptation choice at the incomplete startup.
; Requires interrupts disabled. Clobbers R1, A, W, K, DC0; preserves J.
PatentGameInit:
        lr K,P
        dci PATENT_BALL_STATE
        li 21
        lr 1,A
        lis 0
PatentGameClear:
        st
        ds 1
        bnz PatentGameClear
        dci PATENT_BALL_STATE
        li 180
        st
        li 144
        st
        dci PATENT_BALL_HITS
        lis 4
        st
        dci PATENT_GAME_DELAY
        li 60
        st
        dci PATENT_GAME_BOY_X
        li 86
        st
        li $ff
        st
        dci PATENT_GAME_BOY_TICK
        lis 7
        st
        pk

; R1 = packed-decimal score 00-15. Returns score + 1, saturated at 15, in A.
; Clobbers A, W, K. Preserves scratch registers and J.
PatentScoreIncrement:
        lr K,P
        lr A,1
        ci $15
        bz PatentScoreDone
        ni $0f
        ci 9
        lr A,1
        bz PatentScoreCarry
        inc
        pk
PatentScoreCarry:
        ai 7
PatentScoreDone:
        pk

; R0 = active-high button mask (left $01, right $04).
; Runs one frame of serve/retrieval or rally. Returns ball event mask in A.
; Caller captures both paddles first, then consumes state/events and commits.
; Requires initialized BIOS K stack/J. Returns with interrupts disabled.
; Clobbers R0-R8/R10-R11, A, W, K, DC0, BIOS K-stack scratch; preserves J.
PatentGameStep:
        lr K,P
        di
        dci PATENT_GAME_BUTTONS
        lr A,0
        st
        pi $40a9
        di
        dci PATENT_BALL_EVENTS
        lis 0
        st
        dci PATENT_GAME_MODE
        lm
        ci PATENT_MODE_PLAY
        bnz PatentGameServe
        jmp PatentGamePlay
PatentGameServe:
        ci PATENT_MODE_READY
        bnz PatentGameRetrieval
        jmp PatentGameReady
PatentGameRetrieval:
        ci PATENT_MODE_EXIT
        bnz PatentGameWalk
        jmp PatentGameExit
PatentGameWalk:
        ci PATENT_MODE_CARRY
        bnz PatentGamePause
        jmp PatentGameCarry
PatentGamePause:
        dci PATENT_GAME_DELAY
        lm
        ai $ff
        dci PATENT_GAME_DELAY
        st
        bz PatentGamePickup
        jmp PatentGameDone
PatentGamePickup:
        dci PATENT_GAME_BOY_PHASE
        lis 0
        st
        dci PATENT_GAME_SERVER
        lm
        lr 0,A
        ai 0
        li 85
        bz PatentGamePickupX
        li 103
PatentGamePickupX:
        dci PATENT_GAME_BOY_X
        st
        li 202
        st
        lis 0
        st
        lis 7
        st
        lr A,0
        ai 0
        li 75
        bz PatentGamePickupBall
        li 113
PatentGamePickupBall:
        dci PATENT_BALL_STATE
        st
        li 210
        st
        lis 0
        st
        st
        st
        li $fe
        st
        lis 0
        st
        lr A,0
        ai 0
        li $ff
        bz PatentGamePickupVelocity
        lis 1
PatentGamePickupVelocity:
        st
        dci PATENT_GAME_MODE
        lis PATENT_MODE_CARRY
        st
PatentGameCarry:
        dci PATENT_GAME_SERVER
        lm
        lr 0,A
        ai 0
        li $ff
        bz PatentGameCarryVelocity
        lis 1
PatentGameCarryVelocity:
        lr 1,A
        dci PATENT_GAME_BOY_X
        lm
        as 1
        lr 2,A
        lr A,0
        ai 0
        bnz PatentGameCarryRight
        lr A,2
        ci 53
        bc PatentGameDelivered
        br PatentGameCarryMove
PatentGameCarryRight:
        lr A,2
        ci 134
        bnc PatentGameDelivered
PatentGameCarryMove:
        dci PATENT_GAME_BOY_X
        lr A,2
        st
        dci PATENT_BALL_STATE
        lm
        as 1
        dci PATENT_BALL_STATE
        st
        lm
        ai $fe
        dci PATENT_BALL_STATE+1
        st
        jmp PatentGameBoyUp
PatentGameDelivered:
        lr A,0
        ai 0
        li 40
        bz PatentGameDeliveredX
        li 148
PatentGameDeliveredX:
        dci PATENT_BALL_STATE
        st
        dci PATENT_BALL_STATE+4
        lis 0
        st
        st
        st
        st
        dci PATENT_GAME_MODE
        lis PATENT_MODE_EXIT
        st
        br PatentGameBoyUp
PatentGameExit:
        dci PATENT_GAME_BOY_Y
        lm
        ci 55
        bc PatentGameBoyHide
PatentGameBoyUp:
        dci PATENT_GAME_BOY_Y
        lm
        ai $fe
        dci PATENT_GAME_BOY_Y
        st
        ; The patent selects the current image before advancing its phase.
        dci PATENT_GAME_BOY_PHASE
        lm
        dci PATENT_GAME_BOY_IMAGE
        st
        dci PATENT_GAME_BOY_TICK
        lm
        ai $ff
        dci PATENT_GAME_BOY_TICK
        st
        bz PatentGameBoyToggle
        jmp PatentGameDone
PatentGameBoyToggle:
        lis 7
        dci PATENT_GAME_BOY_TICK
        st
        dci PATENT_GAME_BOY_PHASE
        lm
        xi 1
        dci PATENT_GAME_BOY_PHASE
        st
        jmp PatentGameDone
PatentGameBoyHide:
        dci PATENT_GAME_BOY_X
        li 94
        st
        li $ff
        st
        dci PATENT_GAME_MODE
        lis PATENT_MODE_READY
        st
        jmp PatentGameDone
PatentGameReady:
        dci PATENT_BALL_HITS
        lis 4
        st
        dci PATENT_GAME_DELAY
        li 60
        st
        dci PATENT_GAME_SERVER
        lm
        lr 1,A
        ai 0
        lis 1
        bz PatentGameServeButton
        lis 4
PatentGameServeButton:
        lr 2,A
        dci PATENT_GAME_BUTTONS
        lm
        ns 2
        bnz PatentGameLaunch
        jmp PatentGameDone
PatentGameLaunch:
        lr A,1
        ai 0
        li 39
        bz PatentGameLaunchX
        li 149
PatentGameLaunchX:
        dci PATENT_BALL_STATE
        st
        dci PATENT_GAME_LEFT_SCORE
        lm
        ci $15
        bz PatentGameRestart
        lm
        ci $15
        bnz PatentGameLaunchMode
PatentGameRestart:
        dci PATENT_GAME_LEFT_SCORE
        lis 0
        st
        st
PatentGameLaunchMode:
        dci PATENT_GAME_MODE
        lis PATENT_MODE_PLAY
        st
PatentGamePlay:
        pi PatentRallyStep
        ni PATENT_EVENT_LEFT_SCORE+PATENT_EVENT_RIGHT_SCORE
        bnz PatentGamePoint
        jmp PatentGameDone
PatentGamePoint:
        ci PATENT_EVENT_LEFT_SCORE
        lis 0
        bz PatentGamePointSide
        lis 1
PatentGamePointSide:
        lr 0,A
        dci PATENT_GAME_SERVER
        st
        dci PATENT_GAME_LEFT_SCORE
        adc
        lm
        lr 1,A
        pi PatentScoreIncrement
        lr 1,A
        dci PATENT_GAME_LEFT_SCORE
        lr A,0
        adc
        lr A,1
        st
        dci PATENT_GAME_MODE
        lis PATENT_MODE_PAUSE
        st
        dci PATENT_GAME_DELAY
        li 60
        st
PatentGameDone:
        pi $40bc
        di
        dci PATENT_BALL_EVENTS
        lm
        pk
