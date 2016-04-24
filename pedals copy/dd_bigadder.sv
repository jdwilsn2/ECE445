module dd_bigadder (input 			[23:0]	D_In,
														Repeat1,
														Repeat2,
														Repeat3,
														Repeat4,
														Repeat5,
						  output logic	[23:0]	D_Summed);
	
	logic [23:0] D_Sum1, D_Sum2, D_Sum3, D_Sum4;
	
	always_comb
	begin
	
		D_Sum1 = D_In + Repeat1;
		D_Sum2 = D_Sum1 + Repeat2;
		D_Sum3 = D_Sum2 + Repeat3;
		D_Sum4 = D_Sum3 + Repeat4;
		D_Summed = D_Sum4 + Repeat5;
		
	end
	
endmodule

