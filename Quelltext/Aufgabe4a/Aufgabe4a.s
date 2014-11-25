;/***********************************************************************************
;          Praktikum Mikrocontroller und digitale Signalprozessoren(PMCDSP)         *  
; File          : Aufgabe4a.s														*
; Description   : Generate a sinusoidal signal of 10kHz with a sampling rate of     *
;				  100kHz using value table method									*
;************************************************************************************
 
		
		; ========================== 1. Configure DAC
		;
		; 			DAC0 should be used;
		;			output range: 0V to AVDD;
		; 			normal DAC operation
		;           update rate = core frequency 
			 
		; <====== add code 1 (begin)
		
		LDR r1, =DAC0CON;
		MOV r2, #0x13; pattern:10011 
		STR r2, [r1]


							 
					  					
				   		
						  		

		; <====== add code 1 (end)


		; ========================== 2. Configure the for-loop
		ldr		r6,=DAC0DAT				; load the address of DAC0DAT to r6
		mov 	r3,#9					; number of table element minus 1
		adr     r4,ValueTable			; load the start address of the table in r4

		; ========================== 3. Generate sine waveform with the help of a table	    
loop		
		ldr		r2,[r4,r3,lsl #2]					  	
		str		r2,[r6]					
		subs	r3,r3,#1				
		movmi   r3,#9				    
		nop								
		nop							
		nop								
		nop								
		nop								
		nop								
		nop								
		nop								
		nop								
		b       loop			


stop  	b 		stop 						 													 

ValueTable
		; <====== add code 2 (begin)
		
		DCD 0x800000, 0xCB0000, 0xF90000, 0xF90000, 0xCB0000, 0x800000, 0x340000, 0x060000, 0x060000, 0x340000
		; <====== add code 2 (end)

	
										   

