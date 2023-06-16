 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    string db "Hello"

.CODE
MAIN PROC
         MOV  AX, @DATA           ; initialize DS
         MOV  DS, AX

    ;reverse a string
         mov  si,0
         mov  cx,5
         mov  bx,offset string
    L1:  
         push [bx+si]
         inc  si
         loop L1

         mov  cx,5
         mov  si,0
    L2:  
         pop  [bx+si]
         mov  dl,[bx+si]
         mov  ah,02H
         int  21H
         inc  si
         loop L2

            
         MOV  AH, 4CH             ; return control to DOS
         INT  21H
MAIN ENDP
 END MAIN
