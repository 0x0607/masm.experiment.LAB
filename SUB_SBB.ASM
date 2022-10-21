.MODEL	SMALL
.DATA
	NUM_1L8	DB	58H
	NUM_2L8	DB	0AAH
	SUB_L8	DB	?
	NUM_1H8	DB	80H
	NUM_2H8	DB	50H
	SUB_H8	DB	?
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV BL,NUM_1L8		; NUM_1L8->BL
	SUB BL,[NUM_2L8]	; NUM_1L-NUM_2L8	CF=1,AF=1
	MOV [SUB_L8],BL		; Result Save As SUB_L8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	MOV BL,[NUM_1H8]	; NUM_1H8->BL 
	MOV DL,[NUM_2H8]	; NUM_2H8->DL
	SBB BL,DL		; NUM_1H8-NUM_2H8-CF
	MOV SUB_H8,BL		; Result Save As SUB_H8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	INT 21H
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN	
