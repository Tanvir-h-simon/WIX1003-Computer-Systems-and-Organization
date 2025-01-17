ORG     00H
        AJMP    MAIN

;PASSWORD    EQU     0A0H
;INPUTPWD    EQU     0A1H
;STATE       EQU     0A2H

;P_SWITCH    EQU     P2
;P_BUTTON    EQU     P0
;P_LED       EQU     P1

MAIN:       	MOV     P0, #0FFH     ; Initialize buttons P0.0 -> UNLOCK, P0.1-> LOCK
;            MOV     P1, #0FFH     ; Initialize LEDs
		MOV P1, #00H	; TO INITIALIZE OUTPUT YOU NEED TO PASS 0 VOLT TO THAT PORT...
            	MOV     P2, #0FFH     ; Initialize DIP switch

;            SETB    P1.1          ; Start in reset mode (Yellow light)
;            CLR     P1.0
;            CLR     P1.2

            SJMP    RESET_MODE

RESET_MODE: 	MOV P1,#010B          ; Yellow on
            ;CLR     P1.0          ; Green off
            ;CLR     P1.2          ; Red off

WAIT_LOCK:  ;JNB     P0.1, SAVE_PASSWORD ; Wait for button P0.1 to lock
		JB P0.1, WAIT_LOCK
            ;SJMP    WAIT_LOCK
         	AJMP SAVE_PASSWORD

SAVE_PASSWORD: MOV   A, P2         ; Read new password from DIP switch
               ;MOV   PASSWORD, A   ; Save new password
               MOV R3,A		;MOVING PASSWORD TO REGISTER-3
               AJMP  TRANSITION_TO_LOCK

TRANSITION_TO_LOCK:
               MOV P1,#001B          ; Yellow off
               ;SETB  P1.2          ; Red on
               ;CLR   P1.0          ; Green off
               AJMP  LOCK_LOOP

;LOCK_MODE:  CLR     P1.1          ; Yellow off
            ;SETB    P1.2          ; Red on
            ;CLR     P1.0

LOCK_LOOP:  ;JNB     P0.1, UNLOCK_CHECK ; Wait for button P0.1 to unlock
		JB P0.0, LOCK_LOOP
		MOV A, P2
		MOV R4,A
            ;SJMP    LOCK_LOOP
            	AJMP UNLOCK_CHECK

UNLOCK_CHECK:	MOV B,R4
		MOV A,R3	;COPYING R3'S VALUE TO B ACCUMULATOR
              	CJNE  A, B, WRONG_PASS ; Check password, JUMP TO WRONG_PASS if incorrect
              	AJMP  TRANSITION_TO_UNLOCK

TRANSITION_TO_UNLOCK:
		MOV P1,#100B	;GREEN ON, OTHERS OFF
              ;SETB   P1.0          ; Green on
              ;CLR    P1.1          ; Yellow off
              ;CLR    P1.2          ; Red off
              SJMP   UNLOCK_LOOP

;UNLOCK:     SETB    P1.0          ; Green on
;            CLR     P1.1          ; Yellow off
;            CLR     P1.2          ; Red off

UNLOCK_LOOP: 	JB    P0.1, UNLOCK_LOOP 	; Click button P0.1 to lock again
		ACALL DELAY
             	JB    P0.0, TRANSITION_TO_LOCK     ; CHECKING THAT UNLOCK BTN IS ALSO CLICKED OR NOT
             	AJMP   RESET_MODE
             
WRONG_PASS:	ACALL BLINK_RED
		AJMP TRANSITION_TO_LOCK

BLINK_RED:	CLR P1.0
		ACALL DELAY
		SETB P1.0
		ACALL DELAY
		CLR P1.0
		ACALL DELAY
		SETB P1.0
		ACALL DELAY
		RET
DELAY:      MOV     R1, #0FFH
DELAY1:     MOV     R2, #0FFH
DELAY2:     DJNZ    R2, DELAY2
            DJNZ    R1, DELAY1
            RET

END