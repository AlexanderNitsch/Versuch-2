;/***********************************************************************************
;*         Praktikum Mikrocontroller und digitale Signalprozessoren(PMCDSP)         *                                                                             *
; File          : Aufgabe6_h.s														*
; Description   : main program for exercise 6  							   			*
;************************************************************************************
     	
		GET         ADUC7026.s			 			; include file ADUC7026.s 
		AREA 		exercise6_h, CODE, READONLY		; declaration of code segment
	   	ENTRY										; entry point of code segment
                         
start

		; ========================== 1. Define a MACRO named mmr: load an arbitrary value($Value) into register($Register) 
		MACRO
$Label	mmr  $Register, $Value
		LDR r5, =$Register
		LDR r6,=$Value
		STR r6,[r5] 	
		MEND	   	   	

		; ========================== 2. Configure PLL with POWCON write sequence

		; ----- POWKEY1 
		ldr		r6,=POWKEY1		 	;load the address of MMR POWKEY1 into r6
		mov		r2,#0x01			;load value 0x01 into r2 
		str		r2,[r6]				;write value 0x01 to MMR POWKEY1
		
		; <====== add code 1(begin)

		LDR r1,=POWCON
		MOV r2,#0x04; pattern:00000100
		STR r2,[r1]



		
		; <====== add code 1(end)
		
		; ----- POWKEY2 
		ldr		r6,=POWKEY2		 	;load the address of MMR POWKEY2 into r6
		mov		r2,#0xF4			;load value 0xF4 into r2 
		str		r2,[r6]				;write value 0xF4 to MMR POWKEY2

	    ; ========================== 3. PWM output as clock input of low pass filter	 	   	
set1  	mmr GP3CON,0x00000001	    ;configure Pin 3.0 in PWM0H mode   
set2  	mmr PWMCON,0x01		    	;enable PWM  
set3  	mmr PWMEN,0x2f				;enable 0H output enable, disable other outputs	
set4  	mmr PWMDAT0,0x05			;PWM switching period, unsigned 16-bit
set5  	mmr PWMDAT1,0x01			;PWM dead time, unsigned 10-bit
set6  	mmr PWMCH0,0x01				;PWM duty cycle for chanel 0

		; ========================== 4. P4.2 as GPIO for LED
set7  	mmr GP4CON,0x00000000	    ;configure Port 4.x in GPIO mode	
				  				  
		; ========================== 5. Include your code	
	
	  	GET	ADCDAC.s				; <= put name of your code(for example ADCDAC.s) behind GET directive

		; ========================== 6. Mark end of file
		END               