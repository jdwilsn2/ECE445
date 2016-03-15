module testbench;

timeunit 1ns;
timeprecision 1ns;

logic clk;
logic [2:0] route_case;
logic [23:0] audio_in, pedal_ao, pedal_bo, pedal_co, audio_out, pedal_ai, pedal_bi, pedal_ci;
logic a_pedal, b_pedal, c_pedal, stomp_a, stomp_b, stomp_c;

dsp_route test(.*);

initial 
begin 
route_case = 3'b000;
audio_in = 24'h123ABC;
pedal_ao = 24'h0;
pedal_bo = 24'h0;
pedal_co = 24'h0;
a_pedal = 1'b0;
b_pedal = 1'b0;
c_pedal = 1'b0;
stomp_a = 1'b1;
stomp_b = 1'b1;
stomp_c = 1'b1;
#100
route_case = 3'b011;
end



endmodule : testbench