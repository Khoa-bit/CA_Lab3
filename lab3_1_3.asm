.text
.globl main
main:
    ori     $t1, $zero, 0xDEAD      # $t1 = 0x0000DEAD
    sll     $t1, $t1, 16            # $t1 = 0xDEAD0000
    ori     $t1, $t1, 0xBEEF        # $t1 = 0xDEADBEEF

    # I didn't know the we are allowed to use add/addi to make Loop.
    # So I try to think of a workaround with nor and sll instructions.
    nor     $a0, $a0, $zero         # set i = 8
    jal		REVERSE				    # jump to REVERSE and save position to $ra

    j		EXIT				    # jump to EXIT

EXIT:
    ori     $v0, $zero, 10          # Exit
    syscall
    
REVERSE:
    andi 	$t3, $t1, 0xF	        
    or  	$t2, $t2, $t3	        # Add the least significant word from $t1 to $t2

    sll     $a0, $a0, 4             # i -= 1
    beq		$a0, $zero, JUMP_BACK	# if i == 0 then JUMP_BACK

    sll     $t2, $t2, 4             # Shift $t2 to the left
    srl     $t1, $t1, 4             # Shift $t1 to the right
    j		REVERSE				    # jump to REVERSE
    
    
JUMP_BACK:
    jr		$ra					    # jump to $ra
    