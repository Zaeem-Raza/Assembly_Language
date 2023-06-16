 ;TITLE:

 .MODEL SMALL
 .STACK 100H

; .DATA
 

.CODE
MAIN PROC
     ;     MOV AX, @DATA    ; initialize DS
     ;     MOV DS, AX

          mov ax,2h
          mov bx,2h

          mul bx
          mov dx,ax

          add dx,30h
          mov ah,2
          int 21h

                         
     exit:
          MOV AH, 4CH     ; return control to DOS
          INT 21H
MAIN ENDP
 END MAIN
