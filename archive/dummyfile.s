# FileName: libConversions.s
# Author: Jack Kurowski
# Date: 10/17/2023
# Purpose: Functions for conversions
#
# Functions:
# miles2kilometers
#
# 
.global printScaledInt
# Function: miles2kilometers
# Purpose: convert an integer from miles
# to kilometers with conversion ratio
# of 1.61
#
# Input: 
#    r0 - value in miles
# 
#
# Output: r0 - pointer to string that contains
# the converted value
.text
PrintScaledInt:

 # push
.fixme SUB sp, #4
 STR lr, [sp, #0]
 STR r4, [sp, #4]
 STR r5, [sp, #8]


# save input value
 MOV r4, r0
 MOV r1, #161 // multiplication factor

# convert to km
MUL r0, r4, r1 // multiply by 161
MOV r1, #100 // set divisor
bl __aeabi_idiv // divide



 # get whole part and save in r7
 bl __aeabi_idiv // r0/r1, result in r0
 MOV r6, r0
 #get decimal part and save in r7
 MUL r7, r5, r6
 SUB r7, r4, r7
 # print the whole part
 LDR r0, = __PSI_format
 MOV r1, r6
 bl printf
 # print the dot
 LDR r0, = __PSI_dot
 bl printf
 # print the decimal part
 LDR r0, = __PSI_format
 MOV r1, r7
 bl printf


 # pop and return
 .fixme LDR lr, [sp, #0]
 ADD sp, #4
 MOV pc, lr

.data
 __PSI_format: .asciz "%d"
 __PSI_dot: .asciz "."
#end printScaledInt

