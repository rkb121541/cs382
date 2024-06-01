.text
.global _start
.extern printf


/* char _uppercase(char lower) */
_uppercase:
    /* Your code here 
    
        You must follow calling convention,
        and make this a procedure.
    
    */

    SUB SP, SP, 8
    STR X30, [SP]

    SUB X0, X0, 32

    LDR X30, [SP]
    ADD SP, SP, 8
    RET





/* int _toupper(char* string) */
_toupper:
    /* Your code here 

        You must call _uppercase() for every character in string.
        Both loop and recursion are good.

        You must follow calling convention,
        and make this a procedure.

    */

    SUB SP, SP, 8
    STR X30, [SP]

    MOV X1, X0
    MOV X2, 0

loop:
    LDRB W0, [X1, X2]
    CBZ W0, end
    BL _uppercase
    STRB W0, [X1, X2]
    ADD X2, X2, 1
    B loop
    
end:
    MOV X0, X2

    LDR X30, [SP]
    ADD SP, SP, 8
    RET


_start:

    /* You code here:

        1. Call _toupper() to convert str;
        2. Call printf() to print outstr to show the result.
    
    */

    ADR X0, str
    BL _toupper
    MOV X1, X0
    ADR X0, outstr
    ADR X2, str
    BL printf

    MOV  X0, 0
    MOV  X8, 93
    SVC  0


.data
str:    .string   "helloworld"
outstr: .string   "Converted %ld characters: %s\n"
