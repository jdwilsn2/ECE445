
/*
/ Simple clipping operation - chops the tops off with respect
/ to the user parameter Drive. Phase 1 of the fully  combinational
/ distortion unit.
*/
module clipper (input				[23:0] D_On,		 // signal from input demux
					 input				[7:0] Drive,		 // user-set threshold
					 output logic		[23:0] D_Clipped); // output to driver module
					 
	logic		[23:0] threshhold, drive_shifted;				 				 
	always_comb
	begin
	
		drive_shifted[23] = 0;
		drive_shifted[14:0] = 0;
		drive_shifted[22:15] = Drive;	
		threshhold = 24'h7FFFFF - drive_shifted + 1'b1; //now Drive is a proper threshhold
		
		// if D_On is negative and its magnitude is greater than threshhold,
		if ( (D_On[23]) && ( ( ~(D_On) + 1'b1 ) > threshhold ) ) 
		//	 clip while keeping the negative sign
			D_Clipped = ~(threshhold) + 1'b1;
		// else if D_On is positive and its magnitude exceeds threshhold,
		else if ( ( ~(D_On[23]) ) && (D_On > threshhold) )
		// clip while keeping positive sign
			D_Clipped = threshhold;
		// else, pass original value through
		else
			D_Clipped = D_On;
					
	end
	
endmodule

		
		