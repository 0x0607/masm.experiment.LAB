;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
;   寫一程式將NUM*70之值存入N70
; 	用移位和加法來完成
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	NUM DB 72
	N70 DW ?    ; 70 = 2^6 + 2^2 + 2^1
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	MOV AL,NUM  ; AL = 72
	CBW 
	SHL AX,1    ; AX<<1 = 72 * 2^1
	MOV N70,AX  ; N70 = 72 * 2^1
	SHL AX,1    ; AX<<2 = 72 * 2^2 = 72 * 2^(1+1)
	ADD N70,AX  ; N70 = 72*(2^1) + 72*(2^2)
	MOV CL,4    ; CL = 4
	SHL AX,CL   ; AX<<6 = 72 * 2^6 = 72 * 2^(4+1+1)
	ADD N70,AX  ; N70 = 72*(2^1) + 72*(2^2) + 72*(2^6)
	MOV AH,4CH  ; interrumpir
	INT 21H
.STACK
	END MAIN
