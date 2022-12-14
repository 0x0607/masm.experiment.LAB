.MODEL	SMALL
.DATA
	M1 DB 32
	M2 DB 26
	STR DB "M1+M2=",'$'
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	LEA DX,STR 
	MOV AH,09H
	INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV AL,M1
	CBW
	ADD AL,M2
;; DX	
	MOV CL,10	
	DIV CL
; AH 2
	ADD AL,30H
	ADD AH,30H
	MOV DX,AX

	MOV AH,02H
	INT 21H

	MOV DL,DH
	MOV AH,02H
	INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN
