 TITLE: high to low

 .MODEL SMALL
 .STACK 100H

 .DATA
 string1 equ 0dh,0ah,"Enter A: $"
 string2 equ 0dh,0ah,"Enter B: $"
 string3 equ 0dh,0ah,"Enter C: $"
 string4 equ 0dh,0ah,"Enter choice (1-3) $"
 string5 equ 0dh,0ah,"Invalid Choice $"

 prompt1 db string1
 prompt2 db string2
 prompt3 db string3
 prompt4 db string4
 prompt5 db string5

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

    mov ah,9
    lea dx,prompt1
    int 21H

    mov ah,1
    int 21H

    mov bl,al                    ; bl contains a

    mov ah,9
    lea dx,prompt2
    int 21H

    mov ah,1
    int 21h

    mov bh,al                       ;bh contains b
    

    mov ah,9
    lea dx,prompt3
    int 21H

    mov ah,1
    int 21H

    mov cl,al                       ;cl contains c
   
    
    mov ah,9
    lea dx,prompt4
    int 21H

    mov ah,1
    int 21H

    cmp al,1
    je label1
    cmp al,2
    je label2
    cmp al,3
    je label3
    cmp al,4
    je label4
    jmp exit


    label1:
    sub bl,bh
    jmp exit


   label2:
    inc bl
    neg bl
    jmp exit

   label3:
     add cl,bh
     add cl,bl
     jmp exit

   label4:
     sub bh,bl
     dec bh
     mov bl,bh
    jmp exit
    
    exit:

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
