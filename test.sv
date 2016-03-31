module test
(
	input CLOCK_50,
	output logic DAC_data, //GPIO0
	input ADC_data, //GPIO2
	input reset_n, //key 0
	input start_n, //key 1
	input LRSEL, //sw0
	output logic LEDR0, LEDR1, LEDR2,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output logic SCK, //GPIO 4
	output logic LRCK, //GPIO 6
	output logic BCK //GPIO 8
);
	logic [23:0] deserializedL;
	logic [23:0] deserializedR;
	logic [23:0] to_7seg;
	logic reset, start;
	logic check;
	assign reset = ~reset_n;
	assign start = ~start_n;
	assign LEDR0 = reset;
	assign LEDR1 = start;
	assign LEDR2 = check;
logic begin_transmit, begin_receive;
dac_adc_test test0(.*);
dac_adc_test_ctrl test1(.*);

	assign to_7seg = (LRSEL) ? deserializedL : deserializedR;

//test
SEG7_LUT u0 (.iDIG(to_7seg[3:0]),.oSEG(HEX0));
SEG7_LUT u1 (.iDIG(to_7seg[7:4]),.oSEG(HEX1));
SEG7_LUT u2 (.iDIG(to_7seg[11:8]),.oSEG(HEX2));
SEG7_LUT u3 (.iDIG(to_7seg[15:12]),.oSEG(HEX3));
SEG7_LUT u4 (.iDIG(to_7seg[19:16]),.oSEG(HEX4));
SEG7_LUT u5 (.iDIG(to_7seg[23:20]),.oSEG(HEX5));

endmodule : test