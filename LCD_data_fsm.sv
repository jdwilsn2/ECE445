module LCD_data_fsm
(
	input clk,
	output logic LCD_EN,
	input tx_start,
	output logic tx_resp
	
);
enum logic [2:0]
{
	stall,
	start,
	s_wait,
	finish
}state, next_state;
logic [4:0] count;
logic start_count, reset_count;

initial
begin
	count = 5'd0;
end

always @(posedge clk)
begin
 state = next_state;
 if(start_count)
	count += 1'd1; 
 else if(reset_count)
	count = 5'd0;
end

always_comb 
begin
	LCD_EN = 1'b0;
	tx_resp = 1'b0;
	start_count = 1'b0;
	reset_count = 1'b0;
	case(state)
	stall : 
	start : reset_count = 1'b1;
	s_wait : start_count = 1'b1;
	finish : begin
	LCD_EN = 1'b0;
	tx_resp = 1'b1;
	end
	endcase
end

always_comb
begin
	next_state = state;
	case(state)
		stall : begin
			if(tx_start)
			next_state = start;
		end
		
		start : begin
			next_state = s_wait;
		end
		
		s_wait : begin
			if (count == 15)
				next_state = finish;
		end
		
		finish : begin
		next_state = stall;
		end
	endcase
end

endmodule : LCD_data_fsm