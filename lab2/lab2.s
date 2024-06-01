.text
.global _start

_start:
    ADR X1, msg
    ADR X2, len
    LDR X2, [X2]

    MOV X0, 1
    MOV X8, 64
    SVC 0
    
    MOV X0, 0
    MOV X8, 93
    SVC 0

.data
    msg: .string "Hello World!\n"
    len: .quad 13
