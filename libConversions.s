# FileName: libConversions.s
# Author: Jack Kurowski
# Date: 10/17/2023
# Purpose: Functions for conversions
#
# Functions:
# miles2kilometers
# kph
# inches2ft
# c2f
#
# 
.global miles2kilometers
.global kph
.global inches2ft
.global c2f



####################################################################
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
SUB sp, sp, #8
STR lr, [sp, #0]
STR r4, [sp, #4]

# save input value
MOV r4, r0

# Calculate distance in km
MOV r1, #161    
MUL r0, r0, r1   // mult by 161
MOV r1, #100  
BL __aeabi_idiv   // div by 100 for km
 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
ADD sp, sp, #8
MOV pc, lr

.data
#end


##############################################################
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
SUB sp, sp, #12
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
ADD sp, sp, #12
MOV pc, lr

.data
#end 

###############################################################
# Function: inches2ft
# Purpose: convert an integer from inches to feet
#
#
# Input: 
#    r0 - value in inches
# 
#
# Output: r0 - pointer to string that contains
# the converted value
.text
inches2ft:

# push
SUB sp, sp, #8
STR lr, [sp, #0]
STR r4, [sp, #4]

# save input value
MOV r4, r0

# Calculate length in ft
MOV r1, #12  // put 12 in deniminator
BL __aeabi_idiv // divide in by 12 to get feet
 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
ADD sp, sp, #8
MOV pc, lr

.data
#end




##############################################################
# Function: c2f
# Purpose: calculate temperature in F from input in C
# 
# Input: 
#    r0 - temp in C
# 
#
# Output: r0 - pointer to string that contains
# the converted value
.text
c2f:
 
# push
SUB sp, sp, #8
STR lr, [sp, #0]
STR r4, [sp, #4]

#Convert to fahrenheit
mov r4, #9      // constant to mult
mul r0, r0, r4  // multiply C by 9
mov r1, #5     // second arg to divide must be 5
bl __aeabi_idiv // then div by 5
add r0, r0, #32  // last add 32
 
# pop and return
LDR lr, [sp, #0]
LDR r4, [sp, #4]
ADD sp, sp, #8
MOV pc, lr

.data
#end 
