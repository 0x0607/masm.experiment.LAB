.MODEL SMALL
.DATA
	MEMORY_BITS	DB 00H,11H,22H,33H,44H,55H,66H,77H,88H,99H
	DEST_3		DB ?
	DEST_5		DB ?
	DEST_7		DB ?
	DEST_8		DB ?
	DEST_9		DB ?
.CODE
MAIN:
	MOV AX,@DATA
	MOV DS,AX
	LEA BX,MEMORY_BITS
	
; MEMORY_BITS[4]
	MOV AL,3
	XLAT MEMORY_BITS
	MOV DEST_3,AL
; MEMORY_BITS[5]
	MOV AL,5
	XLATB
	MOV DEST_5,AL
; MEMORY_BITS[7]
	MOV SI,7
	MOV AL,[BX+SI]
	MOV DEST_7,AL
; MEMORY_BITS[8]
	MOV SI,8
	MOV AL,[BX][SI]
	MOV DEST_8,AL
; MEMORY_BITS[9]
	MOV AL,[BX+SI+1]
	MOV DEST_9,AL
	
	MOV AH,4CH
	INT 21H
.STACK
	END MAIN
