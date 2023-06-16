 ;?TITLE: print the array using si

 .MODEL SMALL
 .STACK 100H

.DATA
    arr  db 01h,02h,03h,04h

.CODE
MAIN PROC
         MOV  AX, @DATA        ; initialize DS
         MOV  DS, AX

    ;  mov  si,0
         mov  bx,offset arr
         mov  cx,4
    L1:  
         mov  dl,[bx+si]
         add  dl,30h
         mov  ah,02h
         int  21h
         inc  si
         Loop L1

                         
         MOV  AH, 4CH          ; return control to DOS
         INT  21H
MAIN ENDP
 END MAIN
