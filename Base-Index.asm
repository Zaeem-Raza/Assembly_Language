 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
ROWSIZE=5
    array db 10h,20h,30h,40h,50h
          db 60h,70h,80h,90h,0A0h
          db 0B0h,0C0h,0D0h,0E0h,0F0h


.CODE
MAIN PROC
         MOV AX, @DATA          ; initialize DS
         MOV DS, AX

         mov bx,offset array    ;load the offset of the array into bx
         add bx,ROWSIZE         ;add the offset of the next row to bx
         mov si,2
         mov al,[bx+si]         ;load the value at the offset into al
         mov ah,2
         
         mov dl,al
         add dl,30h
         int 21h

                         
         MOV AH, 4CH            ; return control to DOS
         INT 21H
MAIN ENDP
 END MAIN
