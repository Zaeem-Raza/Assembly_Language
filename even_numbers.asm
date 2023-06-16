 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV AX, @DATA    ; initialize DS
         MOV DS, AX

         mov cx,0
    l1:  
         mov ax,cx
         and ax,1
         jz  L2
         inc cx
         cmp cx,9
         jl  l1
    L2:  
         mov dx,cx
         add dx,30h
         mov ah,02h
         int 21h
         inc cx
         cmp cx,9
         jl  L1
         jmp exit
         exit:
         MOV AH, 4CH      ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
