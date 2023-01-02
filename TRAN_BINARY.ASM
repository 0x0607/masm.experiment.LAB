;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; [挑戰]
; 	N1  DB 100 ( 0 ~ 255 )
;	  要能在螢幕上顯示16、8、2進制值
;   (可分成三個程式寫)
; 範例輸出:
;   N1=0x64
;   N1=144O
;   N1=01100100B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MODEL	SMALL
.DATA
	N1	DB 100
	MSG	DB 'N1=0x$'
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	LEA	DX,MSG
	MOV	AH,09H
	INT	21H
	MOV	DL,N1
	MOV	CL,4
	SHR	DL,CL 
	CMP	DL,9  
	JA	ALPHA1
	ADD	DL,30H
	JMP	L2
ALPHA1:
	ADD	DL,55  
L2:
	MOV	AH,02H
	INT	21H
	MOV	DL,N1
	AND	DL,00001111B 
	CMP	DL,9
	JA	ALPHA
	ADD	DL,30H
	MOV	AH,02H
	INT	21H
	JMP	L1
ALPHA:
	ADD	DL,55
	MOV	AH,02H
	INT	21H
	L1:
	MOV	AH,4CH
	INT	21H
.STACK
	END	MAIN
