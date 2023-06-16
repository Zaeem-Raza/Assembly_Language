Title: Snake Xenzia Project

Subject: Computer Organization and Assembly Language

Instructor: Sir Ashraf Ali

Group Members:

1. Malaika Farid (BSCSF21M017)
2. Zaeem Raza    (BSCSF21M022)
3. Asad Naeem    (BSCSF21M030)
4. Farzand Ali   (BSCSF21M042)

Date: 7th May 2023

## Description

a)The given code is a simple implementation of the classic game "Snake Xenzia" using assembly language. The game is designed to be run in the 80x25 text mode.

b)The code begins by setting up the necessary data and constants. It defines equates for various dimensions and positions of the game screen. It also includes ASCII art for the game title and snake pattern, as well as messages for instructions, game over, and quitting.

c)The main procedure is the entry point of the program. It starts by displaying a welcome message and instructions on the screen. The player is prompted to press any key to start the game. After clearing the screen, the main game loop begins.

d)Within the main loop, several procedures are called. The delay procedure introduces a time delay to control the speed of the game. The shiftsnake procedure handles the movement of the snake based on user input. The keyboardfunctions procedure reads the player's input and determines the snake's direction accordingly. The fruitgeneration procedure generates fruits at random locations on the screen for the snake to eat.

e)The draw procedure handles the rendering of the game screen. It displays the snake segments and the fruit. It also updates the score on the screen.

f)The game continues to loop until either the snake dies or the player chooses to quit. If the snake dies, a game over message is displayed. If the player chooses to quit, a quitting message is displayed.
