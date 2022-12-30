.MODEL	SMALL
.DATA
	TEXT1		DB 'IBM PC ASSEMBER '
	TEXT2		DB 'IBM PC ASSENBER '
	LEN		DW 16
	DIFF		DB ?
	DIFF_ADDR	DW ?
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	LEA	SI,TEXT1	; *SI = TEXT1
	LEA	DI,TEXT2	; *DI = TEXT2
	DEC	SI		; SI--		This SI is added by 1 by the subsequent code
	DEC	DI		; DI--		This DI is added by 1 by the subsequent code
	MOV	CX,LEN
NEXT:				; DO
	INC 	SI		; SI++
	INC 	DI		; DI++
	MOV 	BH,[SI]		; BH = SI[?]
	MOV 	AH,[DI]		; AH = DI[?]
	CMP 	BH,AH
	LOOPE	NEXT		; LOOP
	;CMP	CX,0
	;JE	BREAK
	MOV	DIFF,AH		; DIFF=DI[?]
	MOV	BX,LEN		; BX=16
	SUB	BX,CX		; BX (position) -= CX (current position)
	MOV	DIFF_ADDR,BX	; difference's address
BREAK:
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NOTE: 
;	SI = source index register
;	DI = destination index register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
