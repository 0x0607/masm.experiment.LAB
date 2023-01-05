 INCLUDE   DOS.H ;── INCLUDE 含括檔

 .MODEL SMALL
 .DATA
  MSG1  DB 13,10,'Please input a digit  : $'
  MSG2  DB 13,10,'The ASCII Code is     : 0x$'
  MSG3  DB 13,10,'Thank You! $'

 .CODE
 START:
      MOV  AX,@DATA
      MOV  DS,AX
      
AGAIN:
      MOV  DX,OFFSET MSG1     ;顯示 MSG1 內的資料 。
      MOV  AH,09
      INT  21H

      GETCHAR	BL            ;從鍵盤上輸入一個數字,並存於 BL 內 。
      CMP  BL,0DH
      JE   EXIT

      PRINT MSG2	      ;顯示 MSG2 內的資料 。

      MOV  DL,BL              ;顯示 high nibble
      MOV  CL,4
      SHR  DL,CL
      ADD  DL,30H
      MOV  AH,02              
      INT  21H

      AND  BL,0FH	      ;顯示 low nibble
      CMP  BL,9
      JA   ALPHA
      ADD  BL,30H
      JMP  P_C
ALPHA:
      SUB  BL,9
      ADD  BL,40H
P_C:
      PUTCHAR BL
      JMP  AGAIN

EXIT:
      PRINT MSG3	      ;顯示 MSG3 內的資料 。
      MOV  AH,4CH             ;程式返回 DOS 。
      INT  21H
      .STACK
  END START
