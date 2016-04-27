module LCD_module
(
	input clk,
	input [127:0] line1, line2,
	input begin_tx,
	input [7:0] cursor_pos,
	input reset,
	output logic done,
	output logic [7:0] lcd_dout,
	output logic lcd_rs, lcd_rw, lcd_en, begin_fsm
);
enum logic [4:0] 
{
	stall,	//wait for stuff to happen
	s_reset,	//if reset go here
	increment_LUT, //for initializing it
	initial_tx,
	s_wait, //Gotta wait 'cause this thing is slow
	increment_LINE, //For tx data
	data_tx,
	increment_LINE_wait, //Gotta wait
	set_cursors0, //Set cursor after one line has been complete
	cursor0_tx,
	cursor1_tx,
	set_cursors1	//set cursor to desired cursor position
} state, next_state;

logic start_tx, tx_resp;
logic [17:0] delay_count; //for counting the delay
logic [17:0] delay_count1; //for counting the delay
logic [3:0] lut_count; //for incrementing the LUT
logic line_count; //for changing lines
logic [3:0] index; //for indexing the 128 bit input
logic [7:0] cursor_position;
logic [8:0] internal_data;
logic lut_inc, line_inc, index_inc;
logic lut_reset, line_reset, index_reset;

always_ff @ (posedge clk)
begin
	state <= next_state;
	case(state)
		stall : begin
			delay_count <= 0;
			delay_count1 <= 0;
		end
		s_wait: begin
			delay_count <= delay_count + 1'b1;
		end
		increment_LINE_wait : begin
			delay_count1 <= delay_count1 + 1'b1;
		end
		increment_LINE : begin
			delay_count <= 0;
			delay_count1 <= 0;
		end
		increment_LUT : begin
			delay_count <= 0;
			delay_count1 <= 0;
		end
	endcase
	if(lut_inc)
		lut_count += 1'b1;
	else if (lut_reset)
		lut_count = 1'b0;
	if(line_inc)
		line_count += 1'b1;
	else if(line_reset)
		line_count = 1'b0;
	if(index_inc)
		index += 1'b1;
	else if(index_reset)
		index = 1'b0;
end
initial
begin
	index = 4'b0000;
end
/*
	output logic done,
	output logic [7:0] lcd_dout,
	output logic lcd_rs, lcd_rw, lcd_en
*/
always_comb //state actions
begin
	done = 1'b0;
	lcd_dout = 7'd0;
	lcd_rs = 1'b0;
	lcd_rw = 1'b0;
	start_tx = 1'b0;
	lut_inc = 1'b0;
	lut_reset = 1'b0;
	line_inc = 1'b0;
	line_reset = 1'b0;
	index_inc = 1'b0;
	index_reset = 1'b0;
	case(state)
		stall : begin
		line_reset = 1'b1;
		index_reset = 1'b1;
		lut_reset = 1'b1;
		end
		increment_LUT : lut_inc = 1'b1;
		initial_tx : begin
			lcd_dout = internal_data[7:0];
			lcd_rs = internal_data[8];
			start_tx = 1'b1;
		end
		increment_LINE : 
		begin
			index_inc = 1'b1;
			if(index == 4'd15)
			begin
				index_reset = 1'b1;
				line_inc = 1'b1;
			end
		end
		data_tx : begin
			if(line_count)
				if(index == 4'd15)
				lcd_dout = line1[127:120];
				else if (index == 4'd14)
				lcd_dout = line1[119:112];
				else if (index == 4'd13)
				lcd_dout = line1[111:104];
				else if (index == 4'd12)
				lcd_dout = line1[103:96];
				else if (index == 4'd11)
				lcd_dout = line1[95:88];
				else if (index == 4'd10)
				lcd_dout = line1[87:80];
				else if (index == 4'd09)
				lcd_dout = line1[79:72];
				else if (index == 4'd08)
				lcd_dout = line1[71:64];
				else if (index == 4'd07)
				lcd_dout = line1[63:56];
				else if (index == 4'd06)
				lcd_dout = line1[55:48];
				else if (index == 4'd05)
				lcd_dout = line1[47:40];
				else if (index == 4'd04)
				lcd_dout = line1[39:32];
				else if (index == 4'd03)
				lcd_dout = line1[31:24];
				else if (index == 4'd02)
				lcd_dout = line1[23:16];
				else if (index == 4'd01)
				lcd_dout = line1[15:8];
				else if (index == 4'd00)
				lcd_dout = line1[7:0];
			else
				if(index == 4'd15)
				lcd_dout = line2[127:120];
				else if (index == 4'd14)
				lcd_dout = line2[119:112];
				else if (index == 4'd13)
				lcd_dout = line2[111:104];
				else if (index == 4'd12)
				lcd_dout = line2[103:96];
				else if (index == 4'd11)
				lcd_dout = line2[95:88];
				else if (index == 4'd10)
				lcd_dout = line2[87:80];
				else if (index == 4'd09)
				lcd_dout = line2[79:72];
				else if (index == 4'd08)
				lcd_dout = line2[71:64];
				else if (index == 4'd07)
				lcd_dout = line2[63:56];
				else if (index == 4'd06)
				lcd_dout = line2[55:48];
				else if (index == 4'd05)
				lcd_dout = line2[47:40];
				else if (index == 4'd04)
				lcd_dout = line2[39:32];
				else if (index == 4'd03)
				lcd_dout = line2[31:24];
				else if (index == 4'd02)
				lcd_dout = line2[23:16];
				else if (index == 4'd01)
				lcd_dout = line2[15:8];
				else if (index == 4'd00)
				lcd_dout = line2[7:0];
				
			lcd_rs = 1'b1;
			start_tx = 1'b1;
		end
		set_cursors1 : done = 1'b1;
		cursor0_tx : begin
			lcd_dout = 8'h80;
			lcd_rs = 1'b0;
			start_tx = 1'b1;
		end
		cursor1_tx : begin
			lcd_dout = {1'b1,cursor_pos[6:0]};
			lcd_rs = 1'b0;
			start_tx = 1'b1;
		end
	endcase
end

always_comb//state transitions
begin
	next_state = state;
	begin_fsm = 1'b0;
	case(state)
	stall : begin
		if(reset)
		next_state = s_reset;
		else if(begin_tx)
		next_state = cursor0_tx;
	end
	s_reset : begin
		if(!reset)
		next_state = initial_tx;
	end
	increment_LUT : begin
		next_state = s_wait;
	end
	initial_tx : begin
		if(tx_resp)
		next_state = increment_LUT;
	end
	s_wait : begin
		if((delay_count == 18'h3FFFE) && (lut_count == 4'd5))
		begin
			next_state = stall;
			begin_fsm = 1'b1;
		end
		else if(delay_count == 13'h3FFFE) 
			next_state = increment_LUT;
	end
	
	increment_LINE_wait : begin
		if((delay_count == 18'h3FFFE) && (line_count == 1'b1) && (index == 4'd15))
		next_state = cursor1_tx;
		else if ((delay_count == 18'h3FFFE))
		next_state = increment_LINE;
	end
	increment_LINE : begin
		next_state = data_tx;
	end
	data_tx : begin
		if(tx_resp)
		next_state = increment_LINE_wait;
	end
	set_cursors0 : begin
		next_state = increment_LINE_wait;
	end
	cursor0_tx : begin
		if(tx_resp)
		next_state = set_cursors0;
	end
	set_cursors1 : begin
		next_state = stall;
	end
	cursor1_tx : begin
		if(tx_resp)
		next_state = set_cursors1;
	end
	
	endcase
end

always_comb
begin
	case(lut_count)
	0 : internal_data <= 9'h038;
	1 : internal_data <= 9'h00e;
	2 : internal_data <= 9'h001;
	3 : internal_data <= 9'h006;
	4 : internal_data <= 9'h080;
	default : internal_data <= 9'd0;
	endcase
end

LCD_data_fsm tx_fsm
(
	.clk,
	.LCD_EN(lcd_en),
	.tx_start(start_tx),
	.tx_resp(tx_resp)
);

endmodule : LCD_module
