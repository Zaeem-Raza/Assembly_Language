 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
    prompt1 db 0dh,0ah,"Enter first number: $"
    prompt2 db 0dh,0ah,"Enter Second number: $"
    prompt3 db 0dh,0ah,"Enter operation: $"
    prompt4 db 0dh,0ah,"Invalid operands: $"
    prompt5 db 0dh,0ah,"Answer: $"

.CODE
MAIN PROC
                   MOV AX, @DATA            ; initialize DS
                   MOV DS, AX

                   mov dx,offset prompt1
                   mov ah,9
                   int 21H

                   mov ah,1
                   int 21h

                   mov bl,al
                   sub bl,30h
                   mov dx,offset prompt2
                   mov ah,9
                   int 21h

                   mov ah,1
                   int 21h

                   mov bh,al
                   sub bh,30h
                   mov dx,offset prompt3
                   mov ah,9
                   int 21h
                   mov ah,1
                   int 21h

                   cmp al,'+'
                   je  Addition
                   cmp al,'-'
                   je  Subtraction
                   cmp al,'*'
                   je  Multiplication
                   cmp al,'/'
                   je  Division
                   jmp Invalid
    Addition:      
                   add bl,bh
                   jmp printNum
                   jmp exit
       
    Subtraction:   
                   cmp bl,bh
                   jl  Invalid
                   sub bl,bh
                   jmp printNum
  
    Multiplication:
                   mov al,bh
                   mul bl
                   mov bx,ax
                   mov dx,offset prompt5
                   mov ah,9
                   int 21h
                   mov dx,bx
                   add dx,30h
                   mov ah,2
                   int 21h
                   jmp exit
    Division:      
                   cmp bl,bh
                   jl Invalid
                   mov ax,0
                   mov al,bl
                   mov bl,bh
                   div bl
                   mov bx,ax
                   mov dx,offset prompt5
                   mov ah,9
                   int 21h
                   mov dx,bx
                   add dx,30h
                   mov ah,2h
                   int 21h
                   jmp exit
    printNum:      
                   mov dx,offset prompt5
                   mov ah,9
                   int 21h
                   mov dl,bl
                   add dl,30h
                   mov ah,2
                   int 21h
                   jmp exit
    Invalid:       
                   mov dx,offset prompt4
                   mov ah,9
                   int 21h
                         
    exit:          
                   MOV AH, 4CH              ; return control to DOS
                   INT 21H
MAIN ENDP
 END MAIN
