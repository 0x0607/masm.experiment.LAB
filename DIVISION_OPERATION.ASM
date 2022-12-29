;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
; 	將M1/M2，商放入Q_16，餘數放入R_16
;	(記得要自己驗證Q_16和R_16之值是否正確)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
M1	DW 2345
M2	DW 345
Q_16	DW ?
R_16	DW ?
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	MOV AX,M1     ; dividend
	CWD           ; DX & AX = Dividend
	MOV BX,M2     ; divisor
	DIV BX        ; M1 / M2
	MOV Q_16,AX   ; quotient
	MOV R_16,DX   ; remainder
	MOV AH,4CH    ; interrumpir
	INT 21H
.STACK
	END MAIN
