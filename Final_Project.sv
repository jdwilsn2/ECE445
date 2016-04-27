module Final_Project
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
);
//TURN ON LCD
assign LCD_BLON = 1'b0;
assign LCD_ON = 1'b1;

//name to a conventional clock
logic clk;
assign clk = CLOCK_50;

logic keys[2:0];
assign keys[0] = ~KEY[1];
assign keys[1] = ~KEY[2];
assign keys[2] = ~KEY[3];

logic [1:0] output_mux; //shows current output (would go to GPIO in full system)
logic [2:0] route;	//The current route
logic load_new_data; //register load signal
logic [1:0] to_gpio_mux; //mux to go to GPIO ideally
logic [7:0] register_select; //used to load pot values into appropriate registers
logic [7:0] pot_in;	//The potentiometer value. 

logic [127:0]display_table[4:0]; //an array holding all the values to be displayed on the screen
logic reset;	//Let's have a proper reset
assign reset = ~KEY[0]; //Stupid negative edge
assign pot_in[7:0] = SW[10:3];//Ideally this would be GPIO in from an 8 bit ADC
/* ROUTER LOGIC */
logic [2:0] to_router;
logic [1:0] a_mux, b_mux, c_mux, a_demux, b_demux, c_demux;
logic [23:0] audio_in, pedal_ao, pedal_bo, pedal_co;
logic [23:0] audio_out, pedal_ai, pedal_bi, pedal_ci;
logic a_pedal, b_pedal, c_pedal, stomp_a, stomp_b, stomp_c;
SEG7_LUT u0 (.iDIG({1'b0,to_router[2:0]}),.oSEG(HEX0)); //Shows the current route on hex0
/* END ROUTER LOGIC */
logic [7:0] drive, volume, rate, depth, duty_cycle, times, mix, repeats; //inputs for these variables;
//START ROUTER
register #(.width(3)) route_reg
(
	.clk,
	.load(load_new_data),
	.in(route[2:0]),
	.out(to_router[2:0])
);
router_control control_route
(
	.route_case(to_router[2:0]),
	.*
);
router routes
(.*);
//END ROUTER

register #(.width(2)) mux_reg
(
	.clk,
	.load(load_new_data),
	.in(output_mux),
	.out(to_gpio_mux)
);
SEG7_LUT u1 (.iDIG({2'b00,to_gpio_mux[1:0]}),.oSEG(HEX1)); //Put the current parameter for the mux here on seg2


/*LCD MODULE START*/
assign display_table[5'h00] = 128'h202020204D41494E4D454D4F52592020;
assign display_table[5'h01] = 128'h2A20524F555445202020202020202019;
assign display_table[5'h02] = 128'h2A2041444A20504152414D2020202018;
assign display_table[5'h03] = 128'h20202020202020202020202020202020;
assign display_table[5'h04] = 128'h202020524F555445204D454E55202020;
assign display_table[5'd05] = 128'h2A204110421043202020202020202019;
assign display_table[5'h06] = 128'h2A204110421042202020202020202018;
assign display_table[5'h07] = 128'h2A204210411043202020202020202019;
assign display_table[5'h08] = 128'h2A204210431041202020202020202018;
assign display_table[5'h09] = 128'h2A204310411042202020202020202019;
assign display_table[5'h0a] = 128'h2A204310421041202020202020202018;
assign display_table[5'h0b] = 128'h2A2052455455524E1720202020202020;
assign display_table[5'h0c] = 128'h41444A55535420504152414D45544552;
assign display_table[5'h0d] = 128'h2A20413D444953544F5254494F4E2019;
assign display_table[5'h0e] = 128'h2A20423D5452454D4F4C4F2020202018;
assign display_table[5'h0f] = 128'h2A20433D44454C414920202020202019;
assign display_table[5'h10] = 128'h2A2052455455524E1720202020202018;
assign display_table[5'h11] = 128'h2020444953544F5254494F4E204F4E20;
assign display_table[5'h12] = 128'h2A204452495645202020202020202019;
assign display_table[5'h13] = 128'h2A20564F4C554D452020202020202018;
assign display_table[5'h14] = 128'h2020205452454D4F4C4F204F4E202020;
assign display_table[5'h15] = 128'h2A205241544520202020202020202019;
assign display_table[5'h16] = 128'h2A204445505448202020202020202018;
assign display_table[5'h17] = 128'h2A2044555459204359434C4520202019;
assign display_table[5'h18] = 128'h2020202044454C4159204F4E20202020;
assign display_table[5'h19] = 128'h2A2054494D4520202020202020202019;
assign display_table[5'h1a] = 128'h2A204D49582020202020202020202018;
assign display_table[5'h1b] = 128'h2A205245504541545320202020202019;
assign display_table[5'h1c] = 128'h20205452454D4F4C4F204F4646202020;
assign display_table[5'h1d] = 128'h20444953544F5254494F4E204F464620;
assign display_table[5'h1e] = 128'h20202044454C4159204F464620202020;
assign display_table[5'h1f] = 128'h2020202020202A2A2A20202020202020;

logic to_LCD_module_reset, begin_tx;
logic [7:0] cursor_pos;
logic [4:0] index1, index2;
logic lcd_done, begin_fsm;

reset_delay delay_dat_reset(.clk,.reset, .reset_out(to_LCD_module_reset));

LCD_module FOR_YOUR_PIXELS
(
			.clk, .line1(display_table[index1]), .line2(display_table[index2]),
			.begin_tx(begin_tx), .cursor_pos(cursor_pos),
			.reset(to_LCD_module_reset), .done(lcd_done),
			.lcd_dout(LCD_DATA[7:0]),.lcd_rs(LCD_RS),.lcd_rw(LCD_RW),
			.lcd_en(LCD_EN), .begin_fsm(begin_fsm)
);
/*LCD MODULE END*/
LCD_control FOR_Y0UR_CURSORS //basically the software menu
(
	.clk, .index1(index1[4:0]), .index2(index2[4:0]), .up(keys[2]), .down(keys[1]), .enter(keys[0]),
	.lcd_done(lcd_done), .cursor_pos(cursor_pos[7:0]), .reset(to_LCD_module_reset),
	.output_mux(output_mux[1:0]), .route(route[2:0]), .load_new_data(load_new_data),
	.register_select(register_select[7:0]), .begin_fsm(begin_fsm), .begin_tx(begin_tx),
	.dist_on(SW[0]),.trem_on(SW[1]),.delay_on(SW[2])
);



/*
Uh... Go with:

Distortion: 100 - 135
Tremolo: 0 - 255 - 127
Delay: 127 - 255 - 127
*/
logic [7:0] drive_in;
assign drive_in = (reset) ? 8'd100 : pot_in[7:0];//reset, then go to default value
register #(.width(8)) drive_reg
(
	.clk,
	.load(load_new_data && register_select[0] | reset),
	.in(drive_in),
	.out(drive)
);

logic [7:0] volume_in;
assign volume_in = (reset) ? 8'd135 : pot_in[7:0];
register #(.width(8)) vol_reg
(
	.clk,
	.load(load_new_data && register_select[1] | reset),
	.in(volume_in),
	.out(volume)
);

logic [7:0] rate_in;
assign rate_in = (reset) ? 8'd0 : pot_in[7:0];
register #(.width(8)) rate_reg
(
	.clk,
	.load(load_new_data && register_select[2] | reset),
	.in(rate_in),
	.out(rate)
);

logic [7:0] depth_in;
assign depth_in = (reset) ? 8'd255 : pot_in[7:0];
register #(.width(8)) depth_reg
(
	.clk,
	.load(load_new_data && register_select[3] | reset),
	.in(depth_in),
	.out(depth)
);

logic [7:0] duty_cycle_in;
assign duty_cycle_in = (reset) ? 8'd127 : pot_in[7:0];
register #(.width(8)) duty_cycle_reg
(
	.clk,
	.load(load_new_data && register_select[4] | reset),
	.in(duty_cycle_in),
	.out(duty_cycle)
);

logic [7:0] time_in;
assign time_in = (reset) ? 8'd127 : pot_in[7:0];
register #(.width(8)) time_reg
(
	.clk,
	.load(load_new_data && register_select[5] | reset),
	.in(time_in),
	.out(times)
);

logic [7:0] mix_in;
assign mix_in = (reset) ? 8'd255 : pot_in[7:0];
register #(.width(8)) mix_reg
(
	.clk,
	.load(load_new_data && register_select[6] | reset),
	.in(mix_in),
	.out(mix)
);

logic [7:0] repeat_in;
assign repeat_in = (reset) ? 8'd127 : pot_in[7:0];
register #(.width(8)) repeats_reg
(
	.clk,
	.load(load_new_data && register_select[7] | reset),
	.in(repeat_in),
	.out(repeats)
);
endmodule : Final_Project
