module dsp_route (input clk,
					   input logic [2:0] route_case,
						input logic [23:0] audio_in, pedal_ao, pedal_bo, pedal_co,
						input a_pedal, b_pedal, c_pedal, stomp_a, stomp_b, stomp_c,
						output logic [23:0] audio_out, pedal_ai, pedal_bi, pedal_ci
);
//internal signals
logic [1:0] a_mux, b_mux, c_mux, a_demux, b_demux, c_demux;

router route(.*);
router_control control(.*);

endmodule : dsp_route