module dsp_pedal (input [23:0] pedal_out,
					   input [23:0] audio_in,
						input is_pedal, stomp,
						output logic [23:0] pedal_in,
						output logic [23:0] out);
//internal signals
logic [23:0] dsp_out;
assign pedal_in = audio_in;

dsp DSP (.in(audio_in),.out(dsp_out),.stomp(stomp));
mux_2 dspmux(.a(dsp_out),.b(pedal_out),.sel(is_pedal),.out(out));

endmodule 