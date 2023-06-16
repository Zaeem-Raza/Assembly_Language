 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 

.CODE
MAIN PROC
         MOV  AX, @DATA    ; initialize DS
         MOV  DS, AX
         mov  bx,10

    L1:  
         mov  cx,10
    L2:  
         mov  dl,"*"
         mov  ah,2
         int  21h
         loop L2
         dec  bx
         mov  ah,2
         mov  dl,0dh
         int  21h
         mov  dl,0ah
         int  21h
         jnz  L1

                         
         MOV  AH, 4CH      ; return control to DOS
         INT  21H
MAIN ENDP
 END MAIN
