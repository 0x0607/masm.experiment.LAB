 INCLUDE   DOS.H ;�w�w INCLUDE �t�A��

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
      MOV  DX,OFFSET MSG1     ;��� MSG1 ������� �C
      MOV  AH,09
      INT  21H

      GETCHAR	BL            ;�q��L�W��J�@�ӼƦr,�æs�� BL �� �C
      CMP  BL,0DH
      JE   EXIT

      PRINT MSG2	      ;��� MSG2 ������� �C

      MOV  DL,BL              ;��� high nibble
      MOV  CL,4
      SHR  DL,CL
      ADD  DL,30H
      MOV  AH,02              
      INT  21H

      AND  BL,0FH	      ;��� low nibble
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
      PRINT MSG3	      ;��� MSG3 ������� �C
      MOV  AH,4CH             ;�{����^ DOS �C
      INT  21H
      .STACK
  END START