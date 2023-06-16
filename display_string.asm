 ;TITLE:Display a string using loop

 .MODEL SMALL
 .STACK 100H

 .DATA
 string db "My name is Khan"
 count=($-string)

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
    mov cx,count
    mov si,offset string
    mov ah,2
    L1:
    mov dl,[si]
    int 21H
    inc si
    loop L1


                         
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
