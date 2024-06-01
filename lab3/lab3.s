.text
.global _start

_start:
    ADR X0, dot
    ADR X1, vec1
    ADR X2, vec2

    // dot
    LDR X5, [X0]

    LDR X3, [X1]
    LDR X4, [X2]
    MUL X6, X3, X4
    ADD X5, X5, X6

    LDR X3, [X1, 8]
    LDR X4, [X2, 8]
    MUL X6, X3, X4
    ADD X5, X5, X6

    LDR X3, [X1, 16]
    LDR X4, [X2, 16]
    MUL X6, X3, X4
    ADD X5, X5, X6

    STR X5, [X0]

    MOV X0, 0
    MOV X8, 93
    SVC 0

.data
    vec1: .quad 10,20,30
    vec2: .quad 1,2,3
    dot: .quad 0
