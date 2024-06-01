.global concat_array

concat_array:
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

   // char* concat_array(unsigned long int* arr, unsigned long int len);
   MOV X20, X0 // array
   MOV X21, X1 // len

   MOV X22, 0 // byte offset for array
   MOV W23, 32 // ascii for space
   MOV X24, 0 // itoascii counter
   MOV X25, 0 // concat_array_outstr counter

   // zero out buffer
   ADR X19, concat_array_outstr
   MOV X29, 0

loop0:
   CMP X29, 1024
   B.EQ loop1
   STR XZR, [X19, X29]
   ADD X29, X29, 8
   B loop0

loop1:
   CBZ X21, end
   MOV X0, 0
   LDR X0, [X20, X22]
   BL itoascii

inner_loop:   
   LDRB W26, [X0, X24]
   CBZ W26, put_space
   STRB W26, [X19, X25]
   ADD X24, X24, 1
   ADD X25, X25, 1
   B inner_loop  
   
put_space:
   STRB W23, [X19, X25]
   SUB X21, X21, 1
   ADD X22, X22, 8
   MOV X24, 0
   ADD X25, X25, 1
   B loop1
   
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

.data
    /* Put the converted string into concat_array_outstrer,
       and return the address of concat_array_outstr */
    concat_array_outstr:  .fill 1024, 1, 0

