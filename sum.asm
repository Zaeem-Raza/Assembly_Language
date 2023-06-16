

 .MODEL SMALL
 .STACK 100H

.DATA
  arr  db 1h,2h,3h
 ; sum  db 0
.CODE
MAIN PROC
       MOV AX, @DATA      ; initialize DS
       MOV DS, AX
       mov ax,offset arr
       mov bl,byte ptr arr
       mov dl,[bl]
       inc bl
       add dl,[bl]
       inc bl
       add dl,[bl]

       add dl,30h            ; convert to ASCII

       mov ah,2
       int 21h
       MOV AH, 4CH        ; return control to DOS
       INT 21H
MAIN ENDP
 END MAIN
