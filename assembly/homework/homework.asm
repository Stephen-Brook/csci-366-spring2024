//==========================================================================================
// PROBLEM 1: Counting Up From 1 to 10 in Little Man Assembly
//==========================================================================================

// You can develop your code via the online emulator and then paste it in here
// Please use a jump in your solution
// Please use the OUT instruction to print values
 LDA COUNT
        LDA ITERATOR
LOOP    BRZ EXIT
        LDA ITERATOR
        OUT
        ADD ONE
        STA ITERATOR
        LDA COUNT
        SUB ONE
        STA COUNT
        BRA LOOP
EXIT    HLT
ITERATOR DAT 1
COUNT   DAT 10
ONE     DAT 1

//==========================================================================================
// PROBLEM 2: Counting Up From 1 to 10 in MIPS Assembly
//==========================================================================================

// You can develop your code via the MARS emulator and then paste it in here
// Please use a jump in your solution
// Please use sys-calls to output the value
.text

main:
	li $t0, 1       # Load immediate value 1 into register $t0 (iterator)
loop:

    	move $a0, $t0   # Move the iterator value to $a0
    	li $v0, 1       # Print
    	syscall         # Print the iterator value

    	li $v0, 4       # Print a new line to make the output look nice
    	la $a0, newLine    # Load address of the newline character into $a0
    	syscall         # Print a newline

    	addi $t0, $t0, 1   # Increment the iterator

    	# Check if the counter has reached 11
    	li $t1, 11
    	beq $t0, $t1, endLoop   # Branch to endLoop if $t0 equals $t1

    	j loop          # Jump back to loop

endLoop:
    	li $v0, 10      # Exit
    	syscall         # Exit the program

.data
	newLine: .asciiz "\n"
