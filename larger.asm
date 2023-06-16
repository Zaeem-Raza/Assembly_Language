.model small
.stack 100h
.data
    prompt_1 db 'LARGER$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,289d
                 mov bx,189d
                 cmp ax,bx
                 ja ABOVE
                 jmp exit_program
    ABOVE:  
                 mov dx,offset prompt_1
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main