.text
.globl main
main:
    # Suppose $t1
    ori     $t1, $zero, 0xDEAD      # $t1 = 0x0000DEAD
    sll     $t1, $t1, 16            # $t1 = 0xDEAD0000
    ori     $t1, $t1, 0xBEEF        # $t1 = 0xDEADBEEF


    # Only and, or and rotate instructions
    # Let me use jump and branch instructions, Plzz :<

    # Get 0xF
    or      $t4, $zero, $t1         # copy $t1 to $t4
    sll     $t4, $t4, 28            # $t4 = 0xF0000000
    srl     $t4, $t4, 28            # $t4 = 0x0000000F

    nor     $a0, $a0, $zero         # set i = 8
    jal		REVERSE				    # jump to REVERSE and save position to $ra

    j		EXIT				    # jump to EXIT
    
REVERSE:
    and 	$t3, $t1, $t4        
    or  	$t2, $t2, $t3	        # Add the least significant word from $t1 to $t2        

    sll     $a0, $a0, 4             # i -= 1
    beq		$a0, $zero, JUMP_BACK	# if i == 0 then JUMP_BACK

    srl     $t1, $t1, 4             # Shift $t2 to the left
    sll     $t2, $t2, 4             # Shift $t1 to the right
    j		REVERSE				    # jump to REVERSE
    
    
JUMP_BACK:
    jr		$ra					    # jump to $ra

EXIT: # Does this violate since I use ori? :<
    ori     $v0, $zero, 10          # Exit
    syscall
    