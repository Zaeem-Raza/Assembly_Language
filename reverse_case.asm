 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV AX, @DATA       ; initialize DS
         MOV DS, AX

         mov al,'B'
         xor al,00100000b

         mov dl,al
         mov ah,02h
         int 21h
                         
         MOV AH, 4CH         ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
