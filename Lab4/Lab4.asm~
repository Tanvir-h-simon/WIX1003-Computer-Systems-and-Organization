       ORG 00H            ; ORIGIN: Set the program start address to 00H
       AJMP MAIN          ; ABSOLUTE JUMP: Jump unconditionally to the MAIN label

MAIN:  MOV A, #00H        ; MOVE: Load immediate value 00H into the accumulator (A)
       MOV P1, A          ; MOVE: Transfer the contents of A to Port 1 (P1), clearing it

START: MOV A, #055H       ; MOVE: Load immediate value 055H into the accumulator (A)
       MOV P1, A          ; MOVE: Transfer the contents of A to Port 1 (P1), outputting 055H
       AJMP START         ; ABSOLUTE JUMP: Jump unconditionally back to the START label

       END                ; END: Mark the end of the program for the assembler