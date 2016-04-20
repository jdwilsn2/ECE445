module test
(
	input CLOCK_50,
	input [3:0] KEY, //key 0, 1
	input [17:0] SW, //LRSEL, //sw0
	output logic [17:0] LEDR,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	inout wire [35:0] GPIO,
	output logic SMA_CLKOUT,
	input logic SMA_CLKIN,
	output logic LCD_BLON,
	inout wire [7:0] LCD_DATA,
	output logic LCD_ON,
	output logic LCD_EN,
	output logic LCD_RS,
	output logic LCD_RW
	
	//output logic DAC_data, //GPIO0
	//input ADC_data, //GPIO2
	//output logic SCK, //GPIO 4
	//output logic LRCK, //GPIO 6
	//output logic BCK //GPIO 8
);
	logic LRSEL;
	logic SCK, LRCK, BCK;
	logic [23:0] deserializedL;
	logic [23:0] deserializedR;
	logic [23:0] to_7seg;
	logic reset, start;
	logic check;
	logic ADC_data, DAC_data;
	logic to_fsm_ACK, to_cpu_ACK;
	assign SCK = SMA_CLKIN;
	assign GPIO[3] = DAC_data;
	assign GPIO[35] = ADC_data;
	assign GPIO[21] = LRCK;
	assign GPIO[1] = BCK;
	assign LRSEL = SW[0];
	assign reset = ~KEY[0];
	assign start = ~KEY[1];
	assign LEDR[0] = reset;
	assign LEDR[1] = start;
	assign LEDR[2] = check;
//	assign SMA_CLKOUT = BCK;
logic begin_transmit, begin_receive;
dac_adc_test test0(.*);
dac_adc_test_ctrl test1(.*);
logic [23:0] reg_deserializedL, reg_deserializedR;
register #(.width(24)) reg_l 
(
	.clk(clk),
	.load(~KEY[3]),
	.in(deserializedL),
	.out(reg_deserializedL)
);

register #(.width(24)) reg_r
(
	.clk(clk),
	.load(~KEY[3]),
	.in(deserializedR),
	.out(reg_deserializedR)
);
logic [2:0] key_export;
assign key_export[0] = ~KEY[1];
assign key_export[1] = ~KEY[2];
assign key_export[2] = ~KEY[3];
logic [7:0] control_word;
/*
		input  wire       clk_clk,              //           clk.clk
		input  wire       reset_reset_n,        //         reset.reset_n
		output wire [7:0] control_words_export, // control_words.export
		input  wire [2:0] keys_export,          //          keys.export
		inout  wire [7:0] lcd_interface_DATA,   // lcd_interface.DATA
		output wire       lcd_interface_ON,     //              .ON
		output wire       lcd_interface_BLON,   //              .BLON
		output wire       lcd_interface_EN,     //              .EN
		output wire       lcd_interface_RS,     //              .RS
		output wire       lcd_interface_RW      //              .RW
		output wire       to_fsm_ack_external_connection_export, // to_fsm_ack_external_connection.export
		input  wire       to_cpu_ack_external_connection_export  // to_cpu_ack_external_connection.export
	);
*/
/*
nios_system NIOS2
(
	.clk_clk(clk),
	.reset_reset_n(KEY[0]),
	.control_words_export(control_word),
	.keys_export(key_export[2:0]),
	.lcd_interface_DATA(LCD_DATA),
	.lcd_interface_ON(LCD_ON),
	.lcd_interface_BLON(LCD_BLON),
	.lcd_interface_EN(LCD_EN),
	.lcd_interface_RS(LCD_RS),
	.lcd_interface_RW(LCD_RW),
	.to_fsm_ack_external_connection_export(to_fsm_ACK),
	.to_cpu_ack_external_connection_export(to_cpu_ACK)
	
);
*/

assign to_7seg = (LRSEL) ? reg_deserializedL : reg_deserializedR;

//test
SEG7_LUT u0 (.iDIG(to_7seg[3:0]),.oSEG(HEX0));
SEG7_LUT u1 (.iDIG(to_7seg[7:4]),.oSEG(HEX1));
SEG7_LUT u2 (.iDIG(to_7seg[11:8]),.oSEG(HEX2));
SEG7_LUT u3 (.iDIG(to_7seg[15:12]),.oSEG(HEX3));
SEG7_LUT u4 (.iDIG(to_7seg[19:16]),.oSEG(HEX4));
SEG7_LUT u5 (.iDIG(to_7seg[23:20]),.oSEG(HEX5));

endmodule : test