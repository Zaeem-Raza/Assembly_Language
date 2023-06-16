 ;?TITLE: check if the bits are set or not?

 .MODEL SMALL
 .STACK 100H

.DATA
    string1 db "The first or second bit is set",0dh,0ah,"$"
    string2 db "The first or second bit is not set",0dh,0ah,"$"

.CODE
MAIN PROC
           MOV  AX, @DATA            ; initialize DS
           MOV  DS, AX

           mov  al,00001101b
           test al,00000011b
           jnz  label1
           jz   label2

    label1:
           mov  dx,offset string1
           mov  ah,09h
           int  21h
           jmp  exit
    label2:
           mov  dx,offset string2
           mov  ah,09h
           int  21h
    exit:  
           MOV  AH, 4CH              ; return control to DOS
           INT  21H
MAIN ENDP
 END MAIN
