.text
.globl main
main:
    # Loop?
    ori     $t1, $zero, 0xD  # $t1 = 0x0000000D
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xE    # $t1 = 0x000000DE
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xA    # $t1 = 0x00000DEA
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xD    # $t1 = 0x0000DEAD
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xB    # $t1 = 0x000DEADB
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xE    # $t1 = 0x00DEADBE
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xE    # $t1 = 0x0DEADBEE
    sll     $t1, $t1, 4
    ori     $t1, $t1, 0xF    # $t1 = 0xDEADBEEF

    ori $v0, $zero, 10       # EXIT
    syscall
