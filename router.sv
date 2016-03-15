module router(input [1:0] a_mux, b_mux, c_mux,
								  a_demux, b_demux, c_demux,
				  input 	     a_pedal, b_pedal, c_pedal, stomp_a, stomp_b, stomp_c,
				  input [23:0] audio_in, pedal_ao, pedal_bo, pedal_co,
				  output [23:0] audio_out, pedal_ai, pedal_bi, pedal_ci
);
//internal signals
logic [23:0] a_in, a_out, b_in, b_out, c_in, c_out;
logic [23:0] a_b,a_c,a_o,b_c,b_a,b_o,c_a,c_b,c_o;

//a
mux_24 mux_a(.a(audio_in),.b(b_a),.c(c_a),.d(),.sel(a_mux),.out(a_in));
dsp_pedal a(.audio_in(a_in),.out(a_out),.pedal_out(pedal_ao),.is_pedal(a_pedal),.pedal_in(pedal_ai),.stomp(stomp_a));
demux_24 demux_a(.in(a_out),.sel(a_demux),.out_a(a_b),.out_b(a_c),.out_c(a_o),.out_d());

//b
mux_24 mux_b(.a(a_b),.b(audio_in),.c(c_b),.d(),.sel(b_mux),.out(b_in));
dsp_pedal b(.audio_in(b_in),.out(b_out),.pedal_out(pedal_bo),.is_pedal(b_pedal),.pedal_in(pedal_bi),.stomp(stomp_b));
demux_24 demux_b(.in(b_out),.sel(b_demux),.out_a(b_c),.out_b(b_a),.out_c(b_o),.out_d());

//c
mux_24 mux_c(.a(b_c),.b(audio_in),.c(a_c),.d(),.sel(c_mux),.out(c_in));
dsp_pedal c(.audio_in(c_in),.out(c_out),.pedal_out(pedal_co),.is_pedal(c_pedal),.pedal_in(pedal_ci),.stomp(stomp_c));
demux_24 demux_c(.in(c_out),.sel(c_demux),.out_a(c_o),.out_b(c_b),.out_c(c_a),.out_d());


assign audio_out = (a_o + b_o + c_o);

endmodule : router