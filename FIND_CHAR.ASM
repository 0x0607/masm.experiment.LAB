.MODEL	SMALL
.DATA
	TEXT1		DB 'IBM PC ASSEMBER '
	TEXT2		DB 'A'
	LEN		DW 16
	CHAR_ADDR	DB ?
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX
	LEA	SI,TEXT1	; *SI = TEXT1
	DEC	SI		; SI--		This SI is added by 1 by the subsequent code
	MOV	CX,LEN		
NEXT:				; DO
	INC 	SI		; SI++
	MOV 	DL,[SI]		; DL = SI[?]
	CMP 	TEXT2,DL	
	LOOPNE	NEXT		; LOOP
	MOV	BX,LEN		; BX=16
	SUB	BX,CX		; BX (position) -= CX (current position)
	MOV	CHAR_ADDR,BL	; character's address
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
