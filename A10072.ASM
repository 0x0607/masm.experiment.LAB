.MODEL SMALL
.DATA
	SOURCE_8	DB 62H ; b
	DEST_8		DB 42H ; B
.CODE
MAIN:
	MOV 	AX,@DATA	; @DATA -> AX
	MOV	DS,AX		; AX ->DS
	MOV	CL,SOURCE_8	; SOURCE_8 -> CL
	MOV	DL,DEST_8	; DEST_8 -> DL
	XCHG	CL,DL		; CL,DL swap
	MOV	SOURCE_8,CL	; CL -> SOURCE_8 
	MOV	DEST_8,DL	; DL -> DEST_8
	MOV	AH,02H		; print DL(NEW DEST_8)
	INT	21H		; return Command
	MOV	AH,4CH		; End Command
	INT	21H		; return Command
	MOV	AH,4CH		; End Command
	END	MAIN
