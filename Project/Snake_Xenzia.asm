;*******************************************************************************************************************
;                                      SNAKE XENZIA                                                                *
; Group Members:                                                                                                   *     
;                       1- Malika Farid       BCSF21M017                                                           *
;                       2- Zaeem Raza         BCSF21M022                                                           *
;                       3- Asad Naeem         BCSF21M030                                                           *
;                       4- Farzand Ali        BCSF21M042                                                           *
;                                                                                                                  *
;*******************************************************************************************************************

; equ constants
left equ 0          ;  leftmost column of the box
top equ 2           ;  topmost row of the box
row equ 20          ;  number of rows in the box
col equ 70          ;  number of columns in the box
right equ left+col  ;  rightmost column of the box
bottom equ top+row  ;  bottommost row of the box

.model small
.data

    snake_pattern DB 0DH,0AH,'        /^\/^\  ',0
                  DB 0DH,0AH,'       |__|  O|',0
                  DB 0DH,0AH,'      _/~     \_/ \',0
                  DB 0DH,0AH,'\____|__________/  \',0
                  DB 0DH,0AH,'      \_______      \',0
                  DB 0DH,0AH,'               `\     \                    \',0
                  DB 0DH,0AH,'                 |     |                    \\',0
                  DB 0DH,0AH,'               /      /                      \\',0
                  DB 0DH,0AH,'              /     /                         \\',0
                  DB 0DH,0AH,'            /      /                           \ \',0
                  DB 0DH,0AH,'           /     /                              \  \',0
                  DB 0DH,0AH,'          /     /             _----_             \   \',0
                  DB 0DH,0AH,'         /     /           _-~      ~-_           |   |',0
                  DB 0DH,0AH,'        (      (        _-~    _--_    ~-_      __/   |',0
                  DB 0DH,0AH,'         \      ~-____-~    _-~    ~-_    ~-_-~      /',0
                  DB 0DH,0AH,'          ~-_           _-~          ~-_        _-~ /',0
                  DB 0DH,0AH,'              ~--______-~                ~-___-~___/$'
    msg           db 'Welcome to the snake game!!',0
    instructions  db 0AH,0DH,0AH,0DH,"Instructions:",0AH,0DH,"      Use w,a, s, and d to control your snake",0AH,0DH,"      Use q anytime to quit",0DH,0AH, "      Press any key to continue$"
    quitmsg       db "Thanks for playing! hope you enjoyed","$"
    gameovermsg   db 'OOPS!! your snake died!',0
    scoremsg      db "Score: ",0
    head          db '^',10,10                                                                                                                                                                    ;0 IS ASCII TO END STRING
    body          db '*',10,11, 3*100 DUP(0)                                                                                                                                                       ; maximum body of the snake                                                                                                                                               ;array  of 45 0's 11(0BH) is used to print string
    segmentcount  db 1
    fruitactive   db 1
    fruitx        db 8
    fruity        db 8
    gameover      db 0
    quit          db 0
    delaytime     db 5
    snake_xenzia  DB 0DH,0AH,'                +------------------------+',0
                  DB 0DH,0AH,'                |      SNAKE XENZIA      |',0
                  DB 0DH,0AH,'                +------------------------+$',0
.stack
          dw 128  dup(0)
.code
main proc
                           mov  ax, @data
                           mov  ds, ax
	
                           MOV  AX, 0B800H                ; load the address of the video memory buffer into AX
                           MOV  ES, AX                    ; set the ES segment register to the same value as AX
	   ;clearing the screen
                           MOV  AX, 0003H                 ; set video display mode to 80x25 text mode with 16 colors
                           INT  10H                       ; call BIOS interrupt 10H to set the video display mode
	
                           mov  ah, 09H
                           LEA  DX,snake_xenzia
                           int  21h
                           lea  dx,snake_pattern
                           int  21h
                           lea  dx, instructions
                           int  21h
                           
                           mov  ah, 07h                   ; press any key to continue
                           int  21h
                           mov  ax, 0003H                 ;for clearing the screen
                           int  10H
                           call printbox
    
    mainloop:              
                           call delay
                           lea  bx, msg
                           mov  dx, 0000
                           call writestringat
                           call shiftsnake
                           cmp  gameover,1
                           je   gameover_mainloop
    
                           call keyboardfunctions
                           cmp  quit, 1
                           je   quitpressed_mainloop
                           call fruitgeneration
                           call draw
    
    ;TODO: check gameover and quit
    
                           jmp  mainloop
    
    gameover_mainloop:     
                           mov  ax, 0003H
                           int  10H
                           mov  delaytime, 10
                           mov  dx, 0619H
                           lea  bx, gameovermsg
                           call writestringat
                           call delay
                           jmp  quit_mainloop
    
    quitpressed_mainloop:  
                           mov  ax, 0003H
                           int  10H
                           mov  delaytime, 100
                           mov  dx, 0000H
                           lea  bx, quitmsg
                           call writestringat
                           call delay
                           jmp  quit_mainloop
    quit_mainloop:         
    ;first clear screen
                           mov  ax, 0003H
                           int  10h
                           mov  ax, 4c00h
                           int  21h
delay proc
    
    ;this procedure delays the program for a certain amount of time
    ;the delay time is stored in the delaytime variable
    ;the delay time is in ticks
                           mov  ah, 00                    ; this indicates that we want to get the current system time using the 1A interrupt
                           int  1Ah                       ;it stores the current system time in the DX register
                           mov  bx, dx
    
    jmp_delay:             
                           int  1Ah
                           sub  dx, bx
    ;there are about 18 ticks in a second, 10 ticks are about enough
                           cmp  dl, delaytime
                           jl   jmp_delay
                           ret
    
delay endp    


fruitgeneration proc
    ; this procedure generates a fruit at a random location if the fruit is not active at the moment
                           mov  ch, fruity
                           mov  cl, fruitx
    regenerate:            
    
                           cmp  fruitactive, 1
                           je   ret_fruitactive
                           mov  ah, 00                    ; this indicates that we want to get the current system time using the 1A interrupt
                           int  1Ah                       ;it stores the current system time in the DX register
    ;dx contains the ticks
                           push dx
                           mov  ax, dx
                           xor  dx, dx
                           xor  bh, bh
                           mov  bl, row
                           dec  bl
                           div  bx
                           mov  fruity, dl                ;fruitx and fruity are the coordinates of the fruit
                           inc  fruity
    
                           pop  ax
                           mov  bl, col
                           dec  dl
                           xor  bh, bh
                           xor  dx, dx
                           div  bx
                           mov  fruitx, dl
                           inc  fruitx
    
                           cmp  fruitx, cl
                           jne  nevermind
                           cmp  fruity, ch
                           jne  nevermind
                           jmp  regenerate
    nevermind:             
                           mov  al, fruitx
                           ror  al,1                      ;rotate right by 1 bit
                           jc   regenerate                ; if carry is set, regenerate
    
                           add  fruity, top
                           add  fruitx, left
    ; compare fruitx and fruity with the snake
                           mov  dh, fruity
                           mov  dl, fruitx
                           call readcharat
                           cmp  bl, '*'
                           je   regenerate
                           cmp  bl, '^'
                           je   regenerate
                           cmp  bl, '<'
                           je   regenerate
                           cmp  bl, '>'
                           je   regenerate
                           cmp  bl, 'v'
                           je   regenerate
    
    ret_fruitactive:       
                           ret
fruitgeneration endp


dispdigit proc
    ; this procedure displays a digit in the dl register
                           add  dl, '0'
                           mov  ah, 02H
                           int  21H
                           ret
dispdigit endp
   

dispnum proc
    ;this procedure displays a number in the ax register
    ;it uses the remainder and quotient method
    ;it uses the dispdigit procedure to display each digit
                           test ax,ax
                           jz   retz
                           xor  dx, dx
    ;ax contains the number to be displayed
                           mov  bx,10
                           div  bx
    ;dispnum ax first.
                           push dx
                           call dispnum
                           pop  dx
                           call dispdigit
                           ret
    retz:                  
                           mov  ah, 02
                           ret
dispnum endp

    ;sets the cursor position, ax and bx used, dh=row, dl = column
    ;preserves other registers
setcursorpos proc
                           mov  ah, 02H
                           push bx
                           mov  bh, 0
                           int  10h                       ; call BIOS interrupt to set cursor position
                           pop  bx                        ; restore BX from the stack
                           ret
setcursorpos endp


draw proc
                           lea  bx, scoremsg
                           mov  dx, 0109                  ; Set cursor position to row 1, column 9
                           call writestringat
    
                           add  dx, 7                     ; Move the cursor position 7 columns to the right
                           call setcursorpos
                           mov  al, segmentcount
                           dec  al
                           xor  ah, ah                    ; Set the upper byte of "ax" to 0
                           call dispnum
        
                           lea  si, head                  ; Load the effective address of "head" into "si"
    draw_loop:             
                           mov  bl, ds:[si]               ; Move the value at memory address "si" into "bl"
                           test bl, bl
                           jz   out_draw
                           mov  dx, ds:[si+1]             ; Move the value at memory address "si+1" into "dx"
                           call writecharat
                           add  si,3                      ; Add 3 to "si" to move to the next segment of the snake
                           jmp  draw_loop
    
    out_draw:              
                           mov  bl, 'o'
                           mov  dh, fruity
                           mov  dl, fruitx
                           call writecharat
                           mov  fruitactive, 1            ; Set the "fruitactive" flag to 1
    
                           ret
draw endp

    ;dl contains the ascii character if keypressed, else dl contains 0
    ;uses dx and ax, preserves other registers
readchar proc
                           mov  ah, 01H
    ; Call BIOS interrupt 16H to read a keystroke from the keyboard input buffer
                           int  16H
    ; Check if a key was pressed by looking at the zero flag
    ; If it is set, no key was pressed, so skip to the "xor dl, dl" instruction
                           jnz  keybdpressed
    ; If no key was pressed, set DL to 0 and return
                           xor  dl, dl
                           ret
    keybdpressed:          
    ; If a key was pressed, set AH to 00H to indicate the "get keystroke" function
                           mov  ah, 00H
    ; Call BIOS interrupt 16H again to get the ASCII code of the pressed key
                           int  16H
                           mov  dl,al
                           ret
readchar endp
         
         
keyboardfunctions proc
                           call readchar
                           cmp  dl, 0
                           je   next_14

    ; compare the value of DL with 'w'
                           cmp  dl, 'w'
                           jne  next_11
                           cmp  head, 'v'
                           je   next_14
                           mov  head, '^'
                           ret
    next_11:               
                           cmp  dl, 's'
                           jne  next_12
    ; compare the value of head with '^'
                           cmp  head, '^'
                           je   next_14
                           mov  head, 'v'
                           ret
    next_12:               
                           cmp  dl, 'a'
                           jne  next_13
    ; compare the value of head with '>'
                           cmp  head, '>'
                           je   next_14
    ; move '<' to head if head is not '>'
                           mov  head, '<'
                           ret
    next_13:               
                           cmp  dl, 'd'
                           jne  next_14
    ; compare the value of head with '<'
                           cmp  head, '<'
    ; jump to next_14 if head is '<'
                           je   next_14
    ; move '>' to head if head is not '<'
                           mov  head,'>'
    next_14:               
                           cmp  dl, 'q'
                           je   quit_keyboardfunctions
                           ret
    quit_keyboardfunctions:
                           inc  quit
                           ret
keyboardfunctions endp
                    
shiftsnake proc
                           mov  bx, offset head

    ; Determine where the head should go next and preserve the head
                           xor  ax, ax
                           mov  al, [bx]
                           push ax
                           inc  bx
                           mov  ax, [bx]                  ; Move the X-coordinate of the head to AX
                           inc  bx                        ; Move to the next segment of the snake
                           inc  bx
                           xor  cx, cx
    l:                     
                           mov  si, [bx]                  ; Move the X-coordinate of the current segment to SI
                           test si, [bx]                  ; Test whether the current segment is empty
                           jz   outside
                           inc  cx
                           inc  bx                        ; Move to the next segment of the snake
                           mov  dx,[bx]                   ; Move the Y-coordinate of the current segment to DX
                           mov  [bx], ax                  ; Move the X-coordinate of the head to the current segment
                           mov  ax,dx
                           inc  bx                        ; Move to the next segment of the snake
                           inc  bx
                           jmp  l
    
    outside:               

    ; The snake has been shifted, now shift the head in its proper direction and then clear the last segment.
    ; But don't clear the last segment if the snake has eaten the fruit.

                           pop  ax

                           push dx

                           lea  bx, head
                           inc  bx                        ; Move to the next segment of the snake
                           mov  dx, [bx]                  ; Move the coordinates of the last segment to DX

    ; check if the snake has eaten the fruit
                           cmp  al, '<'
                           jne  next_1
                           dec  dl
                           dec  dl
                           jmp  done_checking_the_head
    next_1:                

                           cmp  al, '>'
                           jne  next_2
                           inc  dl
                           inc  dl
                           jmp  done_checking_the_head
    
    next_2:                
                           cmp  al, '^'
                           jne  next_3
                           dec  dh
                   
    
                           jmp  done_checking_the_head
    
    next_3:                
  
                           inc  dh                        ; Move the head up by decrementing the Y-coordinate of the head
    
    done_checking_the_head:
    ; This instruction stores the new position of the snake's head in the memory
    ; location pointed to by register bx.
                           mov  [bx],dx
    
    ; This instruction reads the character at the new position of the snake's head

                           call readcharat
    ; bl contains the result
    
 
    ; check if the snake has eaten the fruit
                           cmp  bl, 'o'
                           je   i_ate_fruit
    
    ; If the snake did not eat a fruit, then this code clears the last segment of the snake.
  
                           mov  cx, dx
                           pop  dx
                           cmp  bl, '*'                   ; If the character at the old head position is '*', the snake has bitten itself.
                           je   game_over
                           mov  bl, 0
                           call writecharat
                           mov  dx, cx                    ; Restore the new head position to dx.
    
    ;check whether the snake is within the boundary
                           cmp  dh, top
                           je   game_over
                           cmp  dh, bottom
                           je   game_over
                           cmp  dl,left
                           je   game_over
                           cmp  dl, right
                           je   game_over
                           ret

    
    game_over:             
    ; increment the quit variable
                           inc  gameover
   
                           ret
    i_ate_fruit:           
  
    ; This code adds a new segment to the snake and updates the fruit on the screen.
                           mov  al, segmentcount
                           xor  ah, ah
                           lea  bx, body
                           mov  cx, 3                     ; Set cx to three (the size of each segment).
                           mul  cx                        ; Multiply the number of segments by three to get the offset of the last segment.
                           pop  dx
                           add  bx, ax
                           mov  byte ptr ds:[bx], '*'     ; Set the character at the last segment to '*'.
                           mov  [bx+1], dx                ; Store the new head position in the last segment.
                           inc  segmentcount
                           mov  dh, fruity
                           mov  dl, fruitx
                           mov  bl, 0
                           call writecharat
                           mov  fruitactive, 0
                           ret
shiftsnake endp
         
    ;Printbox
printbox proc
    ; set the top, bottom, left, and right coordinates of the box
                           mov  dh, top
                           mov  dl, left
                           mov  cx, col
    ; Set the character to use for drawing the box
                           mov  bl, '"'
    l1:                    
                           call writecharat
    ; Move to the next column
                           inc  dl
                           loop l1
    
    ; Set the loop counter to the number of rows to draw
                           mov  cx, row
    l2:                    
    ; Write the character at the current position
                           call writecharat
    ; Move to the next row
                           inc  dh
                           loop l2
    
                           mov  cx, col
    l3:                    
                           call writecharat
    ; Move to the previous column
                           dec  dl
    ; Decrement the loop counter
                           loop l3

                           mov  cx, row
    l4:                    
                           call writecharat
                           dec  dh
                           loop l4
                           ret
printbox endp
                     
    ;dx contains row, col
    ;bl contains the character to write
    ;uses di.
writecharat proc
    ; Procedure to write a character at a given position in the console window
    ; Input: DX -> Row and Column
    ;        BX -> Character to be written
    ; Output: Character is written at the specified location on the console window
                           push dx

    ; Shift the higher byte of DX right by 8 bits to get the row number
                           mov  ax, dx
                           and  ax, 0FF00H
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           shr  ax, 1
                           push bx
    ; Set BH to 160, which is the number of columns in the console window
                           mov  bh, 160
                           mul  bh
    ; Retrieve the value of BX from the stack and multiply it by 2 to get the attribute and character values
                           pop  bx
                           and  dx, 0FFH
                           shl  dx, 1

    ; Add the attribute and character values to the row offset to get the offset of the character on the console window
                           add  ax, dx

    ; Write the character to the console window at the specified location
                           mov  di, ax
                           mov  es:[di], bl
                           pop  dx
                           Ret
Writecharat endp
   
  
readcharat proc
                           push dx
                           mov  ax, dx
                           and  ax, 0FF00H                ; Perform bitwise AND operation with 0xFF00 and store the result in AX
    ; Shift the bits in AX to right by 8 positions one by one
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           push bx
                           mov  bh, 160                   ; Move the value 160 to the BH register
                           mul  bh                        ; Multiply the values in AH and BH register and store the result in AX
                           pop  bx
                           and  dx, 0FFH                  ; Perform bitwise AND operation with 0xFF and store the result in DX
                           shl  dx,1                      ; Shift the bits in DX to left by 1 position
                           add  ax, dx
                           mov  di, ax
                           mov  bl,es:[di]                ; Move the value at the memory location pointed by DI into the BL register
                           pop  dx
                           ret
readcharat endp
    ;dx contains row, col
    ;bx contains the offset of the string
writestringat proc
                           push dx
                           mov  ax, dx
                           and  ax, 0FF00H                ; clear the lower 8 bits of AX
    ; shift the value in AX right by 8 bits
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
                           shr  ax,1
    
                           push bx
                           mov  bh, 160                   ; move the value 160 into the BH register
                           mul  bh
                           pop  bx
                           and  dx, 0FFH                  ; clear the high byte of DX
                           shl  dx,1                      ; shift the value in DX left by 1 bit
                           add  ax, dx
                           mov  di, ax
    
    loop_writestringat:    
    
                           mov  al, [bx]                  ; move the next character of the string (located at the address in BX) into the AL register
                           test al, al                    ; test if the value in AL is zero (i.e., the end of the string has been reached)
                           jz   exit_writestringat
                           mov  es:[di], al               ; write the character in AL to the video memory location pointed to by DI
                           inc  di
                           inc  di                        ; increment DI again because each character takes up two bytes of memory on a VGA display
                           inc  bx                        ; increment BX to point to the next character of the string
                           jmp  loop_writestringat
    
    exit_writestringat:    
                           pop  dx
                           ret
    
writestringat endp
    
main endp
          
end main