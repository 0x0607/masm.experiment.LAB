.MODEL	SMALL
.DATA
	TEXT DB	'B'
.CODE
MAIN:
	MOV 	AX,@DATA
	MOV 	DS,AX
	MOV 	DL,TEXT	; set char
	MOV 	AH,02H	; print_char
	INT 	21H
	OR  	DL,20H	; | 00100000B
	MOV 	AH,02H	; print_char
	INT 	21H
	MOV 	AH,4CH
	INT 	21H
.STACK
	END MAIN
