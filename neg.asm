 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
       string1 db "Negative number $"
       string2 db "Positive number $"

.CODE
MAIN PROC
              MOV  AX, @DATA          ; initialize DS
              MOV  DS, AX
              mov  al,00000000b
              test al,10000000b
              jnz  label2
              jz   label3
       label2:
              lea  dx,string1
              mov  ah,09h
              int  21h
              jmp  exit
       label3:
              lea  dx,string2
              mov  ah,09h
              int  21h
       exit:  
              MOV  AH, 4CH            ; return control to DOS
              INT  21H
MAIN ENDP
 END MAIN
