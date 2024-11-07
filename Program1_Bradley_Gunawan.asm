#Name: Bradley Gunawan
#11/6/2024
#Github link: https://github.com/Bradgun/MIPS-Assembly-Assignments
#Task 1: User input and output
	#get two int valeus from the user
	#two user values should be held in $s0 and $s1
	#output the use inputs in "Run I/O section back to the user
	
#Task 2: Arithmetic Operation Practice
	#add two values
	#subtract two values
	#multiply two values
	#divide two values
	
#Task 3: Conditions
	#check if two user inputs are equal to each other and output if they're the same
	#check if two user inputs are different and output if they're different

.data
#task 1
msg1: .asciiz "Enter the first integer: "
msg2: .asciiz "Enter the second integer: "
output1: .asciiz "\nThe first integer is: "
output2: .asciiz "\nThe second integer is: "

#task 2
add_int: .asciiz "\nThe sum of your two inputs: "
sub_int: .asciiz "\nThe difference of your two inputs: "
mult_int: .asciiz "\nThe product of your two inputs: "
div_int: .asciiz "\nThe quotient of your two inputs: "

#task 3
equal_output: .asciiz "\nUser inputs are the same."
difference_output: .asciiz "\nUser inputs are not the same."

.text
task1:

	#input msg for first integer
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#input msg for second integer
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	#output first integer
	li $v0, 4
	la $a0, output1
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	#output second integer
	li $v0, 4
	la $a0, output2
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
task2:
	#addition
	add $t0, $s0, $s1
	li $v0, 4
	la $a0, add_int
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	#subtraction
	sub $t1, $s0, $s1
	li $v0, 4
	la $a0, sub_int
	syscall
	
	move $a0, $t1
	li $v0, 1
	syscall	
	
	#multiplication
	mul $t2, $s0, $s1
	li $v0, 4
	la $a0, mult_int
	syscall
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	#division
	div $t3, $s0, $s1
	li $v0, 4
	la $a0, div_int
	syscall

	move $a0, $t3
	li $v0, 1
	syscall
	
task3:
	#compare the inputs
	beq $s0, $s1, equal_input
	
	#if not equal
	li $v0, 4
	la $a0, difference_output
	syscall
	b exit
	
	
equal_input:
	#if the inputs equal
	li $v0, 4
	la $a0, equal_output
	syscall
	
	
	
exit:
	#Exit the program
	 li $v0, 10
	 syscall 
	 
	 
	 
	 
	 
