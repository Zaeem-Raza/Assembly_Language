;TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    var     db 1h
    prompt  db "Enter a number: $"
    string  db "Even $"
    string2 db "Odd $"
.CODE
MAIN PROC
            MOV AX, @DATA            ; initialize DS
            MOV DS, AX

            mov  ah,9
            mov  dx,offset prompt
            int  21h
            mov  ah,1
            int  21h
            sub al,30h
            and ax,1
            jnz odd
            jz  evenVal
    evenVal:
            mov dx,offset string
            mov ah,9
            int 21h
            jmp endpr
    odd:    
            mov dx,offset string2
            mov ah,9
            int 21h
            jmp endpr

    endpr:  
            MOV AH, 4CH              ; return control to DOS
            INT 21H
MAIN ENDP
    ;description
line PROC
            mov ah,2
            mov dl,0dh
            int 21h
            mov dl,0ah
            int 21h
            ret
line ENDP
 END MAIN