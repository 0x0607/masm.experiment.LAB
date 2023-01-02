.MODEL	SMALL
.DATA
	a_table	DB '0123456789ABCDEF'		
.CODE
MAIN:
	MOV	AL,00H
	MOV	CX,10H
AGAIN:
	CALL	HEXPUT	; Function- Print_Value
	INC	AL	; AL++
	LOOP	AGAIN
	MOV	AH,4CH	; interrumpir
	INT	21H
;/*****************************************************
;* Function: 	HEXPUT
;* Input: 	AL
;* RETURN:	NULL
;/*****************************************************
HEXPUT	PROC				; Define Function HEXPUT
	PUSH	BX			; STACK BX
	PUSH	CX			; STACK CX
	PUSH	DX			; STACK DX
	PUSH	AX			; STACK AX
	MOV	DX,@DATA		
	MOV	DS,DX
	MOV	BX,OFFSET a_table	; BX = ARRAY(a_table)
	MOV	CL,4			; CL = 4
	SHR	AL,CL			; AL >> 4
	XLATB				; AL = a_table[AL]
	MOV	DL,AL			
	MOV	AH,02H			; PRINT_HEXPUT
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
