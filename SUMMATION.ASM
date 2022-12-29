;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
;   用JXX指令寫一程式做N1+...+N2
;   將結果存入SUM(不用顯示在螢幕)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	N1	DB 1      ; start number
	N2	DB 20     ; end number
	SUM	DB ?      ; Sigma 1+2+....+20
.CODE
MAIN:
	MOV AX,@DATA  
	MOV DS,AX     
	MOV AL,N1     ; AL = N1
	MOV BL,0      ; BL =  0
	MOV SUM,BL    ; SUM = 0
L1:		
	ADD SUM,AL    ; SUM += N1
	INC AL        ; N1++
	CMP AL,N2     
	JNA L1        ; !(AL > N2) = (AL <= N2) 
	MOV AH,4CH    ; interrumpir
	INT 21H
.STACK
	END MAIN
