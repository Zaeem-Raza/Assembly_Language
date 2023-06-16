 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    string db "Hello"

.CODE
MAIN PROC
         MOV AX, @DATA           ; initialize DS
         MOV DS, AX

         mov bx,offset string
         add bx,4
         mov dl,[bx]
         mov ah,02h       ; write to screen "o"
         int 21h

                         
         MOV AH, 4CH             ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
