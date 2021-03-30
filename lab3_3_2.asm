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

    or      $a0, $zero, $v0
    jal		PRINT_HEX			# jump to PRINT_HEX and save position to $ra

    li		$v0, 4              # NewLine 
    la		$a0, newline
    syscall		

    j		EXIT				# jump to EXIT

EXIT:
    ori     $v0, $zero, 10      # Exit
    syscall

PRINT_HEX:
    or      $t0, $zero, $a0

    # Print Beginning
    la      $a0, hex
    ori     $v0, $zero, 4
    syscall

    or      $a0, $zero, $t0

    ori     $t1, $zero, 0xa
    beq		$a0, $t1, PRINT_A	# if $a0 == $t1 then PRINT_A
    
    ori     $t1, $zero, 0xb
    beq		$a0, $t1, PRINT_B	# if $a0 == $t1 then PRINT_B
    
    ori     $t1, $zero, 0xc
    beq		$a0, $t1, PRINT_C	# if $a0 == $t1 then PRINT_C

    ori     $t1, $zero, 0xd
    beq		$a0, $t1, PRINT_D	# if $a0 == $t1 then PRINT_D

    ori     $t1, $zero, 0xe
    beq		$a0, $t1, PRINT_E	# if $a0 == $t1 then PRINT_E

    ori     $t1, $zero, 0xf
    beq		$a0, $t1, PRINT_F	# if $a0 == $t1 then PRINT_F

    b		PRINT_INT			# branch to PRINT_INT

PRINT_INT:
    ori     $v0, $zero, 1
    syscall
    jr		$ra					# jump to $ra
    

PRINT_A:
    la      $a0, char_a
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    

PRINT_B:
    la      $a0, char_b
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    

PRINT_C:
    la      $a0, char_c
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    

PRINT_D:
    la      $a0, char_d
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    

PRINT_E:
    la      $a0, char_e
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    

PRINT_F:
    la      $a0, char_f
    ori     $v0, $zero, 4
    syscall
    jr		$ra					# jump to $ra
    


