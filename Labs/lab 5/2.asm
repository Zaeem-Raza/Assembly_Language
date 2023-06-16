 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    str1    db "Given Number: $"
    prompt1 db 0dh,0ah,"Given number is Even $"
    prompt2 db 0dh,0ah,"Given number is Odd $"
    prompt3 db 0dh,0ah,"Number You have Entered :$"

.CODE
MAIN PROC
            MOV  AX, @DATA             ; initialize DS
            MOV  DS, AX

            mov  dx,offset str1
            mov  ah,9
            int  21h
            mov  ah,1
            int  21h
            mov  bl,al
            and  al,11110011b          ; convert
            test al,1
            jz   evenval
            jnz  odd

    evenval:
            mov  dx,offset prompt1
            mov  ah,9
            int  21h
            jmp  label1
    odd:    
            mov  dx, offset prompt2
            mov  ah,9
            int  21h

    label1: 
            mov  dx,offset prompt3
            int  21h
            mov  dl,bl
            add  bl,30h
            mov  ah,2
            int  21h
            xor  dx,dx                 ; 0

                         
    exit:   
            MOV  AH, 4CH               ; return control to DOS
            INT  21H
MAIN ENDP
 END MAIN
