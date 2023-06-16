.model small
.stack 100h
.code
main proc
         mov  ax,7C36h
         mov  dx,9FA6h
         shld dx,ax,4
         shrd dx,ax,8
         mov  ah,4ch
         int  21h
main endp
end main