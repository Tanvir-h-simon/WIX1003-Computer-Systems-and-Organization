; Simplified Assembly Code for 8051 Microcontroller
; 4-bit binary up counter using a push button
; Button Connected to P2.0
; 4 LEDs Connected to P1.0 - P1.3 (3 Yellow LEDs on P1.0 - P1.2, 1 Red LED on P1.3)

    ORG 0000H          ; Set program start address

START:
    MOV P1, #00H       ; Clear Port 1 (LEDs OFF)
    MOV P2, #0FFH      ; Configure Port 2 as input with pull-up

WAIT_PRESS:
    JNB P2.0, WAIT_PRESS ; Wait for button press (active low)

DEBOUNCE:
    MOV R2, #50        ; Short debounce delay
DB_LOOP:
    DJNZ R2, DB_LOOP

WAIT_RELEASE:
    JB P2.0, WAIT_RELEASE ; Wait for button release

    INC A              ; Increment counter
    MOV P1, A          ; Output counter value to LEDs

    SJMP WAIT_PRESS    ; Loop back to wait for the next press

    END