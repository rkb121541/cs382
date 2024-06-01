.global itoascii
//.global _start

itoascii:
   // char* itoascii(unsigned long int number);
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

   // zero out buffer
   ADR X19, buffer
   MOV X29, 0

loop0:
   CMP X29, 128
   B.EQ after_loop0
   STR XZR, [X19, X29]
   ADD X29, X29, 8
   B loop0
   
   // 123
   // 123//10 = 12
   // 12 * 10 = 120
   // 123 - 120 
   // 12//10 = 1
   // 1//10 = 0

after_loop0:
   // first we find the length of the num - 1
   MOV X20, X0
   MOV X21, 0
   MOV X29, 10

loop1: 
   ADD X21, X21, 1
   UDIV X20, X20, X29
   CBNZ X20, loop1

   MOV X20, X0 // 123

loop2:
   SUB X21, X21, 1 // 1

   UDIV X22, X20, X29 // 1 
   MUL X24, X22, X29 // 10
   SUB X23, X20, X24 // 2
   ADD X23, X23, 48 // convert digit to ascii
   STRB W23, [X19, X21]
   CBZ X21, end
   MOV X20, X22
   B loop2

end:
   MOV X0, X19

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

//_start:

//    ADR X0, number
//    LDR X0, [X0]
//    BL itoascii

//    MOV  X0, 0
//    MOV  X8, 93
//    SVC  0



.data
    /* Put the converted string into buffer,
       and return the address of buffer */
    buffer: .fill 128, 1, 0
//    number: .quad 123


