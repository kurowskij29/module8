#
# Program name: calcSpeed.s
# Author: Jack Kurowski
# Date:10/17/2023
# Purpose: This program converts a user input hours and miles to kph
.text
.global main
main:
# Save return to os on stack
SUB sp, sp, #4
STR lr, [sp, #0]

# Print prompt and scan input
LDR r0, =prompt // prompt for input
BL printf
LDR r0, =formatin // set scanf format
LDR r1, =hours //set input 1 to 0 by default 
LDR r2, =miles // set input 2 to 0 by default
BL scanf


#Calculate speed
LDR r0, =hours
LDR r1, =miles
LDR r0, [r0] // put hours in r0 for kph func
LDR r1, [r1] // put miles in r1 ^^
BL kph
MOV r1, r0 // put speed in r1 for printf


#Print result
LDR r0, =output // put output message in r0 for printf
BL printf


# Return to the OS
LDR lr, [sp, #0]
ADD sp, sp, #4
MOV pc, lr

.data
prompt: .asciz "Please enter a time in hours and a distance in miles, separated by a space:\n"
formatin: .asciz "%d %d"
hours: .word 0
miles: .word 0
output: .asciz "\nThe speed in kph is  %d\n"



