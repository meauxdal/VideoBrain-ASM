; Non-blocking square-wave sound, after retail $148F (port 1 = $10 strobe,
; port 0 = level 7/0, one edge every PERIOD scanlines). Retail busy-waits
; lines 48-192; here the edges are produced only while the frame scheduler
; idles in PatentFrameWaitLine, so compute and raster timing are unchanged.
; RAM (retail reflected-graphics area, free since direct ROM images):
;   +0 edges left (0 = silent), +1 ~VPOS of last edge, +2 -PERIOD.
PATENT_SOUND = $0d1c

; R5 = edge count, R6 = -PERIOD (PI itself clobbers A). Interrupts must be
; disabled (leaf, pop). Clobbers A, DC0.
PatentSoundStart:
        dci PATENT_SOUND
        lr A,5
        st
        st
        lr A,6
        st
        pop

; Called from the wait loops with interrupts enabled; masks them itself so a
; field IRQ cannot overwrite PC1 inside this leaf. Clobbers R2/R4/R5, A, DC0.
PatentSoundService:
        di
        dci $08fb
        lm
        lr 2,A
        dci PATENT_SOUND
        lis 0
        xm
        bz PatentSoundDone
        lr 4,A
        lr A,2
        am
        am
        bnc PatentSoundDone
        ds 4
        dci PATENT_SOUND
        lr A,4
        st
        lr A,2
        com
        st
        lr A,4
        ni 1
        bz PatentSoundLevel
        lis 7
PatentSoundLevel:
        lr 5,A
        li $10
        outs 1
        lr A,5
        outs 0
        lis 0
        outs 1
PatentSoundDone:
        ei
        pop
