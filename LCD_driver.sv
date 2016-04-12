module LCD_driver 
(
	input clk,
	input reset,
	input logic [7:0] DATA,
	output logic [7:0] LCD_DATA,
	output logic LCD_EN,
	output logic LCD_RW,
	output logic LCD_RS,
	output logic LCD_ON
);

	logic en,rw,rs;
	assign LCD_ON = 1'b1;
	assign LCD_DATA = (en) ? DATA : 8'd0;
	assign LCD_EN = en;
	assign LCD_RW = rw;
	assign LCD_RS = rs;
	
	enum int unsigned
	{
		s_idle,
		s_reset0,
		s_reset1,
		s_run0,
		s_run1
	} state, next_state;
	
always @(posedge clk)//State transitions
begin
	next_state = state;
	case(state)
	s_idle : begin
	if(reset == 1)
	next_state = s_reset0;
	end
	s_reset0 : begin
	if(reset == 0)
	next_state = s_reset1;
	end
	s_reset1 : begin
	next_state = s_run0;
	end
	s_run0 : begin
	if(reset == 1)
		next_state = s_reset0;
	else
		next_state = s_run1;
	end
	s_run1 : begin
	if(reset == 1)
	next_state = s_reset0;
	end
	default : ;
	endcase
end

always_comb //state actions
begin
	en = 1'b0;
	rw = 1'b0;
	rs = 1'b0;
	case(state)
	s_idle : ;//nothing
	s_reset0 : ;//nothing
	s_reset1 : ;//nothing
	s_run0 : ; 
	s_run1 : begin
	rs = 1'b1;
	end
	default : ;//nothing
	endcase
end

always @ (posedge clk)
begin
	next_state <= state;
end

endmodule : LCD_driver