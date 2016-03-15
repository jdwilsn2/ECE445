module demux_24 (input [23:0] in,
					  input [1:0] sel,
					  output logic [23:0] out_a, out_b, out_c, out_d);
always_comb
	begin
		case(sel)
		0 : begin
			 out_a = in;
			 out_b = 24'h0;
			 out_c = 24'h0;
			 out_d = 24'h0;
			 end
		1 : begin
			 out_a = 24'h0;
			 out_b = in;
			 out_c = 24'h0;
			 out_d = 24'h0;		
			 end
		2 : begin
			 out_a = 24'h0;
			 out_b = 24'h0;
			 out_c = in;
			 out_d = 24'h0;		
			 end
		3 : begin
			 out_a = 24'h0;
			 out_b = 24'h0;
			 out_c = 24'h0;
			 out_d = in;		
			 end
		endcase
	end
endmodule 
