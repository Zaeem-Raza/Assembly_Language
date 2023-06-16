;?title: check if bit 4,5,6 are all set?
.model small
.stack 100h
.data
    prompt db 'ALL ARE SET$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov al,01111001b
                 and al,00111000b
                 cmp al,00111000b
                 je  SET
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