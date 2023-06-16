.model small
.stack 100h
.data
    wordval  db 10000000b
    prompt_1 db 'VALUE NOT FOUND$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov al,wordval
                 test al,00001110b
                 jz VALUE_NOT_FOUND
                 jmp exit_program
    VALUE_NOT_FOUND:  
                 mov dx,offset prompt_1
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main