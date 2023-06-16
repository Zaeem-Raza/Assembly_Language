.model small
.stack 100h
.data
    wordval  dw 0d
    prompt_1 db 'NOT ZERO$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,wordval
                 or ax,ax
                 jnz NOT_ZERO
                 jmp exit_program
    NOT_ZERO:  
                 mov dx,offset prompt_1
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main