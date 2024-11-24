#Bradley Gunawan CS2640 11/23/2024
#Task 1: Return a Letter Grade from Scores in Memory
#return a letter grade for each element in given array
#include:
	#a main label
	#a loop counter
	#extra credit message for grades above 100
	#name printed out after all grades are read
	
.data
	scores: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82
	count: .word 10
	msgA: .asciiz "A"
	msgB: .asciiz "B"
	msgC: .asciiz "C"
	msgD: .asciiz "D"
	msgF: .asciiz "F"
	msgExtra: .asciiz "A with Extra Credit"
	name: .asciiz "Bradley Gunawan"

.text

.macro printStr
	li $v0, 4
	syscall
.end_macro

.macro printGrade
	printStr

main:
	la $t0, scores
	lw $t1, count	#num of elements in array
	li $t2, 0 	#loop counter
	
loop:
	