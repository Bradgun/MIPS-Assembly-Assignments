#Bradley Gunawan 11/4/2024
#CS2640 12PM
#November 1, 2024
# array = [1, 2, 3, 4, 5] (y)
#print out array elements to user
# include: display message, main label (y), loop label, exit label, element loop counter
# use registers: $s0 for base address, $t0 for current array element

.data
array: .word 1, 2, 3, 4, 5
curEl: .asciiz "\nCurrent Element: "
displayMessage: .asciiz "Here are your array elements: \n"
arraySize: .word 5 #size of array

.text
main:
	#print displayMessage to user
	li $v0, 4
	la $a0, displayMessage
	syscall
	
	la $s0, array #loads base address of 'array' into $s0
	li $t1, 0 #initialize loop counter to 0
	
	lw $t2, arraySize #load arraySize

loop:	

	bge $t1, $t2, exit #check if we reached end of array
	
	#print out message for element
	li $v0, 4
	la $a0, curEl
	syscall
	
	#load current element from array to $t0
	lw $t0, 0($s0)
	
	#print out element
	li $v0, 1
	move $a0, $t0
	syscall
	
	add $s0, $s0, 4 #incrememnt offset 4 bytes
	
	add $t1, $t1, 1 #increment loop counter
	
	#repeat loop
	j loop
	
	
exit:
	#exit the program
	li $v0, 10
	syscall
	
	
