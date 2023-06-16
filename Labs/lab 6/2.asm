 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    str1 db "Enter length: $"
    str2 db "Enter integers $"
    len  db 0
    arr  db 100 dup(0)
.CODE
MAIN PROC
         MOV AX, @DATA         ; initialize DS
         MOV DS, AX

         mov dx,offset str1
         mov ah,9
         int 21h
        
         mov ah,1
         int 21h
         inc al
         sub al,30h
         mov bl,al
         mov ah,1h
    L2:  
         int 21h
         dec bl
         jnz L2
         jz  L3


    L3:  
     jmp exit

         

        
        


                         
    exit:
         MOV AH, 4CH           ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
