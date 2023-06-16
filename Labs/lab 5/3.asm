 ;?TITLE:

 .MODEL SMALL
 .STACK 100H

.DATA
     prompt1 db 0dh,0ah,"Give string: $"
     prompt2 db 0dh,0ah,"Palindrome: $"
     prompt3 db 0dh,0ah," not Palindrome: $"
     strArr  db 10 dup (0)

.CODE
MAIN PROC
                   MOV  AX, @DATA             ; initialize DS
                   MOV  DS, AX

                   xor  cx,cx
                 ;  inc cx
                   mov  dx,offset prompt1
                   mov  ah,9
                   int  21h
                   mov  ah,1
                   mov  si,0

     L1:           
                   cmp  al,0dh
                   je   L2
                   push AX
                   mov  strArr[si],al
                   inc  cx
                   inc si
                   int  21h
                   jmp  L1

                   mov  si,0
               ;     pop bx
     L2:           

                   pop  bx
                   cmp  bx,[si]
                   jne  notPalindrome
                   inc si
                   loop L2
                   jmp  Palindrome


     Palindrome:   
                   mov  dx,offset prompt2
                   mov  ah,9
                   int  21h
     notPalindrome:
                   mov  dx,offset prompt3
                   mov  ah,9
                   int  21h
                   jmp  exit
     exit:         
                   MOV  AH, 4CH               ; return control to DOS
                   INT  21H
MAIN ENDP
     ;description
line PROC
                   mov  ah,2
                   mov  dl,0dh
                   int  21h
                   mov  dl,0ah
                   int  21h
                   ret
line ENDP
 END MAIN
