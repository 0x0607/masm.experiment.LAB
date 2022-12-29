;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
; 	M1 DB 32 (M1 介於10-99之間任一數)
; 	螢幕印出 M1=32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	M1 DB 32	; 10 - 99
	STR DB "M1=",'$'
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	LEA DX,STR 	; Load STR->DX
	MOV AH,09H	; print STR
	INT 21H
	MOV AL,M1	; M1->AL
	CBW		
	MOV CL,10	
	DIV CL		; AX/10
	ADD AL,30H	; quotient		30H = ASCII('0')
	ADD AH,30H	; remainder		30H = ASCII('0')
	MOV DX,AX	; DX=0x32,0x33 
	MOV AH,02H	; print '3'
	INT 21H
	MOV DL,DH	; DH(remainder)->DL	
	MOV AH,02H	; print '2'
	INT 21H
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN
