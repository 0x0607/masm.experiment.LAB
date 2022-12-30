.MODEL	SMALL
.DATA
	TEXT	DB 'BIG WORD CHANG TO SMALL WORD'
	LEN 	DW 28
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	LEA	BX,TEXT		; BX = "small word chang to big word"
	MOV	CX,LEN		; CX = 28
AGAIN:				; DO and CX--
	MOV	AH,[BX]		; AH = BX[?]
	CMP	AH,41H
	JB	NEXT		; IF AH < 61H ('A') THEN GOTO OVER
	CMP	AH,5AH
	JA	NEXT		; IF AH > 7AH ('Z') THEN GOTO OVER
	OR	AH,20H		; AH |= 0x01011111
	MOV	[BX],AH		; BX[?] = DL
NEXT:
	INC	BX		; BX[?+1]
	LOOP	AGAIN		; WHILE( CX < 0 )
	MOV	AH,4CH		; interrumpir
	INT	21H
.STACK
	END	MAIN
