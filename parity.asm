 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    str1 db 0dh,0ah,"Flag set $"
    str2 db 0dh,0ah,"Flag not set $"

.CODE
MAIN PROC
           MOV  AX, @DATA         ; initialize DS
           MOV  DS, AX
           mov  ah,9
           mov  al,00010001b
           jp   label1

    label1:
           mov  dx,offset str1
           int  21h

           jmp  exit
    label2:
           mov  dx,offset str2
           int  21h

                         
    exit:  
           MOV  AH, 4CH           ; return control to DOS
           INT  21H
MAIN ENDP
line PROC
           mov  dl,0dh
           mov  ah,2
           int  21H
           mov  dl,0ah
           int  21h
           ret
line ENDP
    ;description
disp PROC,
           MOV  AH,2
           int  21h
           ret
disp ENDP
 END MAIN
