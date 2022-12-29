.MODEL SMALL
.DATA
	SUM DB 0
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	MOV AL,1	; AL = 1
	MOV CX,10	; CX=10
NEXT:			; DO and CX--
	ADD SUM,AL	; SUM += AL
	ADD AL,1	; AL++		(other ways: INC AL)
	LOOP NEXT	; WHILE( CX > 0 )
BREAK:
	MOV AH,4CH	; interrumpir
	INT 21H
.STACK
	END MAIN
