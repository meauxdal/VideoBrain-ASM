; Work-in-progress stock cartridge. No prototype mapper or old retail policy.
        processor f8
PATENT_CARTRIDGE = 1
PATENT_FIELD_SERVICE = 1
; Raster IRQs are requested early; the handler polls VPOS ($08FB) to the exact
; line so color edges stay hidden under the white boundary lines (Y 50-53 and
; 234-237) despite wrapper/masking latency. Transfer waits for the lower line.
PATENT_GREEN_IRQ = 37
PATENT_GREEN_LINE = 51
PATENT_RED_IRQ = 221
PATENT_RED_LINE = 235
PATENT_FIELD_TRANSFER_LINE = 238
PATENT_FIELD_LINE = $0d09
        org $1000
        db $aa,$55,$01,$00,$00,$00,$00,$07,$0b,$2b,$2b,$01,$21,$00,$00,$00,$00,$00

PatentCartridgeStart:
        di
        lr J,W
        pi $40d0
        dci $0c00
        lis 8
        lr 10,A
PatentCartridgeCalibration:
        lis 7
        st
        lis 0
        st
        lis 2
        st
        li $80
        st
        ds 10
        bnz PatentCartridgeCalibration
        pi $45db
        pi $41c8
        di
        lr J,W
        lis 0
        dci $08f7
        st
        outs 0
        outs 1
        outs 14
        dci $0fdd
        st
        st
        dci $0fda
        st
        pi PatentGameInit
        pi PatentSceneInit
        pi PatentDisplayConfigure
        pi PatentDisplayPrepare
        pi PatentDisplayCommit
        pi $424d
        di
        li >PatentStockInterrupt
        outs 12
        li <PatentStockInterrupt
        outs 13
        li PATENT_GREEN_IRQ
        dci PATENT_FIELD_LINE
        st
        dci $08f0
        st
        dci $08f5
        lis 1
        st
        li $4c
        dci $0fea
        st
        lis 1
        outs 14
        pi PatentFrameEnable
        lr J,W

PatentCartridgeFrame:
        li 56
        lr 1,A
        pi PatentFrameWaitLine
        pi PatentFrameCompute
        pi PatentDisplayPrepare
        li 164
        lr 1,A
        pi PatentFrameWaitLine
        pi PatentDisplayCommit
        jmp PatentCartridgeFrame

; The stock capture path retains calibration and command/freeze sequencing.
; Output/interrupt timing of the combined frame still needs integrated validation.
; TODO: profile the 52-to-164 compute deadline, including capture and bus stalls.
PatentFrameCompute:
        lr K,P
        pi $40a9
        lis 0
        outs 14
        lr 0,A
        pi PatentPaddleCaptureUpdate
        pi PatentFrameEnable
        lis 1
        lr 0,A
        pi PatentPaddleCaptureUpdate
        pi PatentFrameEnable
        lis 1
        outs 14
        pi PatentFrameButtons
        lr 0,A
        pi PatentGameStep
        ; Retail tones: paddle hit 15 lines/edge, wall 8 (see sound.asm).
        ni PATENT_EVENT_PADDLE+PATENT_EVENT_WALL
        bz PatentFrameQuiet
        ci PATENT_EVENT_WALL
        li 256-14
        lr 6,A
        lis 10
        lr 5,A
        bnz PatentFrameTone
        li 256-7
        lr 6,A
        li 18
        lr 5,A
PatentFrameTone:
        pi PatentSoundStart
PatentFrameQuiet:
        ; Raster IRQ window; PatentSceneUpdate saves K before its DI.
        ei
        nop
        pi PatentSceneUpdate
        pi $40bc
        di
        pk

PatentFrameButtons:
        lr K,P
        lis 0
        outs 1
        ins 1
        pk

; R1 = target scanline. The scheduler calls this with no live R2-R5 value.
; Enter a fresh rising window if already late; an IRQ may span the target.
; Sound edges are produced here, while the frame is otherwise idle.
PatentFrameWaitLine:
        lr K,P
        ei
PatentFrameWaitWrap:
        pi PatentSoundService
        lr A,1
        dci $08fb
        cm
        bz PatentFrameWaitDone
        bc PatentFrameWaitWrap
PatentFrameWaitLoop:
        pi PatentSoundService
        lr A,1
        dci $08fb
        cm
        bnc PatentFrameWaitLoop
PatentFrameWaitDone:
        di
        pk

; Restore UV raster requests. The caller gates SMI across joystick IRQ edges.
PatentFrameEnable:
        lr K,P
        dci $0fea
        li $f0
        nm
        oi $0c
        dci $0fea
        st
        dci $08f7
        st
        lis 0
        dci $0fdd
        st
        st
        ei
        pk

        include "paddles.asm"
        include "controls.asm"
        ; Placed here so the vector keeps bit 7 set (checked at the end).
        include "stock-interrupt.asm"
        include "rally.asm"
        include "rally-state.asm"
        include "game.asm"
        include "scores.asm"
        include "scene.asm"
        include "display.asm"
        include "stock-input.asm"
        include "sound.asm"

; Field events continue while the main loop waits or runs across fields.
; The stock wrapper preserves the interrupted machine state around this leaf.
; Only A, DC0/DC1 and K are used: R3 holds the interrupted A for the wrapper.
; Each wait exits once VPOS - IRQ line reaches the target offset; a VPOS that
; wrapped below the IRQ line reads as a large offset and also exits.
PatentFieldService:
        lr K,P
        ; YINT is write-only; keep the scheduled phase in cartridge RAM.
        dci PATENT_FIELD_LINE
        lm
        ci PATENT_GREEN_IRQ
        bz PatentFieldGreenWait
PatentFieldRedWait:
        dci $08fb
        lm
        ai 256 - PATENT_RED_IRQ
        ci PATENT_RED_LINE - PATENT_RED_IRQ - 1
        bc PatentFieldRedWait
        lis 1
        dci $08f5
        st
        li PATENT_GREEN_IRQ
        dci PATENT_FIELD_LINE
        st
        dci $08f0
        st
PatentFieldTransferWait:
        dci $08fb
        lm
        ai 256 - PATENT_RED_IRQ
        ci PATENT_FIELD_TRANSFER_LINE - PATENT_RED_IRQ - 1
        bc PatentFieldTransferWait
        ; Paddle DX lands with the pointers (DC1 is restored by the wrapper).
        dci $0821
        xdc
        dci PATENT_PADDLE_DX
        lm
        xdc
        st
        xdc
        lm
        xdc
        st
        jmp $424d
PatentFieldGreenWait:
        dci $08fb
        lm
        ai 256 - PATENT_GREEN_IRQ
        ci PATENT_GREEN_LINE - PATENT_GREEN_IRQ - 1
        bc PatentFieldGreenWait
        lis 2
        dci $08f5
        st
        li PATENT_RED_IRQ
        dci PATENT_FIELD_LINE
        st
        dci $08f0
        st
        pk

PatentCartridgeEnd:
        if (PatentStockInterrupt & $80) = 0
        echo "External interrupt vector must have bit 7 set"
        err
        endif
        if PatentCartridgeEnd > $2000
        echo "Patent cartridge exceeds 4 KB"
        err
        endif
        org $1fff
        db $00
