;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
;   用LOOP指令寫一程式做N1+...+N2
;   將結果存入SUM(不用顯示在螢幕)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	N1	DB 1
	N2	DB 20
	SUM	DB 0
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	MOV	AL,N2   ; AL =  20
	SUB	AL,N1   ; AL -= 1
	INC	AL      ; AL++  (NOW AL =20)
  ; COUNT(1 ~ 20)'s NUMBER 
	MOV	CL,AL   ; CL = AL
	MOV	CH,0    ; CH = 0  (CLEAR)
	MOV	AL,N1   ; AL = 1

L1:           ; DO
	ADD	SUM,AL  ; SUM += AL
	INC	AL      ; AL ++
	LOOP	L1    ; WHILE( CX > 0)
	MOV	AH,4CH  ; interrumpir
	INT	21H
.STACK
	END MAIN
