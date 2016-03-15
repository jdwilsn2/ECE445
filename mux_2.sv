module mux_2 (input [23:0] a, b,
				  input sel,
				  output logic [23:0] out);	  
	assign out = (sel) ? b : a;
endmodule 