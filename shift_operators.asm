.model small
.stack 100h
.code
main proc
         mov al,6Bh ; 
         shr al,1 
         shl al,3
         mov al,8Ch
         sar al,1
         sar al,3
         mov ah,4ch
         int 21h
main endp
end main