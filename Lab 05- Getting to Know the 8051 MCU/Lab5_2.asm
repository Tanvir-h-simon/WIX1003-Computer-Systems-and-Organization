            ORG    00H            ; Origin: Set the program start address to 00H
            AJMP   MAIN           ; Absolute Jump: Jump to the MAIN label to start execution

MAIN:       MOV    A, #0FFH       ; Move Immediate: Load the accumulator (A) with 0FFH (255 in decimal)
            MOV    P0, A          ; Move: Output the value in accumulator (A) to Port 0 (P0)

START:      DEC    A              ; Decrement: Decrease the value in accumulator (A) by 1
            MOV    P0, A          ; Move: Output the updated value in accumulator (A) to Port 0 (P0)
            CJNE   A, #00H, START ; Compare and Jump if Not Equal: Compare A with 00H (0)
                                   ; If A is not 0, jump back to START; otherwise, continue

DELAY:      MOV    P3, #01H       ; Move Immediate: Load Port 3 (P3) with 01H (initialize delay counter)
DELAY1:     DJNZ   P3, DELAY1     ; Decrement and Jump if Not Zero: Decrement P3 by 1
                                   ; If P3 is not zero, jump back to DELAY1
            RET                   ; Return: Return from the DELAY subroutine

            END                   ; End: Marks the end of the program