 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV AX, @DATA       ; initialize DS
         MOV DS, AX

         mov al,'a'
         and al,11011111b

         mov dl,al
         mov ah,2
         int 21h
                         
    exit:
         MOV AH, 4CH         ; return control to DOS
         INT 21H
MAIN ENDP
line PROC
         mov dl,0dh
         mov ah,2
         int 21H
         mov dl,0ah
         int 21h
         ret
line ENDP
    ;description
disp PROC,
         MOV AH,2
         int 21h
         ret
disp ENDP
 END MAIN
