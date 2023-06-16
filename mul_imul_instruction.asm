.model small
.stack 100h
.code
.386
main proc
         mov  ax,1234h
         mov  bx,100h
         mul  bx

    ;_______________
         mov  eax,00128765h
         mov  ecx,10000h
         mul  ecx
    ;_______________
         mov  al,48
         mov  bl,4
         imul bl               ; AX = 00C0h, O
    ;_______________
         mov  eax,4823424
         mov  ebx,-423
         imul ebx              ; EDX:EAX = FFFFFFFF86635D80h, OF=0
    ;______________
         mov  ax,8760h
         mov  bx,100h
         imul bx
    ;______________

         mov  ah,4ch
         int  21h
main endp
end main