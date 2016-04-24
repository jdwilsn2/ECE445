module digital_delay (input logic				Enable, 
															Clk,
															Reset,
															SRAM_CE_N,
															SRAM_OE_N,
															SRAM_WE_N,
															SRAM_UB_N,
															SRAM_LB_N,
							 input logic	[7:0] 	Time, 
															Repeats,
															Mix,
							 input logic	[19:0]	SRAM_ADDR,
							 inout			[15:0]	SRAM_DQ,
							 input logic	[23:0]	D_In,
							 output logic	[23:0]	D_Out);


	always_comb
	begin
	
	end
	
endmodule

							
	