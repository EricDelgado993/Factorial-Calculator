@ Eric Delgado
@ ed0050@uah.edu
@ CS309-01 2022
@
@ Filename: Lab4.s
@ Author:   Eric Delgado
@ Purpose:  Calculate and print a factorial of an integer value
@
@ Use these commands to assemble, link, run and debug this program:
@    as -o Lab4.o Lab4.s
@    gcc -o Lab4 Lab4.o
@    ./Lab4 ;echo $?
@    gdb --args ./Lab4

.equ READERROR, 0 @Used to check for scanf read error. 

.global main @ Have to use main because of C library uses. 

main:

@*******************
prompt:
@*******************

@ Ask the user to enter a number.
 
   ldr r0, =strInputPrompt @ Put the address of string into the first parameter
   bl  printf              @ Call the C printf to display input prompt. 

@*******************
get_input:
@*******************

@ Set up r0 with the address of input pattern.
@ scanf puts the input value at the address stored in r1. We are going
@ to use the address for our declared variable in the data section - intInput. 
@ After the call to scanf the input is at the address pointed to by r1 which 
@ in this case will be intInput. 

   ldr r0, =numInputPattern @ Setup to read in one number.
   ldr r1, =intInput        @ load r1 with the address of where the
                            @ input value will be stored. 
   bl  scanf                @ scan the keyboard.

   cmp r0, #READERROR       @ Check for a read error.
   beq readerror            @ Branch to readererror to terminate program.
   ldr r1, =intInput        @ Have to reload r1 because it gets wiped out.
   ldr r1, [r1]             @ Read the contents of intInput and store in r1 so that
                            @ it can be read.
   
   cmp r1, #12              @ Check is input is greater than 12
   bgt readerror            @ Branch to readererror to terminate program.

   ldr r1, =intInput        @ Have to reload r1 because it gets wiped out.
   ldr r1, [r1]             @ Read the contents of intInput and store in r1 so that
                            @ it can be read.

   cmp r1, #1               @ Check is input is less than 1
   blt readerror            @ Branch to readererror to terminate program.
   
   ldr r1, =intInput        @ Have to reload r1 because it gets wiped out.
   ldr r1, [r1]             @ Read the contents of intInput and store in r1 so that
                            @ it can be printed.

   ldr r0, =outputMessage   @ Print message
   bl printf

   ldr r1, =intInput        @ Have to reload r1 because it gets wiped out.
   ldr r4, [r1]             @ Read the contents of intInput and store in r1 so that
                            @ it can be used as flag value

   mov r1, #1               @ Set register value for function print output
   mov r5, #1               @ Set register value for input
   mov r6, #1               @ Set register value for function output

@*******************
factorial:
@*******************
   
   mov r1, r5               @ Set register for input print value

   ldr r0, =val_input       @ Print input
   bl printf

   mul r1, r5, r6           @ Multiply input and output registers store in r1

   mov r6, r1               @ Store r1 value in r6 output value register

   ldr r0, =val_output      @ Print ouput value stored in r1
   bl printf                @ r1 data destroyed
   
   add r5, r5, #1           @ Increment input by 1
   sub r4, r4, #1           @ Decrement flag value by 1

   cmp r4, #0               @ Check if flag value = 0
   bne factorial            @ Continue loop is false
   b myexit                 @ Exit loop if true

@***********
readerror:
@***********
@ Got a read error from the scanf routine.
@ Print error message and terminate program.

   ldr r0, =errorOutput
   bl printf
   b  myexit

@*******************
myexit:
@*******************
@ End of my code. Force the exit and return control to OS

   mov r7, #0x01 @ SVC call to exit
   svc 0         @ Make the system call. 

.data

@ Declare the strings and data needed

.balign 4
strInputPrompt: .asciz "This program will print the factorial of the integers from 1 to a\nnumber you enter.\nPlease enter an integer number from 1 to 12.\n\n"

.balign 4
outputMessage: .asciz "You entered %d.\n\nFollowing is the number and the product of the integers 1 to n\n\nNumber           n!\n"

.balign 4
errorOutput: .asciz "ERROR: Not a valid input\n"

.balign 4
val_input: .asciz "%d                "

.balign 4
val_output: .asciz "%d\n"

@ Format pattern for scanf call.

.balign 4
numInputPattern: .asciz "%d"  @ integer format for read. 

.balign 4
strInputPattern: .asciz "%[^\n]" @ Used to clear the input buffer for invalid input. 

.balign 4
strInputError: .skip 100*4  @ User to clear the input buffer for invalid input. 

.balign 4
intInput: .word 0   @ Location used to store the user input. 

@ End of code and end of file. Leave a blank line after this.
