;/************************************************************************************
; File          : ADCDAC.s														 	 *
; Description   : Analog/Digital and Digital/Analog conversions 					 *
;*************************************************************************************


		; =========== 1. Configure DAC(DAC0CON)
		;
		; 	DAC0 should be used;
		;	DAC range: 0V to AVDD;
		; 	normal DAC operation
		;   update the DAC using core clock
			 
		; <====== add code 2(begin)

		LDR r1, =DAC0CON;
		MOV r2, #0x13; pattern:10011 
		STR r2, [r1] 	
							 
				  		

		; <====== add code 2(end)

		
		
		; =========== 2. Configure ADC

		; <====== add code 3 (begin)
		LDR r1, =REFCON
		MOV r2, #0x01
		STR r2, [r1]

		LDR r1, =ADCCON
		LDR r2, =0x9A4 ;pattern:0100110100100
		STR r2, [r1]

		LDR r1, =ADCCP
		MOV r2, #0x0
		STR r2, [r1]
	
					
		; <====== add code 3 (end)	
							

		
		; =========== 3. ADC and DAC
		; Steps:
		; 1 wait for the end of A/D conversion
		; 2 fetch value from ADC register
		; 3 write value to DAC register
		
		; <======  add code 4 (begin)
		ldr r6,=DAC0DAT		; load the address of DAC0DAT to r6
		LDR r1, =ADCDAT
		LDR r4, =ADCSTA
loop

wait	
		LDR r3, [r4]
		TEQ r3, #1
		BNE wait
		LDR r2, [r1]
		STR r2, [r6]
			
									
		b       loop ;5			


stop  	b 		stop

	  

		; <======  add code 4 (end)	


	