.MODEL	SMALL
.DATA
	STR1	DB 'IBM PC ASSUMBER$'
	STR2	DB 15 DUP(?)		; Create Array STR2[15]={?,?,?,?,?,?,?,?,?,?,?,?,?,?,?}
.CODE
MAIN:
	MOV	AX,@DATA
	MOV	DS,AX			; SET destination index register - DS
	MOV	ES,AX			; SET destination index register - ES
	STD				; SET the direction flag 	DF = 1
	LEA	SI,STR1+15		; SI = STR1.ADDRESS + 15
	LEA	DI,STR2+15		; DI = STR2.ADDRESS + 15
	MOV	CX,16
  REP	MOVS	ES:STR2,STR1		; Repeat the MOVS to copy STR1 to STR2
	LEA	DX,STR2			; DI = 'IBM PC ASSUMBER$'	STR2 = DI
	MOV	AH,09H			; print
	INT	21H
	MOV	AH,4CH
	INT	21H	
.STACK
	END	MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NOTE: 
;	SI = source index register
;	DS,ES = destination index register
;		used for string, memory array copying and setting and
;		for far pointer addressing with ES
;	ARRAY DB X DUP(?): 
;		declare an ARRAY of X bytes each byte is not initialized
;	REP {param}:
;		repeating trivial and annoying instructions
;	MOVS:
;		move the string data (2 word), copy the data 
;		at the memory address addressed by the ESI(ES) register 
;		to the memory address addressed by the EDI(DI) register
;	MOVSB:
;		move the string data, copy the data 
;		at the memory address addressed by the ESI(ES) register 
;		to the memory address addressed by the EDI(DI) register
; P.S:
;	ES is extra segment registers available 
;	for far pointer addressing like video memory and such.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
