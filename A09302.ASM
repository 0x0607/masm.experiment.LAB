;0930-2
CR	EQU 0DH		;setting const
LF	EQU 0AH		;setting const
.MODEL SMALL
.CODE
BEGIN:	
	MOV AX,@DATA		; DS <- @DATA
	MOV DS,AX		; 
	MOV DX,OFFSET message	; DX <- message
	MOV AH,09H		; print_string from AH
	INT 21H			; return 
	MOV AH,4CH		; end code
	INT 21H			; return
.DATA
message	DB 'Hi! Assembly!',0DH,0AH
	DB 'How are you?',CR,LF,'$'
.STACK
	END BEGIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 0DH	Clear buffer
; 0AH	Input buffer
; DB	Define Byte (8bits)
; '$'	End of Line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
