.macro prString(%str)
li $v0, 4
la $a0, %str
syscall
.end_macro

.text
main:
prString(hello)