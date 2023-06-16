.model small
.stack 100h
.data
    prompt db 'EVEN PARITY$'
.code
main proc
                 mov ax,@data
                 mov ds,ax
                 mov ax,0
                 mov al,01001110b
                 and al,1
                 jp EVEN_PARITY
                 jmp exit_program
    EVEN_PARITY:  
                 mov dx,offset prompt
                 mov ah,9
                 int 21h
                 jmp exit_program

    exit_program:
                 mov ah,4ch
                 int 21h
main endp
end main