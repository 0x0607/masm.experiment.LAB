

.MODEL        	SMALL
.DATA
N1		DB   	20
N2		DB	200
N3		DB	1

.STACK
.CODE
START:
              	MOV     AX,@DATA
              	MOV     DS,AX
              	
		MOV	AL,N1
		CMP	AL,N2
		JA	L1
		XCHG	AL,N2
		MOV	N1,AL
L1:		MOV	AL,N2
		CMP	AL,N3
		JA	L2
		XCHG	AL,N3
		MOV	N2,AL
L2:		MOV	AL,N1
		CMP	AL,N2
		JA	L3
		XCHG	AL,N2
		MOV	N1,AL
				  
L3:            	MOV     AH,4CH
              	INT     21H
              	END     START
