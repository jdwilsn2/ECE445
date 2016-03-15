module mux_24 (input [23:0] a, b, c, d,
					input [1:0] sel,
					output logic [23:0] out);
always_comb
begin
	case(sel)
	0 : out = a;
	1 : out = b;
	2 : out = c;
	3 : out = d;
	endcase
end
				
endmodule 