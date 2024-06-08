/**
 * Name:
 * Pledge: 
*/


.text
.global _start

_start:
    ADR X0, arr
    MOV X1, 0
    ADR X2, length
    LDR X2, [X2]
    SUB X2, X2, 1
    ADR X3, target
    LDR X3, [X3]
loop:
    CMP X1, X2
    B.LE next
    B no

next:
    SUB X4, X2, X1
    ASR X4, X4, 1
    ADD X4, X4, X1

    LSL X5, X4, 3
    LDR X6, [X0, X5]
    CMP X6, X3
    B.EQ yes
    B.LT next2
    SUB X2, X4, 1
    B loop
next2:
    ADD X1, X4, 1
    B loop    

no:
    ADR X1, msg2
    MOV X2, 28
    B print

yes:
    ADR X1, msg1
    MOV X2, 24

print:  
    MOV X0, 1
    MOV X8, 64
    SVC 0
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall




/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */