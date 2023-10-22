#
# Program name: testConverts.s
# Author: Jack Kurowski
# Date:10/22/2023
# Purpose: This program tests conversion for c2f and inches2ft
#
.text
.global main
main:

# Save return to os on stack
SUB sp, sp, #4
STR lr, [sp, #0]

# Prompt For An Input
ldr r0, =prompt1
bl  printf

#Scanf
ldr r0, =input1 //input format for 2 doubles
ldr r1, =tempC //save 1st input to tempC 
ldr r2, =snowIn // save 2nd input to snowIn
bl scanf

#Convert C to f
ldr r0, =tempC //load tempC into r0
ldr r0, [r0, #0] //load value of r0
bl c2f // call c2f on r0
mov r4, r0 // save temp in F in r4

#Convert in to ft 
ldr r0, = snowIn // load snowIn in r0
ldr r0, [r0, #0] // load value
bl inches2ft // call inches2ft on r0
mov r5, r0 // save snowfall in feet in r5


# Printing The Message
ldr r0, =format1
mov r1, r4  // put temp in r1
mov r2, r5  // put snowfall in r2
bl  printf

# Return to the OS
LDR lr, [sp, #0]
ADD sp, sp, #4
MOV pc, lr

.data
tempC: .word 0
snowIn: .word 0
tempF: .word 0
snowC: .word 0
prompt1: .asciz "Enter a temperature in C and annual snowfal in inches\n"
input1: .asciz "%d %d"
format1: .asciz "The temperature in F is %d and annual snowfall in feet is %d \n"


