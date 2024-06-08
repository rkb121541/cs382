/**
 * Name:
 * Pledge:
 */

.text
.global _start

_start:

/* Add your code here */
    // placeholder for result
    MOV X7, 0
    ADR X0, numstr
    MOV X1, 0
    MOV X3, 0 // for mult by 10

check_len:
    LDRB W2, [X0, X1]
    CBZ X2, next
    ADD X1, X1, 1
    B check_len
    // "382"
    //  012
next:
    SUB X1, X1, 1 // 2 (index)
    MOV X5, X1
extract_char:
    LDRB W2, [X0, X5] // "2" (char digit)
    SUB X2, X2, 48 // 2 (num digit)
    MOV X4, X3
mult_loop:
    CBZ X4, after
    MOV X10, 10
    MUL X2, X2, X10
    SUB X4, X4, 1
    B mult_loop

after:
    ADD X3, X3, 1
    ADD X7, X7, X2
    CBZ X5, end
    SUB X5, X5, 1
    B extract_char

end:
    ADR X0, number
    STR X7, [X0] 

/* Do not change any part of the following code */
exit:
    MOV  X0, 1
    ADR  X1, number
    MOV  X2, 8
    MOV  X8, 64
    SVC  0
    MOV  X0, 0
    MOV  X8, 93
    SVC  0
    /* End of the code. */



/*
 * If you need additional data,
 * declare a .data segment and add the data here
 */






