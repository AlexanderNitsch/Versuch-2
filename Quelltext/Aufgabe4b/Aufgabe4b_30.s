;/***********************************************************************************
; File          : Aufgabe4b_30.s													*
;************************************************************************************
     	
		; ========================== 1. Configure DAC
		;
		; 			DAC0 should be used;
		;			output range: 0V to AVDD;
		; 			normal DAC operation
		;           update rate = core frequency 
			 
		; <====== add code 2 (begin)

		LDR r1, =DAC0CON;
		MOV r2, #0x13; pattern:10011 
		STR r2, [r1]
							 
			  		

		; <====== add code 2 (end)
	

		ldr r6,=DAC0DAT		; load the address of DAC0DAT to r6
		MOV r3, #0xFF0000	; HIGH Wert
		MOV	r4, #0x0		;LOW Wert 
		
 		; <====== add code 3 (begin)
loop	
		STR r3, [r6]; 4
		NOP ;8*NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		STR r4, [r6] ;4
		NOP ;19*NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP										
		b       loop ;5			


stop  	b 		stop


							 			  		

		; <====== add code 3 (end)

		END	
		        
     