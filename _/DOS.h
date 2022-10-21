;*************************************************
;*DOS FUNCTION CALL 01h:讀取按鍵並回映至螢幕上   *
;*傳回:(char)=(AL)=鍵入字元之 ASCII 碼           *
;*************************************************
GETCHAR  MACRO  char
         mov     ah,01h
         int     21h
         mov     char,al
         ENDM
;***************************************************
;* DOS FUNCTION CALL 02h:印字至螢幕                *
;***************************************************
PUTCHAR    MACRO  char
           mov     dl,char
           mov     ah,02h
           int     21h
           ENDM
;***************************************************
;*DOS FUNCTION CALL 06h:讀取按鍵不回映不等候       *
;*傳回: ZF=0 (AL)=鍵入字鍵之 ASCII 碼, ZF=1 無按鍵 *
;***************************************************
GETC     MACRO
         mov     dl,0ffh
         mov     ah,06h
         int     21h
         ENDM
;***************************************************
;* DOS FUNCTION CALL 09h 在螢幕上顯示一字串        *
;***************************************************
PRINT    MACRO   string
         mov     dx,OFFSET string
         mov     ah,09h
         int     21h
         ENDM
;***************************************************
;* DOS FUNCTION CALL 0Ah 讀取一字串                *
;***************************************************
INPUT     MACRO   string
          mov     dx,OFFSET string
          mov     ah,0ah
          int     21h
          ENDM
;*************************************************
;* DOS FUNCTION CALL 4Ch: 結束程式               *
;*************************************************
END_PROCESS  MACRO
             mov     ah,4ch
             int     21h
             ENDM
