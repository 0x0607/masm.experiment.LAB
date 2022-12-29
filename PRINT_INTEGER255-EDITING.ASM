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
.STACK
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX

	LEA	DX,STR1
	MOV	AH,09H
	INT	21H		;print "M1="

	MOV	AL,NUM
	CMP	AL,100		;if NUM<100, don't print the digit for hundred
	JB	L1
	MOV	AH,0
	MOV	BL,100
	DIV	BL

	MOV	CH,AH
	ADD	AL,30H		; print hundred
	MOV	DL,AL
	MOV	AH,02H
	INT	21H

	MOV	AL,CH
	MOV	AH,0
	MOV	BL,10
	DIV	BL

	MOV	CH,AH
	ADD	AL,30H
	MOV	DL,AL
	MOV	AH,02H
	INT	21H

	MOV	DL,CH
	ADD	DL,30H
	MOV	AH,02H
	INT	21H
	JMP	FINISH

L1:		
	CMP	AL,10		; if NUM<10, goto L2 and print only one digit
	JB	L2
	CBW
	MOV	BL,10
	DIV	BL

	MOV	CH,AH
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
	END	MAIN
