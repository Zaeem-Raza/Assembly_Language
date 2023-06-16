 ;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
 
    arr  db 01h,02h,03h
.CODE
MAIN PROC
         MOV  AX, @DATA        ; initialize DS
         MOV  DS, AX
 
         mov  ax,0
         mov  cx,3
         mov  bx,offset arr
         mov  si,0
    L1:  
         add  al,arr[bx+si]
         inc  si
         loop L1
         mov  dl,al
         add  dl,30h
         mov  ah,02h
         int  21h

                         
         MOV  AH, 4CH          ; return control to DOS
         INT  21H
MAIN ENDP
 END MAIN
