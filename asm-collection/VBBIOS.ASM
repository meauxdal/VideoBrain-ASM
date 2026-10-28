;VLSI registers
;write only
VID_COMMAND	equ $08F7
VID_BKGCOLOR	equ $08F5
VID_FINALMOD	equ $08F2
VID_YINTLOW	equ $08f0

;read only
VID_XFREEZE	equ $08f8
VID_YFREEZELO	equ $08f9
VID_YFREEZEHI	equ $08fA	;and odd/even frame, and y current hi
VID_CURYLO	equ $08fB

;16 registers in each range, 1 per sprite, read/write
VID_RPL		equ $800	;sprite bitmap low address bits
VID_RPH		equ $810	;sprite bitmap hi address bits and color
VID_DELX	equ $820	;sprite width, intensity, xcopy bit
VID_DELY	equ $830	;sprite height
VID_XV		equ $840	;sprite x-position
VID_YVLA	equ $850	;sprite y-position low list A
VID_YVLB	equ $860	;sprite y-position low list B
VID_YXA		equ $870	;sprite y-position hi and x order list A
VID_YXB		equ $880	;sprite y-position hi and x order list B


;RAM $0C00-$0FFF
RAMSTART	equ $0C00	;RAM from $0C00 to $0FFF
FIRSTCHAR	equ $0C2F	;display buffer $0C2F to $0F3E

TXTBUF		equ $0F3F	;TEXT editor buffer - 7x16=112 bytes
CURSORPOS	equ $0FDF
SHIFTSTATE	equ $0FE2
WARMBOOTFLAG	equ $0FE4	;set to $AA to indicate warm boot
BKGCOLOR	equ $0FE9
VIDEOMODE	equ $0FEA


;CARTS $1000-$1FFF
CARTSTART	equ $1000	;where carts appear in memory
CARTBKGCOLOR	equ $1002	;set when name of cart printed
CARTNAME	equ $1003	;the name of the cart
CARTCODE	equ $1012	;jump here to run the cart


;RES2 $2000-$27FF
FONT		equ $2010	;7 bytes per character
PRINTWRKEY	equ $2468
MONTEXT		equ $2437
JANTEXT		equ $245b
SELKEYTEXT	equ $23EF
NUMBERS		EQU $245e	;table of key values of digits


;RES1 $4000-$47FF (actually $0000-$07FF)
DRAWCHAR	EQU $40D9
BACKSPACE	EQU $4122
A41C8		EQU $41C8
CLRSCREEN	EQU $41D5
PRINTCHARS	EQU $4205
A424D		EQU $424D
READKBJOY	EQU $4361
CHKKEY		EQU $4379
COPYMEMTOMEM	EQU $43CD
GETKEY		EQU $43D6
WAITSCANLINE	EQU $4501