

.MODEL        	SMALL
.DATA
M1		DB   	-1
STR1		DB	'M1=$'
STR2		DB	'-$'

.STACK
.CODE
START:
              	MOV     AX,@DATA
              	MOV     DS,AX
              	
              	LEA	DX,STR1
              	MOV	AH,09H
              	INT	21H		;print "M1="
              	
		
              	MOV	AL,M1
              	AND	AL,10000000B

		CMP	AL,10000000B
		JNE	PE

		LEA	DX,STR2
              	MOV	AH,09H
              	INT	21H		;print "-"

		MOV	AL,M1
		NEG	AL
		CMP	AL,10000000B
		JNE	PZ

PE:
		MOV	AL,M1

PZ:
		
		CBW
		
              	MOV	BL,10
              	DIV	BL		;DIV、IDIV 10000000的2'S還是10000000
              	
              	MOV	CH,AH

		CMP	AL,10
		JB	EX

              	ADD	AL,30H
              	MOV	DL,AL
              	MOV	AH,02H
              	INT	21H

EX:              	
              	MOV	DL,CH
              	ADD	DL,30H
              	MOV	AH,02H
              	INT	21H
              
              	MOV     AH,4CH
              	INT     21H
              	END     START
