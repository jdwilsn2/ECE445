module dsp(input [23:0] in,
			  input stomp,
			  output logic [23:0] out);
			 assign out = (stomp) ?  (in + 23'h1) : in; 
endmodule 