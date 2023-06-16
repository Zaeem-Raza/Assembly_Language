.model small
.stack 100h
.data
    prompt_1 db 'LESS THAN EQUAL$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,89d
                 mov bx,189d
                 cmp ax,bx
                 jbe BELOW_EQUAL
                 jmp exit_program
    BELOW_EQUAL:  
                 mov dx,offset prompt_1
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main