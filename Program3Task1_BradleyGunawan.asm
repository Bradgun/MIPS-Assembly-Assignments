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
	msgA: .asciiz "A\n"
	msgB: .asciiz "B\n"
	msgC: .asciiz "C\n"
	msgD: .asciiz "D\n"
	msgF: .asciiz "F\n"
	msgExtra: .asciiz "A with Extra Credit\n"
	name: .asciiz "Bradley Gunawan\n"
	gradeMsg: .asciiz "The grade for "
	isString: .asciiz " is: "
	exitMsg: .asciiz "The program will now exit.\n"

.text

.macro prString(%str)
    li $v0, 4
    la $a0, %str
    syscall
.end_macro

.macro printNum
	li $v0, 1
	syscall
.end_macro

main:
	la $t0, scores	#load address of scores array
	lw $t1, count	#num of elements in array
	li $t2, 0 	#loop counter
	
loop:
	beq $t2, $t1, Exit #exit when loop counter equals the total # of elements in array
	
	lw $t3, 0($t0)	   #load value of current score into $t3
	
	#Print grade prompt
	prString gradeMsg

	#print score
	move $a0, $t3
	printNum
	
	#print "is:"
	prString isString
	
	#check grades
	
	#for scores above 100 (extra credit)
	li $t4, 100			#store score of 100 into $t4
	bgt $t3, $t4, scoreExtra	#check to see if current score is greater than $t4
					#if it is, branch to scoreExtra, if not, move on to next statement
	
	#for scores 90-100
	li $t4, 89
	bgt $t3, $t4, scoreA 
	
	#for scores 80-89
	li $t4, 79
	bgt $t3, $t4,  scoreB
	
	#for scores 70-79
	li $t4, 69
	bgt $t3, $t4, scoreC
	
	#fore scores 60-69
	li $t4, 59
	bgt $t3, $t4, scoreD
	
	#for every score that doesn't meet criteria (failing)
	j scoreF
	
#labels to print out the letter grade, every label branches to nextScore
scoreExtra:
	prString msgExtra
	j nextScore

scoreA:
	prString msgA
	j nextScore

scoreB:
	prString msgB
	j nextScore

scoreC:
	prString msgC
	j nextScore

scoreD: 
	prString msgD
	j nextScore
	
scoreF:
	prString msgF
	j nextScore
	
nextScore:
	addi $t0, $t0, 4	#move to next score in array
	addi $t2, $t2, 1	#loop counter increases by 1 each time
	j loop			#loop gets repeated


Exit:	
	#print out name before exiting the program
	prString name
	
	#print that the program will exit
	prString exitMsg
	
	#exit the program
	li $v0 10
	syscall