module distortion (input  			         Enable,
						 input			  [23:0] D_In,
						 input 	   	  [7:0]  Drive,
						 input 			  [7:0]  Volume,
						 output logic    [23:0] D_Out);
	
	logic [23:0] D_Clipped, D_Boosted, D_On;
	
	clipper CLIPPER (.*);
	driver DRIVER (.*);
	
	always_comb
	begin
	
		if (Enable)
		begin
			D_On = D_In;
			D_Out = D_Boosted;
		end
		
		else
		begin
			D_On = 24'd0;
			D_Out = D_In;
		end
		
	end
	
endmodule

			
		
		