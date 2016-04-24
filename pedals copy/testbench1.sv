module testbench1 ();

	timeunit 10ns;

	timeprecision 1ns;

	logic Enable = 0;

	logic [23:0] D_In,
					 D_Out;
					 
	logic [7:0]  Drive, 
					 Volume;
					 
	distortion FOR_YOUR_CLIPS (.*);

	initial begin: TEST_VECTORS

	/*
	 * Verification 1: Setting Enable to logic­low
	 * (herein known as 0 V relative to GND) bypasses the unit
	 * and setting Enable to logic ­high sends the input
	 * signal through the unit.
	 */
	 
	// Disabled, D_In = D_Out no matter what Drive and Volume are
	Enable = 0;
	D_In = 24'h7fffff;
	Drive = 8'd0;
	Volume = 8'd127;

	// These values do not affect D_Out now.
	#5 Drive = 8'd100;
		Volume = 8'd15;

	// Enabled, Drive and Volume affect the signal.	
	#5 Enable = 1;

	#5 Drive = 8'd15;
		Volume = 8'd100;
	
	/*
	 * Verification 2: The magnitude of both positive and 
	 * negative values exceeding the potentiometer
	 * ­set clipping threshold, Drive, are clipped
	 * to the magnitude of the threshold.
	 */
	
	// Drive clips the signal if it exceeds the threshold it sets.
	#5 Drive = 8'd0;
		Volume = 8'd127;
		
	#5 Drive = 8'h08;
	
	// Drive does nothing if it does not exceed the threshold set.
	#5 D_In = 24'h00ffff;
	
	// This works for positive and negative values.
	#5 D_In = 24'h800000;
		Drive = 8'd0;
		Volume = 8'd127;
		
	#5 Drive = 8'h08;
	
	#5 D_In = 24'hff0001;
	
	/*
	 * Verification 3: Volume parameter effectively
	 * adjusts the gain of the unit, with unity gain at the
	 * center of the input spectrum (~8’d127) and complete mute
	 * (­ ∞ dB) at Volume = 8’d0.
	 */
	
	#5 D_In = 24'h700000;
		Drive = 8'h00;
		Volume = 8'd127;
	
	#5 Volume = 8'd108;
	#5 Volume = 8'd200;
	
	#5 Volume = 8'd0;
	
	#5 D_In = 24'h900000;
		Drive = 8'h00;
		Volume = 8'd127;
	
	#5 Volume = 8'd108;
	#5 Volume = 8'd205;
	
	#5 Volume = 8'd0;

	



	end

endmodule
