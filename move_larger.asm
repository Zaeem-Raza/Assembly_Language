.model small
.stack 100h
.data
    larger dw 0h
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,89d
                 mov bx,189d
                 cmp ax,bx
                 jbe BELOW_EQUAL
                 mov larger , ax
                 jmp exit_program
    BELOW_EQUAL:  
                 mov larger , bx
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main