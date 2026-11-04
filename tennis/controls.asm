; Stock capture adapter. Uses the retail BIOS stack and caller's J status.

; R1 = calibrated retail Y. Returns Y scaled from 70-214 to 70-218 in A.
; Adaptation choice: preserve calibration and stretch the complete travel.
; Clobbers R3/R4, A, W, K. Preserves J and allocates no persistent state.
PatentPaddleMapStockInput:
        lr K,P
        lr A,1
        ci 69
        bnc PatentPaddleStockUpper
        li 70
PatentPaddleStockUpper:
        ci 214
        bc PatentPaddleStockScale
        li 214
PatentPaddleStockScale:
        lr 4,A
        ai <-70
PatentPaddleStockStep:
        ci 35
        bc PatentPaddleStockDone
        ai <-36
        lr 3,A
        lr A,4
        inc
        lr 4,A
        lr A,3
        br PatentPaddleStockStep
PatentPaddleStockDone:
        lr A,4
        pk

; R0 = side 0/1, R2 = hit image 0/1; returns logical Y in R1.
; Caller supplies valid retail J status and initialized BIOS K stack.
; Selects vertical axis 0/2; captures one paddle per call.
; Returns with interrupts disabled for the remaining scene update.
; Clobbers R1, R3-R8, R10-R17, A, W, K, DC0/DC1, IS; preserves R0/R2/J.
; BIOS K-stack scratch registers are also used normally.
; Retire retail collision users of bodies 22/23 before enabling this path.
PatentPaddleCaptureUpdate:
        lr K,P
        pi $40a9
        lr A,0
        sl 1
        lr 10,A
        pi StockJoystickCapture
        di
        lr 1,A
        pi PatentPaddleMapStockInput
        lr 1,A
        pi PatentPaddleUpdate
        pi $40bc
        di
        pk
