.global pringle
// .global _start

pringle:
    SUB SP, SP, 160
    STR X30, [SP]
    STR X19, [SP, 8]
    STR X20, [SP, 16]
    STR X21, [SP, 24]
    STR X22, [SP, 32]
    STR X23, [SP, 40]
    STR X24, [SP, 48]
    STR X25, [SP, 56]
    STR X26, [SP, 64]
    STR X27, [SP, 72]
    STR X28, [SP, 80]
    STR X29, [SP, 88]
    STR X0, [SP, 96]
    STR X1, [SP, 104]
    STR X2, [SP, 112]
    STR X3, [SP, 120]
    STR X4, [SP, 128]
    STR X5, [SP, 136]
    STR X6, [SP, 144]
    STR X7, [SP, 152]
/*
    pringle(char* formatted_str,
        unsigned long int* ptr_arr1, unsigned long int len_arr1,
        unsigned long int* ptr_arr2, unsigned long int len_arr2, ...);
*/

   // zero out buffer
    ADR X19, outstr
    MOV X29, 0

loop0:
    CMP X29, 1024
    B.EQ after_loop0_pt2
    STR XZR, [X19, X29]
    ADD X29, X29, 8
    B loop0

after_loop0_pt2:
    MOV W24, 37 // %
    MOV W25, 97 // a
    MOV X26, 0 // %a counter 
    MOV X27, 0 // str counter
    MOV X29, 0 // outstr counter
    ADR X19, outstr
    MOV X20, X0 // 1st param

loop:
    LDRB W21, [X20, X27]
    STRB W21, [X19, X29]
    CBZ W21, end
    CMP W21, W24
    B.EQ check_a
    ADD X27, X27, 1
    ADD X29, X29, 1
    B loop
        
check_a:
    ADD X27, X27, 1
    LDRB W21, [X20, X27] // x27 currently on a
    CMP W21, W25
    B.EQ branch
    ADD X29, X29, 1
    STRB W21, [X19, X29]

    CMP W21, W24
    B.EQ check_a
    CBZ W21, end
    ADD X27, X27, 1
    ADD X29, X29, 1
    B loop

branch:
    ADD X27, X27, 1 // x27 on 1 past a
    MOV X22, 104
    MOV X28, 16
    MUL X23, X26, X28 // offset for %a
    ADD X23, X22, X23
    LDR X0, [SP, X23]
    MOV X22, 112
    MOV X28, 16
    MUL X23, X26, X28 // offset for %a
    ADD X23, X22, X23
    LDR X1, [SP, X23]

    BL concat_array
    ADD X26, X26, 1
    MOV X28, 0 // concat_array counter

write:
    LDRB W21, [X0, X28]
    CBZ W21, loop
    STRB W21, [X19, X29]
    ADD X29, X29, 1
    ADD X28, X28, 1
    B write

end:
    MOV X0, 1
    MOV X1, X19
    MOV X2, X29
    MOV X8, 64
    SVC 0
    MOV X0, X29

    LDR X30, [SP]
    LDR X19, [SP, 8]
    LDR X20, [SP, 16]
    LDR X21, [SP, 24]
    LDR X22, [SP, 32]
    LDR X23, [SP, 40]
    LDR X24, [SP, 48]
    LDR X25, [SP, 56]
    LDR X26, [SP, 64]
    LDR X27, [SP, 72]
    LDR X28, [SP, 80]
    LDR X29, [SP, 88]
    LDR X0, [SP, 96]
    LDR X1, [SP, 104]
    LDR X2, [SP, 112]
    LDR X3, [SP, 120]
    LDR X4, [SP, 128]
    LDR X5, [SP, 136]
    LDR X6, [SP, 144]
    LDR X7, [SP, 152]
    ADD SP, SP, 160
    RET

/*
_start:
    ADR X0, x_0
    ADR X1, x_1
    ADR X2, x_2
    LDR X2, [X2]
    ADR X3, x_3
    ADR X4, x_4
    LDR X4, [X4]

    BL pringle

    MOV X0, 0 
    MOV X8, 93
    SVC 0
*/

/*
    Declare .data here if you need.
*/
.data
    outstr:  .fill 1024, 1, 0

/*
    x_0: .string "%%a %%%a %"
    x_1: .quad 1
    x_2: .quad 1
    x_3: .quad 2
    x_4: .quad 1
*/