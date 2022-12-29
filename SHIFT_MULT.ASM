.MODEL	SMALL
.DATA
	Y	DB 5		
	Y13	DB ?		; 13 = 2^3 + 2^2 + 2^0
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	MOV CL,3	; CL = 3
	MOV DL,Y	; DL = 5
	SAL DL,CL	; DL<<3  DL = DL * 2^3
	MOV CL,2	; CL = 2
	MOV AL,Y	; AL = 5
	SAL AL,CL	; AL<<2	 AL = AL * 2^2
	ADD DL,AL	; DL = DL + AL = 5*(2^3) + 5*(2^2)
	ADD DL,Y	; DL = DL + Y =  5*(2^3) + 5*(2^2) + 5*(2^0)
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN
