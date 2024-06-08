/**
 * Name:
 * Pledge: 
*/

.text
.global _start

_start:
    ADR X0, src_str
    ADR X1, dst_str
    MOV X2, 0
loop:    
    LDRB W3, [X0, X2]
    STRB W3, [X1, X2]
    CBZ W3, print
    ADD X2, X2, 1
    B loop

print:
    ADD X2, X2, 1
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