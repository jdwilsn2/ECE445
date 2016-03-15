module router_control
(
	input [2:0] route_case,
	output logic [1:0] a_mux, b_mux, c_mux,
	output logic [1:0] a_demux, b_demux, c_demux
);
always_comb
begin
	a_mux = 2'b00;
	b_mux = 2'b00;
	c_mux = 2'b00;
	a_demux = 2'b00;
	b_demux = 2'b00;
	c_demux = 2'b00;
	case(route_case)
	0 : /*default case*/; //abc
	1 : begin				 //acb
	a_mux = 2'b00;
	b_mux = 2'b10;
	c_mux = 2'b10;
	a_demux = 2'b01;
	b_demux = 2'b10;
	c_demux = 2'b01;
	end
	2 : begin				 //bac
	a_mux = 2'b10;
	b_mux = 2'b01;
	c_mux = 2'b10;
	a_demux = 2'b10;
	b_demux = 2'b01;
	c_demux = 2'b00;
	end
	3 : begin				 //bca
	a_mux = 2'b10;
	b_mux = 2'b01;
	c_mux = 2'b00;
	a_demux = 2'b10;
	b_demux = 2'b00;
	c_demux = 2'b10;
	end
	4 : begin				 //cab
	a_mux = 2'b01;
	b_mux = 2'b00;
	c_mux = 2'b01;
	a_demux = 2'b00;
	b_demux = 2'b10;
	c_demux = 2'b10;
	end
	5 : begin				 //cba
	a_mux = 2'b10;
	b_mux = 2'b10;
	c_mux = 2'b01;
	a_demux = 2'b10;
	b_demux = 2'b01;
	c_demux = 2'b01;
	end
	default : ;
	endcase
end

endmodule : router_control 