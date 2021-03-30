.text
.globl main
main:
    ori     $t1, $zero, 0xDEAD      # $t1 = 0x0000DEAD
    sll     $t1, $t1, 16            # $t1 = 0xDEAD0000
    ori     $t1, $t1, 0xBEEF        # $t1 = 0xDEADBEEF

    jr		$ra					    # Exit
    