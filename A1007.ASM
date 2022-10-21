.MODEL SMALL
.DATA
	SOURCE_8	DB 61H	; a
	DEST_8	 	DB 41H	; A
.CODE
MAIN:
	MOV	AX,@DATA	; @DATA -> AX
	MOV	DS,AX		; AX -> DS
;-------------------------------
	MOV	CL,SOURCE_8	; SOURCE_8 -> CL
	MOV	DL,DEST_8	; DEST_8 -> DL
	MOV	SOURCE_8,DL	; DL -> SOURCE_8
	MOV	DEST_8,CL	; CL -> DEST_8
	MOV	AH,02H		; print DL(NEW SOURCE_8)
	INT	21H		; return Command
;-------------------------------
	MOV	AH,4CH		; End Command
	INT	21H		; return Command
	END	MAIN		; EOF
