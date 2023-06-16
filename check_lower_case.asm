 ;?TITLE: get input from user and check if it is a lower case?

 .MODEL SMALL
 .STACK 100H

.DATA
       string1 db 0dh,0ah,"lies between a-z $"
       string2 db 0dh,0ah,"does not lies between a-z $"

.CODE
MAIN PROC
              MOV  AX, @DATA               ; initialize DS
              MOV  DS, AX

              mov  ah,1
              int  21h

              cmp  al,'a'
              jge  label1
              jnge label3

       label1:
              cmp  al,'z'
              jle  Label2
              jnle label3

       Label2:
              mov  ah,9
              mov  dx,offset string1
              int  21H
              jmp  exit
       label3:
              mov  ah,9
              mov  dx,offset string2
              int  21H
       exit:  
              MOV  AH, 4CH                 ; return control to DOS
              INT  21H
MAIN ENDP
 END MAIN
