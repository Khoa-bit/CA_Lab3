.data
hex:        .asciiz "0x"
char_a:     .asciiz "A"
char_b:     .asciiz "B"
char_c:     .asciiz "C"
char_d:     .asciiz "D"
char_e:     .asciiz "E"
char_f:     .asciiz "F"
newline:    .asciiz "\n"

.text
.globl main
main:
    ori     $v0, $zero, 5       # Read Integer
    syscall

    or      $a0, $zero, $v0     # $a0 = $v0 (register to be REVERSED)
    nor     $a1, $a1, $zero     # set i = 8
    jal		REVERSE				# jump to REVERSE and save position to $ra

    # Store REVERSED register in $s0
    or      $s0, $zero, $v0

    # Print hex symbol
    la      $a0, hex
    ori     $v0, $zero, 4
    syscall

    or      $a0, $zero, $s0     # $a0 = $s0 (REVERSED register)
    nor     $a1, $a1, $zero     # set i = 8
    jal		PRINT_HEX			# jump to PRINT_HEX and save position to $ra

    li		$v0, 4              # New Line 
    la		$a0, newline
    syscall

    j		EXIT				# jump to EXIT

EXIT:
    ori     $v0, $zero, 10      # Exit
    syscall

REVERSE:
    # $a0: a register, $a1: i; $v0: REVERSED register

    andi 	$t3, $a0, 0xF	        
    or  	$v0, $v0, $t3	        # Add the least significant word from $a0 to $v0

    sll     $a1, $a1, 4             # i -= 1
    beq		$a1, $zero, JUMP_BACK	# if i == 0 then JUMP_BACK

    sll     $v0, $v0, 4             # Shift $t2 to the left
    srl     $a0, $a0, 4             # Shift $a0 to the right
    j		REVERSE				    # jump to REVERSE
    
JUMP_BACK:
    jr		$ra					    # jump to $ra

PRINT_HEX: 
    # $a0: a REVERSED register, $a1: i; $v0: void

    # Store input REVERSED register
    or      $s1, $zero, $a0

CONTINUE_PRINT:
    # Get the least significant word from $s1 to store at argument $a0
    andi 	$a0, $s1, 0xF
    srl     $s1, $s1, 4             # Shift to the right by 1 word

    ori     $t1, $zero, 0xa
    beq		$a0, $t1, PRINT_A	    # if $a0 == $t1 then PRINT_A
    
    ori     $t1, $zero, 0xb
    beq		$a0, $t1, PRINT_B	    # if $a0 == $t1 then PRINT_B
    
    ori     $t1, $zero, 0xc
    beq		$a0, $t1, PRINT_C	    # if $a0 == $t1 then PRINT_C

    ori     $t1, $zero, 0xd
    beq		$a0, $t1, PRINT_D	    # if $a0 == $t1 then PRINT_D

    ori     $t1, $zero, 0xe
    beq		$a0, $t1, PRINT_E	    # if $a0 == $t1 then PRINT_E

    ori     $t1, $zero, 0xf
    beq		$a0, $t1, PRINT_F	    # if $a0 == $t1 then PRINT_F

    b		PRINT_INT			    # branch to PRINT_INT

LOOP:
    sll     $a1, $a1, 4             # i -= 1
    beq		$a1, $zero, JUMP_BACK	# if i == 0 then JUMP_BACK

    j		CONTINUE_PRINT			# jump to PRINT_HEX
    

PRINT_INT:
    ori     $v0, $zero, 1
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_A: 
    la      $a0, char_a
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_B:
    la      $a0, char_b
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_C:
    la      $a0, char_c
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_D:
    la      $a0, char_d
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_E:
    la      $a0, char_e
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    

PRINT_F:
    la      $a0, char_f
    ori     $v0, $zero, 4
    syscall
    j		LOOP				# jump to LOOP
    
    


