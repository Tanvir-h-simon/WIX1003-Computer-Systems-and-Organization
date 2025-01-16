            ORG    00H            ; Origin: Set the program starting address to 00H
            AJMP   MAIN           ; Absolute Jump: Jump unconditionally to the MAIN label to begin execution

MAIN:       MOV    A, #00H        ; Move Immediate: Load the accumulator (A) with 00H (start value)
            MOV    P0, A          ; Move: Output the value in accumulator (A) to Port 0 (P0)

START:      INC    A              ; Increment: Add 1 to the value in accumulator (A)
            MOV    P0, A          ; Move: Output the updated value in accumulator (A) to Port 0 (P0)
            ACALL  DELAY          ; Absolute Call: Call the DELAY subroutine for a time delay
            CJNE   A, #0FFH, START ; Compare and Jump if Not Equal: Compare A with 0FFH (255)
                                   ; If A is not 255, jump back to START; otherwise, exit loop

DELAY:      MOV    P3, #01H       ; Move Immediate: Load Port 3 (P3) with 01H (delay counter initialization)
DELAY1:     DJNZ   P3, DELAY1     ; Decrement and Jump if Not Zero: Decrement P3 by 1
                                   ; If P3 is not zero, jump back to DELAY1 to continue the delay loop
            RET                   ; Return: Exit the DELAY subroutine and return to the calling instruction

            END                   ; End: Marks the end of the program code