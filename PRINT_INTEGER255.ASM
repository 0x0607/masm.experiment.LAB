;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
;   在螢幕上顯示
;   NUM=32    (0 - 255 任一數)
;   (若NUM=3，螢幕顯示 NUM=3)
;   (若NUM=253，螢幕顯示 NUM=253)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	NUM	DB 0
	STR1	DB 'NUM=$'
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	LEA	DX,STR1		; DX= 'NUM='
	MOV	AH,09H		; print string
	INT	21H
	MOV	AL,NUM		; AL= NUM
	CMP	AL,100
	JB	L1		; IF AL < 100 THEN GOTO L1
	MOV	AH,0		; AH = 0
	MOV	BL,100		; BL = 100
	DIV	BL		; NUM / 100
	MOV	CH,AH		; CH = NUM % 100
	ADD	AL,30H		; AL = 30H + NUM = [0-9]
	MOV	DL,AL
	MOV	AH,02H		; print
	INT	21H
	MOV	AL,CH		; AL = NUM % 100
	MOV	AH,0		; AH = 0
	MOV	BL,10		; BL = 10	
	DIV	BL		; (NUM % 100) / 10
	MOV	CH,AH		; CH = (NUM % 100) %10
	ADD	AL,30H		; AL = 30H + NUM = [0-9]
	MOV	DL,AL
	MOV	AH,02H		; print
	INT	21H
	MOV	DL,CH		; (NUM % 100) % 10
	ADD	DL,30H
	MOV	AH,02H		; print
	INT	21H
	JMP	FINISH

L1:		
	CMP	AL,10		
	JB	L2		; IF AL < 10 THEN GOTO L2
	CBW
	MOV	BL,10		; BL = 10
	DIV	BL		; AL

	MOV	CH,AH		; 
	ADD	AL,30H		
	MOV	DL,AL
	MOV	AH,02H
	INT	21H
	
	MOV	DL,CH
	ADD	DL,30H
	MOV	AH,02H
	INT	21H
	JMP	FINISH
L2:
	ADD	AL,30H
	MOV	DL,AL
	MOV	AH,02H
	INT	21H

FINISH:
	MOV	AH,4CH
	INT	21H
.STACK
	END	MAIN
