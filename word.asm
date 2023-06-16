 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    arr  dw 1h,2h,3h

.CODE
MAIN PROC
         MOV AX, @DATA        ; initialize DS
         MOV DS, AX

         mov bx,offset arr
         mov ax,[bx]
         add ax,[bx+2]
         add ax,[bx+4]
    
         mov dx,ax
         add dx,30h
         mov ah, 2
         int 21h
                 
         MOV AH, 4CH          ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
