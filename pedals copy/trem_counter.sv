module trem_counter (input 			 Increment, Clear, Lrck,
							output logic	 [16:0] Count);
	
	always_ff @ (posedge Lrck)
	begin
	
		if (Clear)
			Count = 17'd0;
		else if (Increment)
			Count ++;
			
	end
	
endmodule
	
		