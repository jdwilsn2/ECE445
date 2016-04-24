/*
 * The finite state machine for the tremolo pedal.
 * It controls two counters which give it feedback and
 * periodically enables the attenuator unit, which actually 
 * acts upon the guitar data. 
 */

module tremolo_fsm (	input logic					 Enable, 			// footswitch enable
															 Lrck,				// 52.083 kHz clock
															 Reset,				// System reset pin
							input logic			[7:0]	 Duty_Numerator,	// the numerator of the duty cycle ratio		 
							input	logic			[14:0] On_Count, 			// 17-bit On-Counter feedback
															 Off_Count,			// 17-bit Off-Counter feedback
															 Total_Period, 	// the total # of clock cycles of the tremolo period
							output logic				 Attenuate, 		// controls the Attenuator
															 On_Clear,			// Clears the On Counter
															 Off_Clear,			// Clears the Off Counter
															 On_Up,				// Increments the On Counter
															 Off_Up);				// Increments the Off Counter

							enum logic 					[2:0] {ON_CHECK, 		
															 ON_PLUS,
															 OFF_CHECK,
															 OFF_PLUS,
															 RESET,
															 WAIT} state,		// the 6 possible states
															 next_state;

							logic					[20:0] Off_Product;		// the product of Total_Period and Duty_Numerator (calculated)
							logic					[14:0] On_Period, 		// Period of the On Cycle (calculated)
															 Off_Period;		// Period of the Off Cycle (calculated)
	
	/*
	 * A combinational block 
	 */
	always_comb
	begin
	
		Off_Product = Total_Period * Duty_Numerator;			// 17 + 8 = 25 bit maximum
		Off_Period  = Off_Product[20:6];							// shift right 6 bits
		On_Period   = Total_Period + ~(Off_Period) + 1'b1;	// On + Off = Total_Period
			
		next_state = state;
		
		case (state)
		
			RESET : begin
				next_state = WAIT;
			end
			
			WAIT : begin
				if (Enable)
					next_state = ON_CHECK;
			end
			
			ON_CHECK : begin
				if (~Enable)
					next_state = RESET;
				else if (On_Count >= On_Period)
					next_state = OFF_CHECK;
				else
					next_state = ON_PLUS;
			end
			
			ON_PLUS : begin
				if (~Enable)
					next_state = RESET;
				else
					next_state = ON_CHECK;
			end
			
			OFF_CHECK : begin
				if (~Enable)
					next_state = RESET;
				else if (Off_Count >= Off_Period)
					next_state = ON_CHECK;
				else
					next_state = OFF_PLUS;
			end
			
			OFF_PLUS : begin
				if (~Enable)
					next_state = RESET;
				else
					next_state = OFF_CHECK;
			end
			
		endcase
	
	end
	
	
	always_ff @ (posedge Lrck, posedge Reset)
	begin
	
		if (Reset)
			state <= RESET;
		else
			state <= next_state;
			
	end
	
	always_comb
	begin
	
		case (state)
			RESET: begin
				On_Clear = 1'b1;
				Off_Clear = 1'b1;
				On_Up = 1'b0;
				Off_Up = 1'b0;
				Attenuate = 1'b0;
			end
			
			WAIT: begin
				On_Clear = 1'b0;
				Off_Clear = 1'b0;
				On_Up = 1'b0;
				Off_Up = 1'b0;
				Attenuate = 1'b0;
			end
			
			ON_CHECK: begin
				On_Clear = 1'b0;
				Off_Clear = 1'b1;
				On_Up = 1'b0;
				Off_Up = 1'b0;
				Attenuate = 1'b0;
			end
			
			ON_PLUS: begin
				On_Clear = 1'b0;
				Off_Clear = 1'b0;
				On_Up = 1'b1;
				Off_Up = 1'b0;
				Attenuate = 1'b0;
			end
			
			OFF_CHECK: begin
				On_Clear = 1'b1;
				Off_Clear = 1'b0;
				On_Up = 1'b0;
				Off_Up = 1'b0;
				Attenuate = 1'b1;
			end
			
			OFF_PLUS: begin
				On_Clear = 1'b0;
				Off_Clear = 1'b0;
				On_Up = 1'b0;
				Off_Up = 1'b1;
				Attenuate = 1'b1;
			end
			
		endcase
		
	end

endmodule



	