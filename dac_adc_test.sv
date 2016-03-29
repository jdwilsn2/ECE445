module dac_adc_test 
(
	input CLOCK_50,	//50 MHz clock
//	input [23:0] serializemeL,
//	input [23:0] serializemeR,
	output [23:0] deserializedL,
	output [23:0] deserializedR,
	input begin_transmit,
	input begin_receive,
	input ADC_data, 	//From ADC
	output DAC_data,	//To DAC
	output SCK,	//DAC SCK
	output LRCK,	//DAC LRCK
	output BCK		//DAC BCK
);
	logic clk;
	assign clk = CLOCK_50;

	clk_pll dac_pll
	(
	.reset_reset_n(),
	.clk_clk(clk),
	.clk_o_clk(SCK),
	.altpll_0_areset_conduit_export(1'b0),
	.altpll_0_locked_conduit_export(),
	.altpll_0_phasedone_conduit_export()
	);
	/*
BCK = 48*f_s = SCK / 8
LRCK = f_s
SCK = 384*f_s = 16934400 Hz
f_s = 44.1 kHz


Binary 2's complement MSB-first audio data
*/
clk_div_2N div_8 //Divide SCK by 8 to get BCK, set defaults to 8
(
.clk(SCK),
.reset(begin_receive),
.clk_out(BCK)
);

clk_div_2N  #(.WIDTH(8), .N(9'd192)) div_384 //Since you do a division by 2N, 192 * 2 = 384
(
.clk(SCK),
.reset(begin_receive),
.clk_out(LRCK)
);

	/*
	input SCK,
	input [23:0] left,
	input [23:0] right,
	input begin_transmit,
	output LRCK,
	output BCK,
	output out
	*/
	serializer to_DAC
	(
	.SCK(SCK),
	.left(deserializedL),
	.right(deserializedR),
	.begin_transmit(begin_transmit),
	.LRCK(LRCK),
	.BCK(BCK),
	.out(DAC_data)
	);
	
	/*
	input SCK,
	input in,
	input begin_receive,
	output LRCK,
	output BCK,
	output [23:0] left,
	output [23:0] right
	*/
	
	deserializer to_ADC
	(
	.SCK(SCK),
	.in(ADC_data),
	.begin_receive(begin_receive),
	.LRCK(LRCK),
	.BCK(BCK),
	.left(deserializedL),
	.right(deserializedR)
	);
	
endmodule : dac_adc_test