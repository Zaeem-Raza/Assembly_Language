 ;TITLE: sum an integer array using loop

 .MODEL SMALL
 .STACK 100H

.DATA
  abc  dw 01h,02h,03h
count=($-abc)/(type abc)
.CODE
MAIN PROC
       MOV  AX, @DATA      ; initialize DS
       MOV  DS, AX
 
       mov  ax,0
       mov  si,offset abc
       mov  cx,count
  L1:  
       add  ax,[si]
       add  si,type abc
       loop L1


       mov  dx,AX
       mov  ah,2
       add  dx,30h
       int  21h

       MOV  AH, 4CH        ; return control to DOS
       INT  21H
MAIN ENDP
 END MAIN
