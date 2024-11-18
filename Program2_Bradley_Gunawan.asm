#Bradley Gunawan
#11/16/2024
#Task 1: Return a letter grade from user input
#includes: 
    #a user menu
    #a main label, looping label, and exit label
    #a way for users to continue getting grades or to quit
    #invalid input handling

.data
mainborder: .asciiz "~~~~~~~~~~~~~ MAIN  MENU ~~~~~~~~~~~~~~~~~~\n"
border: .asciiz "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
firstOption: .asciiz "Enter '1' or '2' for your selection: "
scoreInputmsg: .asciiz "Please enter a score as an integer value: "
outputmsg: .asciiz "The grade is: "
newScore: .asciiz "Do you want to enter a new score?  Yes(Y)   No(N)"
invalidInput: .asciiz "Invalid input. Please try again."