 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV AX, @DATA       ; initialize DS
         MOV DS, AX

         mov al,6
        ; add al,30h
          or  al,00110000b   ;alter
         mov dl,al
         mov ah,2
         int 21h

                         
         MOV AH, 4CH         ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
