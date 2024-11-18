#Bradley Gunawan
#11/16/2024
#Task 1: Return a letter grade from user input
#includes: 
    #a user menu
    #a main label, looping label, and exit label
    #a way for users to continue getting grades or to quit
    #invalid input handling

.data
mainBorder: .asciiz "\n~~~~~~~~~~~~~ MAIN  MENU ~~~~~~~~~~~~~~~~~~\n"
getLetter: .asciiz "(1) Get Letter Grade\n"
exitLabel: .asciiz "(2) Exit Program\n"
firstOption: .asciiz "Enter '1' or '2' for your selection: "
scoreInputmsg: .asciiz "\nPlease enter a score as an integer value: "
outputmsg: .asciiz "\nThe grade is: "
gradeAString: .asciiz "A\n"
gradeBString: .asciiz "B\n"
gradeCString: .asciiz "C\n"
gradeDString: .asciiz "D\n"
gradeFString: .asciiz "F\n"
newScore: .asciiz "\nDo you want to enter a new score?  Yes(Y)   No(N)"
invalidInput: .asciiz "\nInvalid input. Please try again.\n"

#macro to print string
.macro prString(%str)
    li $v0, 4
    la $a0, %str
    syscall
.end_macro

.text

main:
#prints the main menu labels
    prString mainBorder

    prString getLetter

    prString exitLabel

    prString firstOption

    #read the user's selection
    li $v0, 5
    syscall
    move $s0, $v0

    #check choices
    beq $s0, 1, grades
    beq $s0, 2, exit
    b invalid

grades:

    #show prompt for score
    li $v0, 4
    la $a0, scoreInputmsg
    syscall

    #read the score
    li $v0, 5
    syscall
    move $s1, $v0
    nop

    li $t0, 0
    li $t1, 100
    blt $s1, $t0, invalid
    bgt $s1, $t1, invalid

    #determine what letter will suit the input

    li $s2, 90
    bge $s1, $s2, gradeA
    
    li $s2, 80
    bge $s1, $s2, gradeB

    li $s2, 70
    bge $s1, $s2, gradeC

    li $s2, 60
    bge $s1, $s2, gradeD

    li $s2, 0
    bge $s1, $s2, gradeF

gradeA: 
    prString outputmsg
    prString gradeAString
    b postScore
    
gradeB: 
    prString outputmsg
    prString gradeBString
    b postScore

gradeC: 
    prString outputmsg
    prString gradeCString
    b postScore
    
gradeD: 
    prString outputmsg
    prString gradeDString
    b postScore
    
gradeF: 
    prString outputmsg
    prString gradeFString
    b postScore

    
postScore:
#ask the user if they want to input another score
    prString newScore

        #read the user's selection
    li $v0, 12
    syscall
    move $s0, $v0

    #check choices
    beq $s0, 'Y', grades
    beq $s0, 'y', grades
    beq $s0, 'N', main
    beq $s0, 'n', main
    b invalid

invalid:
prString invalidInput
b main

exit:
    li $v0, 10
    syscall