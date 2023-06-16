 ;TITLE:

 .MODEL SMALL
 .STACK 100H

; .DATA
 

.CODE
MAIN PROC
    ;     MOV AX, @DATA    ; initialize DS
    ;     MOV DS, AX

         mov al,4h
         mov bl,2h

         div bl
         mov dl,al

         add dl,30h
         mov ah,2
         int 21h

                         
    exit:
         MOV AH, 4CH    ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
