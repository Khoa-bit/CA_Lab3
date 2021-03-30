.data
hex:        .asciiz "0x"
char_a:     .asciiz "A"
char_b:     .asciiz "B"
char_c:     .asciiz "C"
char_d:     .asciiz "D"
char_e:     .asciiz "E"
char_f:     .asciiz "F"

.text
.globl main
main:
    ori     $v0, $zero, 5       # Read Integer
    syscall

    or      $t0, $zero, $v0

    # Print Beginning
    la      $a0, hex
    ori     $v0, $zero, 4
    syscall
    
    ori     $t1, $zero, 0xa
    beq		$t0, $t1, PRINT_A	# if $t0 == $t1 then PRINT_A
    
    ori     $t1, $zero, 0xb
    beq		$t0, $t1, PRINT_B	# if $t0 == $t1 then PRINT_B
    
    ori     $t1, $zero, 0xc
    beq		$t0, $t1, PRINT_C	# if $t0 == $t1 then PRINT_C

    ori     $t1, $zero, 0xd
    beq		$t0, $t1, PRINT_D	# if $t0 == $t1 then PRINT_D

    ori     $t1, $zero, 0xe
    beq		$t0, $t1, PRINT_E	# if $t0 == $t1 then PRINT_E

    ori     $t1, $zero, 0xf
    beq		$t0, $t1, PRINT_F	# if $t0 == $t1 then PRINT_F

    or		$a0, $zero, $t0		# $a0 = $t0
    b		PRINT_INT			# branch to PRINT_INT
    
EXIT:
    ori     $v0, $zero, 10      # Exit
    syscall

PRINT_INT:
    ori     $v0, $zero, 1
    syscall
    j		EXIT				# jump to EXIT

PRINT_A:
    la      $a0, char_a
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT

PRINT_B:
    la      $a0, char_b
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT

PRINT_C:
    la      $a0, char_c
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT

PRINT_D:
    la      $a0, char_d
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT

PRINT_E:
    la      $a0, char_e
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT

PRINT_F:
    la      $a0, char_f
    ori     $v0, $zero, 4
    syscall
    j		EXIT				# jump to EXIT
