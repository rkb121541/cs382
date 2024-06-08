/**
 * Name:
 * Pledge:
 */

.text
.global _start

_start:

/* Add your code here */
    MOV X5, 0
    ADR X0, numstr
    MOV X1, 0
check_len:
    LDRB W2, [X0, X1]
    CBZ W2, next
    ADD X1, X1, 1
    B check_len
    // "382"
next:
    SUB X1, X1, 1 // 2 (index)
    LDRB W2, [X0, X1] // "2" (char digit)
    SUB W2, W2, 48 // 2 (num digit)
    

mult_loop:
    MOV X3, X1
    MOV X4, 0
    


    ADD 





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






