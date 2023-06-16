 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    arr    db 01h,02h,03h,04H
    string db "Value not found $"
 

.CODE
MAIN PROC
          MOV  AX, @DATA           ; initialize DS
          MOV  DS, AX

          mov  si,0
          mov  cx,4
    L1:   
cmp [arr+si],8
          je   print
          inc  si
          loop L1
          mov  dx,offset string
          mov  ah,9
          int  21H
          jmp  exit

    print:
          mov  dx,si
          add  dx,30h
          mov  ah,2
          int  21H
    exit: 
          MOV  AH, 4CH             ; return control to DOS
          INT  21H
MAIN ENDP
 END MAIN
