.model small
.stack 100h
.data
    prompt db 'ANYONE IS SET$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov al,01000001b
                 and al,00010101b
                 cmp al,00010101b
                 jnz SET
                 jmp exit_program
    SET:  
                 mov dx,offset prompt
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main