#Bradley Gunawan
#11/16/2024
#Task 2: Advanced Math: x to the power of y

.data
xmsg: .asciiz "\nEnter a number for 'x': "
ymsg: .asciiz "\nEnter a number for 'y': "
resultmsg: .asciiz "\n'x' to the power of 'y' is: "

.text
main:
    #set prompt for x
    li $v0, 4
    la $a0, xmsg
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    #set prompt for y
    li $v0, 4
    la $a0, ymsg
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    #initialize result and counter
    li $t2, 1       #if loop doesn't occur because counter = 0, then anything to the power of 0 is zero
    move $t3, $t1   #counter will be from the y input

loop:
    beq $t3, 0, print   #starts the loop to check if counter = 0
    mul $t2, $t2, $t0   #result = result * x
    sub $t3, $t3, 1     #decrease counter by 1

    b loop

print:
   #prints result msg
   li $v0, 4
    la $a0, resultmsg
    syscall

    #prints result
    li $v0, 1
    move $a0, $t2
    syscall
    b exit

exit:
    li $v0, 10
    syscall