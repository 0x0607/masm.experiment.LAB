.MODEL SMALL
.DATA
	TEXT DB "small word chang to big word",'$'
	LEN DW 28
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	LEA BX,TEXT	; BX = "small word chang to big word"
	MOV CX,LEN	; CX = 28
NEXT:			; DO and CX--
	MOV DL,[BX]	; DL = BX[?]
	CMP DL,7AH
	JA OVER		; IF DL > 7AH ('z') THEN GOTO OVER
	CMP DL,61H
	JB OVER		; IF DL < 61H ('a') THEN GOTO OVER
	AND DL,5FH	; DL &= 0x01011111
	MOV [BX],DL	; BX[?] = DL
OVER:	
	INC BX		; BX[?+1]
	LOOP NEXT	; WHILE( CX < 0 )
	LEA TEXT,BX	; TEXT = BX
	LEA DX,TEXT
	MOV AH,09H	; print TEXT
	MOV AH,4CH	; interrumpir
	INT 21H
.STACK
	END MAIN
