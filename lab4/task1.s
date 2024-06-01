.text
.global _start

_start:
    ADR X0, side_a
    LDR X0, [X0]
    ADR X1, side_b
    LDR X1, [X1]
    ADR X2, side_c
    LDR X2, [X2]
    MUL X0, X0, X0
    MUL X1, X1, X1
    MUL X2, X2, X2
    ADD X3, X0, X1
    CMP X3, X2
    B.EQ print_yes
    B print_no

print_yes:
    ADR X1, yes
    ADR X2, len_yes
    LDR X2, [X2]
    B end

print_no:
    ADR X1, no
    ADR X2, len_no
    LDR X2, [X2]

end:
    MOV X0, 1
    MOV X8, 64
    SVC 0

exit:
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    side_a: .quad 3
    side_b: .quad 4
    side_c: .quad 5
    yes: .string "It is a right triangle.\n"
    len_yes: .quad 24 // Calculate the length of string yes
    no: .string "It is not a right triangle.\n"
    len_no: .quad 28 // Calculate the length of string no
    