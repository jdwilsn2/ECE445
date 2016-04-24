module testbench2();

	timeunit 10us;

	timeprecision 100ns;

	logic Lrck = 0;
	logic Enable, Reset;
	
	logic [7:0]  Rate, Depth, Duty_Cycle;
	logic [23:0] D_In, D_Out;
	
	tremolo FOR_YOUR_MODS (.*);
	
	always begin : CLOCK_GENERATION
		#1 Lrck = ~Lrck;
	end
	
	initial begin : TEST_VECTORS
	
	/*
	 * Verification 1: Setting Enable to logic-low bypasses the unit
	 * and setting Enable to logic-high sends the input signal
	 * to the unit.
	 */
	 
	// Disabled, D_In = D_Out regardless of other parameter values.
	Enable = 0;
	Reset = 0;
	D_In = 24'h7FFFFF;
	Rate = 8'd0;
	Depth = 8'hFF;
	Duty_Cycle = 8'd127;
	
	#10000 Reset = 1'b1;
	#10000 Reset = 1'b0;
	
	// Wait ~1s to show that no tremolo is happening
	
	#100000 Enable = 1;
	
	// Enabled, and with the parameters as they are, we should see a tremolo
	// with complete attenuation at ~10 Hz with a 50/50 duty cycle.
	
	/*
	 * Verification 2: The potentiometer-controlled parameter Rate adjusts
	 * the frequency of the modulation on the input signal, never entering
	 * the audible frequency range.
	 */
	 
	/*
	 * Verification 3: The potentiometer-controlled parameter Depth adjusts
	 * the attenuation multiplier on the signal during the "off" cycle of
	 * the modulation, completely muting the signal when set to max.
	 */

	/*
	 * Verification 4: The potentiometer-controlled parameter Duty Cycle
	 * adjusts the time ratio between the "on" and "off" cycles of its
	 * modulation, and the ratio sits at unity when set to 8'd127.
	 */
	
	#200000 Rate = 8'hFF;
	
	#200000 Rate = 8'h00;
				Depth = 8'd127;
				
	#200000 Depth = 8'hFF;
				Duty_Cycle = 8'd200;
				
	#200000 Duty_Cycle = 8'h00;
	
	
	end
	
endmodule


	
	
	
	