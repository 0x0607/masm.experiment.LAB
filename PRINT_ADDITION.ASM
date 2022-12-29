;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
; 	M1 DB 32 (M1 介於10-49之間任一數)
;	M2 DB 26 (M2 介於10-49之間任一數)
; 	螢幕印出 32+26=58
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	M1 DB 32		; 10 - 49
	M2 DB 26		; 10 -49
	STR DB "M1+M2=",'$'
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	LEA DX,STR 		; Load STR->DX
	MOV AH,09H		; print STR
	INT 21H
	MOV AL,M1		; M1->AL
	CBW			; AL TO AX
	ADD AL,M2		; M1+M2
	MOV CL,10		
	DIV CL			; (M1+M2)/10
	ADD AL,30H		; quotient		30H = ASCII('0')
	ADD AH,30H		; remainder		30H = ASCII('0')
	MOV DX,AX		; DX=0x38,0x35 
	MOV AH,02H		; print '5'
	INT 21H
	MOV DL,DH		; DH(remainder)->DL
	MOV AH,02H		; print '8'
	INT 21H
	MOV AH,4CH		; interrumpir
	INT 21H
.STACK
	END MAIN
