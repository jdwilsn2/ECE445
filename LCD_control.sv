module LCD_control
(
	input clk, lcd_done, reset, begin_fsm,
	input up, down, enter, dist_on, trem_on, delay_on,
	output logic [4:0] index1, index2,
	output logic [7:0] cursor_pos,
	output logic [1:0] output_mux,
	output logic [2:0] route,
	output logic [7:0] register_select,
	output logic load_new_data, begin_tx
	
);
logic load_state;
enum logic [8:0]
{
	s_reset, stall, start,
	addr1, addr1_debounce, addr2, addr2_debounce, addr5, addr5_debounce,
	addr6, addr6_debounce, addr7, addr7_debounce, addr8, addr8_debounce,
	addr9, addr9_debounce, addr10, addr10_debounce, addr11, addr11_debounce,
	addr13, addr13_debounce, addr14, addr14_debounce, addr15, addr15_debounce, 
	addr16, addr16_debounce, addr18, addr18_debounce, addr19, addr19_debounce, 
	addr21, addr21_debounce, addr22, addr22_debounce, addr23, addr23_debounce,
	addr25, addr25_debounce, addr26, addr26_debounce, addr27, addr27_debounce, adjust,
	transmit, previous_state_debounce, adjust_debounce, transmit_debounce, adjust_bounce
} previous_state, state, next_state;


/*
	output logic [4:0] index1, index2,
	output logic [7:0] cursor_pos,
	output logic [1:0] output_mux,
	output logic [2:0] route,
	output logic [7:0] register_select,
	output logic load_new_data
*/
always_comb
begin
	index1 = 5'd0;
	index2 = 5'd1;
	cursor_pos = 8'd0;
	output_mux = 2'd0;
	route = 3'd0;
	register_select = 8'd0;
	load_new_data = 1'b0;
	begin_tx = 1'b0;
	
	case(state)
	addr1 : begin
	begin_tx = 1'b1;
	cursor_pos = 8'h40;
	end
	addr2 : begin
	index1 = 5'd2;
	index2 = 5'd3;
	begin_tx = 1'b1;
	end
	addr5 : begin
	index1 = 5'd4;
	index2 = 5'd5;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr6 : begin
	index1 = 5'd6;
	index2 = 5'd7;
	begin_tx = 1'b1;
	end
	addr7 : begin
	index1 = 5'd6;
	index2 = 5'd7;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr8 : begin
	index1 = 5'd8;
	index2 = 5'd9;
	begin_tx = 1'b1;
	end
	addr9 : begin
	index1 = 5'd8;
	index2 = 5'd9;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr10 : begin
	index1 = 5'd10;
	index2 = 5'd11;
	begin_tx = 1'b1;
	end
	addr11 : begin
	cursor_pos = 8'h40;
	if(previous_state == addr10)
	index1 = 5'd10;
	else if(previous_state == addr19)
	index1 = 5'd19;
	
	index2 = 5'd11;
	begin_tx = 1'b1;
	end
	addr13 : begin
	index1 = 5'd12;
	index2 = 5'd13;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;	
	end
	addr14 : begin
	index1 = 5'd14;
	index2 = 5'd15;
	begin_tx = 1'b1;
	end
	addr15 : begin
	index1 = 5'd14;
	index2 = 5'd15;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr16 : begin
	index1 = 5'd16; 
	index2 = 5'd3;
	begin_tx = 1'b1;
	end
	addr18 : begin
	index1 = 5'd17;
	index2 = 5'd18;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr19 : begin
	index1 = 5'd19;
	index2 = 5'd11;
	begin_tx = 1'b1;
	end
	addr21 : begin
	index1 = 5'd20;
	index2 = 5'd21;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr22 : begin
	index1 = 5'd22;
	index2 = 5'd23;
	begin_tx = 1'b1;
	end
	addr23 : begin
	index1 = 5'd22;
	index2 = 5'd23;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr25 : begin
	index1 = 5'd24;
	index2 = 5'd25;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	addr26 : begin
	index1 = 5'd26;
	index2 = 5'd27;
	begin_tx = 1'b1;
	end
	addr27 : begin
	index1 = 5'd26;
	index2 = 5'd27;
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
	end
	adjust : begin
	
	if(previous_state == addr18)
	begin
	output_mux = 2'd0;
	register_select = 8'b00000001;
	load_new_data = 1'b1;
	index1 = 5'd18;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr19)
	begin
	output_mux = 2'd1;
	register_select = 8'b00000010;
	load_new_data = 1'b1;
	index1 = 5'd19;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr21)
	begin
	output_mux = 2'd0;
	register_select = 8'b00000100;
	load_new_data = 1'b1;
	index1 = 5'd21;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr22)
	begin
	output_mux = 2'd1;
	register_select = 8'b00001000;
	load_new_data = 1'b1;
	index1 = 5'd22;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr23)
	begin
	output_mux = 2'd2;
	register_select = 8'b00010000;
	load_new_data = 1'b1;
	index1 = 5'd23;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr25)
	begin
	output_mux = 2'd0;
	register_select = 8'b00100000;
	load_new_data = 1'b1;
	index1 = 5'd25;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr26)
	begin
	output_mux = 2'd1;
	register_select = 8'b01000000;
	load_new_data = 1'b1;
	index1 = 5'd26;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	else if(previous_state == addr27)
	begin
	output_mux = 2'd1;
	register_select = 8'b10000000;
	load_new_data = 1'b1;
	index1 = 5'd27;
	index2 = 5'd31;
	begin_tx = 1'b1;
	end
	
	end
	
	/*
	output_mux = 8'd0;
	route = 3'd0;
	register_select = 8'd0;
	load_new_data = 1'b0;
	begin_tx = 1'b0;
	*/
	transmit : begin
	cursor_pos = 8'h40;
	begin_tx = 1'b1;
		case(previous_state)
		addr5 : begin
		route = 3'd0;
		load_new_data = 1'b1;
		end
		addr6 : begin
		route = 3'd1; 
		load_new_data = 1'b1;
		end
		addr7 : begin
		route = 3'd2;
		load_new_data = 1'b1;
		end
		addr8 : begin
		route = 3'd3;
		load_new_data = 1'b1;
		end
		addr9 : begin
		route = 3'd4;
		load_new_data = 1'b1;
		end
		addr10 : begin
		route = 3'd5;
		load_new_data = 1'b1;
		end
		endcase
	end
	endcase
end

always_comb //state transitions
begin
	load_state = 1'b0;
	next_state = state;
	state = previous_state;
	case(state)
		stall : begin
		if(reset)
		next_state = s_reset;
		else if(begin_fsm)
		next_state = start;
		end
		s_reset : begin
		if (!reset)
		next_state = stall;
		end
		start : begin
		if(!begin_fsm)
		next_state = addr1;
		end
		transmit : begin
			if(reset)
			next_state = s_reset;
			else
			next_state = addr1_debounce;
		end
		
		addr1 : begin
			if(reset)
			next_state = s_reset;
			else if(enter && lcd_done)
			begin
			next_state = addr5_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr2_debounce;
			load_state = 1'b1;
			end
		end
		addr2 : begin
			if(reset)
			next_state = s_reset;
			else if(enter && lcd_done)
			begin
				next_state = addr13_debounce;
				load_state = 1'b1;
			end
			else if(up && lcd_done)
			begin
				next_state = addr1_debounce;
				load_state = 1'b1;
			end
		end
		addr5 : begin
			if(reset)
			next_state = s_reset;
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr6_debounce;
			load_state = 1'b1;
			end
		end
		
		addr6 : begin
			if(reset)
			next_state = s_reset;
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
			else if(up && lcd_done)
			begin
			next_state = addr5_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr7_debounce;
			load_state = 1'b1;
			end
		end
		
		addr7 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr6_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr8_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
		end
		
		addr8 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr7_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr9_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
		end
		
		addr9 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr8_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr10_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
		end
		
		addr10 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr9_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr11_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = transmit_debounce;
			load_state = 1'b1;
			end
		end
		
		addr11 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = previous_state_debounce;
			end
			else if(enter && lcd_done)
			begin
			next_state = addr1_debounce;
			end
		end
		
		addr13 : begin
			if(reset)
			next_state = s_reset;
			else if(down && lcd_done)
			begin
			next_state = addr14_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = addr18_debounce;
			load_state = 1'b1;
			end
		end
		
		addr14 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr13_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr15_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = addr21_debounce;
			load_state = 1'b1;
			end
		end
		
		addr15 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr14_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr16_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = addr25_debounce;
			load_state = 1'b1;
			end
		end
		
		addr16 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			next_state = previous_state_debounce;
			else if(enter && lcd_done)
			next_state = addr1_debounce;
		end
		
		addr18 : begin
			if(reset)
			next_state = s_reset;
			else if(down && lcd_done)
			begin
			next_state = addr19_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr19 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr18_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr11_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr21 : begin
			if(reset)
			next_state = s_reset;
			else if(down && lcd_done)
			begin
			next_state = addr22_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr22 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr21_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr23_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr23 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr22_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr16_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr25 : begin
			if(reset)
			next_state = s_reset;
			else if(down && lcd_done)
			begin
			next_state = addr26_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr26 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr25_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr27_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		addr27 : begin
			if(reset)
			next_state = s_reset;
			else if(up && lcd_done)
			begin
			next_state = addr26_debounce;
			load_state = 1'b1;
			end
			else if(down && lcd_done)
			begin
			next_state = addr16_debounce;
			load_state = 1'b1;
			end
			else if(enter && lcd_done)
			begin
			next_state = adjust_debounce;
			load_state = 1'b1;
			end
		end
		
		adjust : begin
			if(reset)
			next_state = s_reset;
			else if((enter || up || down)  && lcd_done)
			next_state = adjust_bounce;
		end
		
		adjust_bounce : begin
			if(reset)
			next_state = s_reset;
			else if(!enter && !up && !down)
			next_state = previous_state_debounce;
		end
		previous_state_debounce : begin
			if(reset)
			next_state = s_reset;
			else if(!enter && !up && !down)
			next_state = previous_state;
		end
		addr1_debounce : begin
			if(!enter && !up && !down)
			next_state = addr1;
		end
		addr2_debounce : begin
			if(!enter && !up && !down)
			next_state = addr2;
		end
		addr5_debounce : begin
			if(!enter && !up && !down)
			next_state = addr5;
		end
		addr6_debounce : begin
			if(!enter && !up && !down)
			next_state = addr6;
		end
		addr7_debounce : begin
			if(!enter && !up && !down)
			next_state = addr7;
		end
		addr8_debounce : begin
			if(!enter && !up && !down)
			next_state = addr8;
		end
		addr9_debounce : begin
			if(!enter && !up && !down)
			next_state = addr9;
		end
		addr10_debounce : begin
			if(!enter && !up && !down)
			next_state = addr10;
		end
		addr11_debounce : begin
			if(!enter && !up && !down)
			next_state = addr11;
		end
		addr13_debounce : begin
			if(!enter && !up && !down)
			next_state = addr13;
		end
		addr14_debounce : begin
			if(!enter && !up && !down)
			next_state = addr14;
		end
		addr15_debounce : begin
			if(!enter && !up && !down)
			next_state = addr15;
		end
		addr16_debounce : begin
			if(!enter && !up && !down)
			next_state = addr16;
		end
		addr18_debounce : begin
			if(!enter && !up && !down)
			next_state = addr18;
		end
		addr19_debounce : begin
			if(!enter && !up && !down)
			next_state = addr19;
		end
		addr21_debounce : begin
			if(!enter && !up && !down)
			next_state = addr21;
		end
		addr22_debounce : begin
			if(!enter && !up && !down)
			next_state = addr22;
		end
		addr23_debounce : begin
			if(!enter && !up && !down)
			next_state = addr23;
		end
		addr25_debounce : begin
			if(!enter && !up && !down)
			next_state = addr25;
		end
		addr26_debounce : begin
			if(!enter && !up && !down)
			next_state = addr26;
		end
		addr27_debounce : begin
			if(!enter && !up && !down)
			next_state = addr27;
		end
		transmit_debounce : begin
			if(!enter && !up && !down)
			next_state = transmit;
		end
	endcase
end

always_ff @(posedge clk)
begin
	state <= next_state;
	if(load_state)
	previous_state <= state;
end

endmodule : LCD_control