# FileName: libConversions.s
# Author: Jack Kurowski
# Date: 10/17/2023
# Purpose: Functions for conversions
#
# Functions:
# miles2kilometers
#
# 
.global miles2kilometers
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
miles2kilometers:

# push
SUB sp, #4
STR lr, [sp, #0]
STR r4, [sp, #4]


# save input value
MOV  // divide

 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
ADD sp, #8
MOV pc, lr

.data
#end

.global kph
# Function: kph
# Purpose: calculate speed in km / hr 
# from input integers of hours and miles
# 
# Input: 
#    r0 - time in hours (integer)
#    r1 - distance in miles
# 
#
# Output: r0 - pointer to string that contains
# the converted value
.text
miles2kilometers:

# push
SUB sp, #8
STR lr, [sp, #0]
STR r4, r0
MOV r1, #161 // multiplication factor

# convert to km
MUL r0, r4, r1 // multiply by 161
MOV r1, #100 // set divisor
BL __aeabi_idiv // divide

 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
ADD sp, #8
MOV pc, lr

.data
#end

.global kph
# Function: kph
# Purpose: calculate speed in km / hr 
# from input integers of hours and miles
# 
# Input: 
#    r0 - time in hours (integer)
#    r1 - distance in miles
# 
#
# Output: r0 - pointer to string that contains
# the converted value
.text
kph:
 
# push
SUB sp, #8
STR lr, [sp, #0]
STR r4, [sp, #4]
STR r5, [sp, #8]


# save input value
MOV r4, r0 // hours traveled
MOV r5, r1 // miles traveled
MOV r0, r5 // put miles in r0 for func call

# convert to km
BL miles2kilometers // miles in r0, so call func

# divide km by hrs to get speed
MOV r1, r4 // put hours traveled into r1
BL __aeabi_idiv // km in r0, hours in r1
 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
LDR r5, [sp, #8]
ADD sp, #8
MOV pc, lr

.data
#end 




