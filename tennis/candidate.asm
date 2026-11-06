; Work-in-progress stock cartridge. No prototype mapper or old retail policy.
        processor f8
PATENT_CARTRIDGE = 1
PATENT_FIELD_SERVICE = 1
PATENT_FIELD_TRANSFER_LINE = 236
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
        li 52
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
; TODO: connect patent sound events through the retained machine services.
PatentFrameCompute:
        lr K,P
        pi $40a9
        lis 0
        outs 14
        lr 0,A
        lr 2,A
        pi PatentPaddleCaptureUpdate
        pi PatentFrameEnable
        lis 1
        lr 0,A
        lis 0
        lr 2,A
        pi PatentPaddleCaptureUpdate
        pi PatentFrameEnable
        lis 1
        outs 14
        pi PatentFrameButtons
        lr 0,A
        pi PatentGameStep
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

; R1 = target scanline. The scheduler calls this with no live R3 value.
; Enter a fresh rising window if already late; an IRQ may span the target.
PatentFrameWaitLine:
        lr K,P
        lr A,1
        ei
PatentFrameWaitWrap:
        dci $08fb
        cm
        bz PatentFrameWaitDone
        bc PatentFrameWaitWrap
PatentFrameWaitLoop:
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
        include "rally.asm"
        include "rally-state.asm"
        include "game.asm"
        include "scores.asm"
        include "stock-interrupt.asm"
        include "scene.asm"
        include "display.asm"
        include "stock-input.asm"

; Field events continue while the main loop waits or runs across fields.
; The stock wrapper preserves the interrupted machine state around this leaf.
PatentFieldService:
        lr K,P
        ; YINT is write-only; keep the scheduled phase in cartridge RAM.
        dci PATENT_FIELD_LINE
        lm
        ci 52
        bz PatentFieldGreen
PatentFieldRed:
        lis 1
        dci $08f5
        st
        li 52
        dci PATENT_FIELD_LINE
        st
        dci $08f0
        st
        jmp $424d
PatentFieldGreen:
        lis 2
        dci $08f5
        st
        li 236
        br PatentFieldSchedule
PatentFieldSchedule:
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
