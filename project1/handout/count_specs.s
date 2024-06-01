.global count_specs

count_specs:
    SUB SP, SP, 96
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

    // unsigned long int count_specs(char* str);
    MOV W27, 37 // %
    MOV W28, 97 // a
    MOV X29, 0 // return

    MOV X19, 0 // str counter

loop:
    LDRB W20, [X0, X19]
    CBZ W20, end
    CMP W20, W27
    B.EQ check_a
    ADD X19, X19, 1
    B loop

check_a:
    ADD X19, X19, 1
    LDRB W20, [X0, X19]
    CMP W20, W28
    B.EQ increase_counter
    CMP W20, W27
    B.EQ check_a
    CBZ W20, end
    ADD X19, X19, 1
    B loop

increase_counter:
    ADD X19, X19, 1
    ADD X29, X29, 1
    B loop

end:
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
    ADD SP, SP, 96
    RET

/*
    Declare .data here if you need.
*/
