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
	output ADC_SCK,	//ADC SCK
	output ADC_LRCK,	//ADC LRCK
	output ADC_BCK,	//ADC BCK
	output DAC_data,	//To DAC
	output DAC_SCK,	//DAC SCK
	output DAC_LRCK,	//DAC LRCK
	output DAC_BCK		//DAC BCK
);
	logic clk;
	assign clk = CLOCK_50;

	clk_pll dac_pll
	(
	.reset_reset_n(),
	.clk_clk(clk),
	.clk_o_clk(DAC_SCK),
	.altpll_0_areset_conduit_export(1'b0),
	.altpll_0_locked_conduit_export(),
	.altpll_0_phasedone_conduit_export()
	);
	clk_pll adc_pll
		(
	.reset_reset_n(),
	.clk_clk(clk),
	.clk_o_clk(ADC_SCK),
	.altpll_0_areset_conduit_export(1'b0),
	.altpll_0_locked_conduit_export(),
	.altpll_0_phasedone_conduit_export()
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
	.SCK(DAC_SCK),
	.left(deserializedL),
	.right(deserializedR),
	.begin_transmit(begin_transmit),
	.LRCK(DAC_LRCK),
	.BCK(DAC_BCK),
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
	.SCK(ADC_SCK),
	.in(ADC_data),
	.begin_receive(begin_receive),
	.LRCK(ADC_LRCK),
	.BCK(ADC_BCK),
	.left(deserializedL),
	.right(deserializedR)
	);
	
endmodule : dac_adc_test