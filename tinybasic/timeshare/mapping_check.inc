; Execute identical instructions across bank changes before console setup.
        DCI $1800
        LI $A5
        ST
        DCI $1FFF
        LI $5A
        ST
        DCI $3000
        LI $3C
        ST
        DCI $3FFF
        LI $C3
        ST
        CLR
        LR 9,A
CHECKBANK
        DCI $17FF
        LR A,9
        ST
        DCI $16FF
        LM
        XS 9
        BNZ MAPFAIL
        DCI $1C00
        LM
        CI $A5
        BNZ MAPFAIL
        DCI $1BFF
        LM
        CI $5A
        BNZ MAPFAIL
        DCI $3000
        LM
        CI $3C
        BNZ MAPFAIL
        DCI $3FFF
        LM
        CI $C3
        BNZ MAPFAIL
        LR A,9
        INC
        LR 9,A
        CI 8
        BNZ CHECKBANK
        DCI $17FF
        CLR
        ST
        BR MAPDONE
MAPFAIL DCI $08F5
        LIS 2
        ST
MAPSTOP BR MAPSTOP
MAPDONE
