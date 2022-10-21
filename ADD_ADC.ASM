.MODEL	SMALL
.DATA
	NUM_1L8	DB	0AAH
	NUM_2L8	DB	58H
	ADD_L8	DB	?
	NUM_1H8	DB	80H
	NUM_2H8	DB	50H
	ADD_H8	DB	?
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV BL,NUM_1L8		; NUM_1L8->BL
	ADD BL,[NUM_2L8]	; NUM_1L+NUM_2L8	CF=1,AF=1
	MOV [ADD_L8],BL		; Result Save As ADD_L8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV BL,[NUM_1H8]	; NUM_1H8->BL 
	MOV DL,[NUM_2H8]	; NUM_2H8->DL
	ADC BL,DL		; NUM_1H8+NUM_2H8+CF	CF=1
	MOV ADD_H8,BL		; Result Save As ADD_H8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	INT 21H
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN	
