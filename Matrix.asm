 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
       string db "The matrix is: $",0dh,0ah
       mat    db 0h,1h,2h,3h,4h,5h,6h,7h,8h
.CODE
MAIN PROC
            MOV  AX, @DATA              ; initialize DS
            MOV  DS, AX
 
            mov  dx,offset string
            mov  ah,9
            int  21h
            call line
            mov  bx,offset mat
            mov  si,0
            mov  bl,3
            mov  ah,2
            mov  bh,1h
       L1:  
            mov  cx,3
       L2:  
            mov  dl,bh
            inc  bh
            add  dl,30h
            int  21h
            loop L2
            call line
            dec  bl
            jnz  L1

                         
            MOV  AH, 4CH                ; return control to DOS
            INT  21H
MAIN ENDP
line proc
            mov  ah,2
            mov  dl,0dh
            int  21h
            mov  dl,0ah
            int  21h
            ret
line endp
 END MAIN
