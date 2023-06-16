 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    arr  db 2h,1h,2h,6h,3h,5h
.CODE
MAIN PROC
         MOV  AX, @DATA    ; initialize DS
         MOV  DS, AX
         mov al,2
         mov  cx,6
         lea  si,arr

    l1:  
         mov  bl,[si]
         cmp  bl,al
         jle  skip
         mov  al,bl
    skip:
         inc  si
         loop l1

         mov  dl,al
         add dl,30h
         mov  ah,2
         int  21h
    exit:
         MOV  AH, 4CH      ; return control to DOS
         INT  21H
MAIN ENDP
 END MAIN

