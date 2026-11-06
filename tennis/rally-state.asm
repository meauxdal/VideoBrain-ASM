; New rally state replaces retired object deltas at $0CE0-$0CE9.
; Do not enable while retail movement/serve/collision policy still runs.
PATENT_BALL_STATE = $0ce0
PATENT_BALL_HITS = $0ce8
PATENT_BALL_EVENTS = $0ce9

; R0 = serving side 0/1. Starts at that paddle's front and logical Y.
; State bytes: X integer, Y integer, X fraction, Y fraction, VY lo/hi, VX lo/hi,
; remaining hits, last events. Caller owns serve-button/ball-boy policy.
; Requires interrupts disabled. Clobbers R1/R2, A, W, K, DC0. Preserves J.
        ifnconst PATENT_CARTRIDGE
PatentRallyStart:
        lr K,P
        lr A,0
        ai 0
        li 40
        bz PatentRallyStartX
        li 148
PatentRallyStartX:
        lr 1,A
        dci $0cda
        lr A,0
        sl 1
        sl 1
        adc
        lm
        lr 2,A
        dci PATENT_BALL_STATE
        lr A,1
        st
        lr A,2
        st
        lis 0
        st
        st
        st
        st
        li $80
        st
        lr A,0
        ai 0
        lis 1
        bz PatentRallyStartVelocity
        li $fe
PatentRallyStartVelocity:
        st
        lis 4
        st
        lis 0
        st
        pk
        endif

; Advances one active-rally frame. Returns event mask in A.
; Reads fixed paddle bodies and replaces the complete retail collision walk.
; Side-hit corrections update the paddle's body and drawing together.
; Caller consumes score/image/net/sound events and commits the scene afterward.
; Uses initialized BIOS K stack/J; returns with interrupts disabled.
; Clobbers R0-R8/R10-R11, A, W, K, DC0, BIOS K-stack scratch. Preserves J.
PatentRallyStep:
        lr K,P
        pi $40a9
        di
        dci PATENT_BALL_STATE
        lm
        lr 0,A
        lm
        lr 1,A
        lm
        lr 2,A
        lm
        lr 3,A
        lm
        lr 4,A
        lm
        lr 5,A
        lm
        lr 6,A
        lm
        lr 7,A
        pi PatentBallAdvance
        dci PATENT_BALL_STATE+2
        lr A,2
        st
        lr A,3
        st
        ifconst PATENT_CARTRIDGE
        ; Fractions are stored; the resolver replaces R3 with its event mask.
        ei
        nop
        di
        endif
        pi PatentRallyResolve
        dci PATENT_BALL_EVENTS
        lr A,3
        st
        ni PATENT_EVENT_PADDLE
        bz PatentRallySave
        dci PATENT_BALL_HITS
        lm
        lr 8,A
        pi PatentBallHitSpeed
        dci PATENT_BALL_HITS
        lr A,8
        st
PatentRallySave:
        dci PATENT_BALL_STATE
        lr A,0
        st
        lr A,1
        st
        lis 2
        adc
        lr A,4
        st
        lr A,5
        st
        lr A,6
        st
        lr A,7
        st
        lr A,3
        ni PATENT_EVENT_PADDLE
        bz PatentRallyStepDone
        ifconst PATENT_CARTRIDGE
        ; Hit frame: events are stored and R3 is dead; split the masked run.
        ei
        nop
        di
        endif
        lr A,2
        lr 1,A
        lr A,10
        lr 0,A
        lis 0
        lr 2,A
        pi PatentPaddleUpdate
PatentRallyStepDone:
        pi $40bc
        di
        dci PATENT_BALL_EVENTS
        lm
        pk
