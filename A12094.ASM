.MODEL	SMALL
.DATA
	a_table	DB '0123456789ABCDEF'
.CODE
MAIN:
	MOV	AL,00H
	MOV	CX,10H
LL:	CALL	HEXPUT	;Function- Print Value
	INC	AL
	LOOP	LL
	MOV	AH,4CH
	INT	21H
;/*****************************************************
;* Function: 	HEXPUT
;* Input: 	AL
;* RETURN:	NULL
;/*****************************************************
HEXPUT	PROC
	PUSH	BX
	PUSH	CX
	PUSH	DX
	PUSH	AX
	MOV	DX,@DATA
	MOV	DS,DX
	MOV	BX,OFFSET a_table
	MOV	CL,4
	SHR	AL,CL
	XLATB	
	MOV	DL,AL
	MOV	AH,02H
	INT	21H
	POP	AX
	PUSH	AX
	AND	AL,00001111B
	XLATB
	MOV	DL,AL
	MOV	AH,02H
	INT	21H
	POP	AX
	POP	DX
	POP	CX
	POP	BX
	RET
HEXPUT	ENDP
.STACK
	END	MAIN
