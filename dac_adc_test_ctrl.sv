module dac_adc_test_ctrl 
(
	input CLOCK_50,
	input reset,
	input start,
	output begin_transmit,
	output begin_receive
);
enum int unsigned 
{
	s_idle,
	s_idle2,
	s_begin
} state, next_state;

always_comb //next state logic
begin
next_state = state;
	case(state)
	s_idle: begin
		if (start == 1) begin
		next_state = s_idle2;
		end
	end
	s_idle2: begin
		if (start == 0) begin	//debounce state
		next_state = s_begin;
		end
		else if (reset == 1) begin
		next_state = s_idle;
		end
	end
	s_begin: begin
		next_state = s_idle;
	end
	endcase
end

always_comb //state actions
begin
begin_transmit = 1'b0;
begin_receive = 1'b0;
	case(state)
	s_idle : /*do nothing*/ ;
	s_idle2 : /*do nothing*/ ;
	s_begin : begin
		begin_transmit <= 1'b1;
		begin_receive <= 1'b1;
	end
	default : /*do nothing*/ ;
	endcase	
end

always_ff @ (posedge CLOCK_50) // next state assignment
begin
	state <= next_state;
end
endmodule : dac_adc_test_ctrl