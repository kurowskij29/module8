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
.global kph

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
SUB sp, sp, #4
STR lr, [sp, #0]
STR r4, [sp, #4]

# save input value
MOV r4, r0

# Calculate distance in km
MOV r1, #161
BL __aeabi_idiv
 
# pop and return
LDR lr, [sp, #0]
#LDR r4, [sp, #4]
ADD sp, sp, #4
MOV pc, lr

.data
#end



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
SUB sp, sp, #8
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
#LDR r4, [sp, #4]
#LDR r5, [sp, #8]
ADD sp, sp, #8
MOV pc, lr

.data
#end 




