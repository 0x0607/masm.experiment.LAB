
;*************************************************
;*DOS FUNCTION CALL 01h:Ū������æ^�M�ܿù��W   *
;*�Ǧ^:(char)=(AL)=��J�r���� ASCII �X           *
;*************************************************
GETCHAR  MACRO  char
         mov     ah,01h
         int     21h
         mov     char,al
         ENDM
;***************************************************
;* DOS FUNCTION CALL 02h:�L�r�ܿù�                *
;***************************************************
PUTCHAR    MACRO  char
           mov     dl,char
           mov     ah,02h
           int     21h
           ENDM
;***************************************************
;*DOS FUNCTION CALL 06h:Ū�����䤣�^�M������       *
;*�Ǧ^: ZF=0 (AL)=��J�r�䤧 ASCII �X, ZF=1 �L���� *
;***************************************************
GETC     MACRO
         mov     dl,0ffh
         mov     ah,06h
         int     21h
         ENDM
;***************************************************
;* DOS FUNCTION CALL 09h �b�ù��W��ܤ@�r��        *
;***************************************************
PRINT    MACRO   string
         mov     dx,OFFSET string
         mov     ah,09h
         int     21h
         ENDM
;***************************************************
;* DOS FUNCTION CALL 0Ah Ū���@�r��                *
;***************************************************
INPUT     MACRO   string
          mov     dx,OFFSET string
          mov     ah,0ah
          int     21h
          ENDM
;*************************************************
;* DOS FUNCTION CALL 4Ch: �����{��               *
;*************************************************
END_PROCESS  MACRO
             mov     ah,4ch
             int     21h
             ENDM
