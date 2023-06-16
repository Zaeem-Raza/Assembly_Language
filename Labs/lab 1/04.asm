 TITLE: Reverse Array

 .MODEL SMALL
 .STACK 100H

 .DATA
 arr db 0h,1h,2h,3h

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     mov bx,offset arr           ; bx stores starting address of array
     mov si,3
     mov ah,2
     mov cx,4

     l1:
       mov dl,byte ptr [bx+si]
       add dl,30h
       int 21H
       dec si
       loop l1
              
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
