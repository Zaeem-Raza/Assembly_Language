 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
           MOV AX, @DATA    ; initialize DS
           MOV DS, AX

           
           mov al,1h
           cmp al,2h
           ja  label1
           jna label2

    label1:
           mov dl,"*"
           mov ah,02h
           int 21h
           jmp exit
    label2:
           mov dl,"-"
           mov ah,02h
           int 21h
           ;jmp exit
    exit:  
           MOV AH, 4CH      ; return control to DOS
           INT 21H
MAIN ENDP
 END MAIN
