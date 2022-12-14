.MODEL	SMALL
.DATA
	NUM1	DW 76H
	NUM2 	DB 09H
	Q8	DB ?	; 76H DIV 9H
	R8	DB ?	; 76H MOD 9H
	NUM3 	DW 99H	; L
	NUM4	DW 8H	: H
	NUM5	DW 100H
	Q16	DW ?	; 899H DIV 100H
	R16 	DW ?	; 899H MOD 100H
.CODE
MAIN:
	MOV 	AX,@DATA
	MOV 	DS,AX
	MOV 	AX,NUM1	; dividend
	DIV 	NUM2	; divisor
	MOV 	Q8,AL 	; quotient  (NUM1/NUM2)
	MOV 	R8,AH	; remainder (NUM1%NUM2)
	MOV 	AX,NUM3	; dividend  (Most Significant Bit)
	MOV 	DX,NUM4	; dividend  (Least Significant Bit)
	DIV	NUM5	; divisor
	MOV 	Q16,AX	; quotient  (NUM4NUM3/NUM5)
	MOV 	R16,DX	; remainder (NUM4NUM3%NUM5)
	MOV 	AH,4CH
	INT 	21H
.STACK
	END MAIN
