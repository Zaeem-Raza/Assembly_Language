 ;?TITLE: take input from user until he presses enter

 .MODEL SMALL
 .STACK 100

.DATA

    str2 db "String has been stored $"
    str3 db 20 dup(0)
.CODE
MAIN PROC
           MOV AX, @DATA         ; initialize DS
           MOV DS, AX
          
           mov ah,1
           int 21h
    Label2:
           cmp al,0dh
           je  label1
           int 21h
           jmp label2

    label1:
           mov dx,offset str2
           mov ah,9
           int 21h

   

                         
    exit:  
           MOV AH, 4CH           ; return control to DOS
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
