 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    var1 db 5h
    var2 db 5h
.CODE
MAIN PROC
         MOV AX, @DATA    ; initialize DS
         MOV DS, AX
      
         mov al,var1
         add al,var2
         mov ah,0
         AAA
         MOV BX,AX
         ADD BH,30H
         ADD BL,30H
         MOV AH,2
         MOV DL,BH
         INT 21H
         MOV AH,2
         MOV DL,BL
         INT 21H
                         
    exit:
         MOV AH, 4CH      ; return control to DOS
         INT 21H
MAIN ENDP
line PROC
         mov dl,0dh
         mov ah,2
         int 21H
         mov dl,0ah
         int 21h
         ret
line ENDP
    ;description
disp PROC,
         MOV AH,2
         int 21h
         ret
disp ENDP
 END MAIN
