INCLUDE		DOS.H

.MODEL        	SMALL
.DATA
MSG1		DB	'Please input a number (0~255): $'
MSG2		DB	'D=0x$'
MSG3		DB	10,?, 10 DUP(?)
ENTER		DB	13,10,'$'

.STACK
.CODE
START:
              	MOV     AX,@DATA
              	MOV     DS,AX
              	
              	PRINT	MSG1
              	INPUT	MSG3
              	PRINT	ENTER
              	
              	LEA	DX,MSG3
              	MOV	BX,0
              	MOV	BL,[MSG3+1]
              	ADD	DX,2
              	MOV	[MSG3+BX+2],'$'
              	MOV	AH,09H		; print the input number
              	INT	21H
              	PRINT	MSG2		; print '=0x'
              	
              	MOV	AL,0		; To get the input number
              	LEA	BX,MSG3
              	ADD	BX,2
              	MOV	CX,0
              	MOV	CL,[MSG3+1]
L2:		SHL	AL,1
		MOV	AH,AL
		SHL	AL,1
		SHL	AL,1
		ADD	AL,AH		; AL*10
              	MOV	DL,[BX]
              	INC	BX
              	SUB	DL,'0'
              	ADD	AL,DL
              	LOOP	L2
              	
		MOV	BL,AL
		MOV	DL,AL
              	MOV	CL,4
              	SHR	DL,CL
              	CMP	DL,9
              	JA	ALPHA1
              	ADD	DL,30H
              	JMP	L3
ALPHA1:		ADD	DL,55
L3:            	MOV	AH,02H
              	INT	21H
              	
              	MOV	DL,BL
              	AND	DL,00001111B
              	CMP	DL,9
              	JA	ALPHA
              	ADD	DL,30H
              	MOV	AH,02H
              	INT	21H
              	JMP	L1
ALPHA:		ADD	DL,55
		MOV	AH,02H
		INT	21H
 
L1:            	MOV     AH,4CH
              	INT     21H
              	END     START
