 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
           MOV AX, @DATA    ; initialize DS
           MOV DS, AX
           mov ah,1
           int 21h

           cmp al,0
           jl  Label1
           jnl Label2


    Point: 
           mov ax,9
           mov bx,4
           mov cx,1
           cmp ax,bx
           jl  Label3
           jnl Label4

    Label1:
           mov ah,0ffh
           jmp Point
    Label2:
           mov ah,0
           jmp Point
    Label3:
           mov ax,0
           jmp exit
    Label4:
           cmp bx,cx
           jl  Label5
           jnl Label6


    Label5:
           mov bx,0
           jmp exit

    Label6:
           mov cx,0
           jmp exit
    exit:  
           MOV AH, 4CH      ; return control to DOS
           INT 21H
MAIN ENDP
 END MAIN
