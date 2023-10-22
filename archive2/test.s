#
# Program name: template.s
# Author: Jack Kurowski
# Date:9/17/2023
# Purpose: This program outputs what a user
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
ldr r0, =input1
ldr r1, =num1
ldr r2, =name1
bl scanf

# Printing The Message
ldr r0, =format1
ldr r1, =num1
ldr r1, [r1, #0]
ldr r2, =name1
bl  printf

# Return to the OS
LDR lr, [sp, #0]
ADD sp, sp, #4
MOV pc, lr

.data
num1: .word 0
prompt1: .asciz "Enter your age\n"
input1: .asciz "%d %s"
format1: .asciz "Your age is %d and name is %s \n"
name1: .asciz ""

