ORG 00H
AJMP MAIN

MAIN: 
    MOV A, #00H         ; Clear accumulator
    MOV P1, A           ; Set Port 1 as output
    MOV A, #0F0H        ; Set Port 2 as input
    MOV P2, A
    MOV DPTR, #SEG      ; Load lookup table address

START:
    MOV A, P2           ; Read input from Port 2
    ANL A, #0FH         ; Mask upper nibble
    MOVC A, @A+DPTR     ; Get segment pattern from lookup table
    MOV P1, A           ; Output to 7-segment display
    AJMP START          ; Repeat

SEG: 
    DB 3FH, 06H, 5BH, 4FH, 66H, 6DH, 7DH, 07H
    DB 7FH, 6FH         ; Patterns for 0–9
END