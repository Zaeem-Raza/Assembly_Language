 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    string1 db "Zero $"
    string2 db "not Zero $"

.CODE
MAIN PROC
           MOV AX, @DATA             ; initialize DS
           MOV DS, AX

           mov al,3h
           or  al,al
           jz  label1
           jnz label2

    label1:

           mov dx,offset string1
           mov ah,9
           int 21h
           jmp exit
    label2:
           mov dx,offset string2
           mov ah,9
           int 21h
           jmp exit
    exit:  
           MOV AH, 4CH               ; return control to DOS
           INT 21H
MAIN ENDP
 END MAIN
