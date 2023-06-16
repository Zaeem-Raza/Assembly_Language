 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    string2 equ "Capital: $"

    prompt2 db  string2
.CODE
MAIN PROC
         MOV AX, @DATA       ; initialize DS
         MOV DS, AX
        
         mov al,'d'
         and al,01000100b
         mov dl,al
         mov ah,2
         int 21h

                         
         MOV AH, 4CH         ; return control to DOS
         INT 21H
MAIN ENDP
    ;description
line PROC
         mov ah,2
         mov dl,0dh
         int 21h
         mov ah,2
         mov dl,0ah
         ret
line ENDP
 END MAIN
