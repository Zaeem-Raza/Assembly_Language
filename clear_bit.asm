 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV AX, @DATA       ; initialize DS
         MOV DS, AX

         mov al,'a'
    ; clear the 5th bit
         and al,11011111b
         mov dl,al
         mov ah,2
         int 21h

                         
         MOV AH, 4CH         ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
