/*
 * The driver for the LCD display of the software menu
 */

module LCD_driver 
(
	input clk,								// The clock
	input reset,							// The system reset
	input logic [7:0] DATA,					// The 8-bit data stream in from the software
	output logic [7:0] LCD_DATA,			// The 8-bit data stream out to the LCD
	output logic LCD_EN,					// Enable the LCD
	output logic LCD_RW,					// Read or write to the LCD
	output logic LCD_RS,			
	output logic LCD_ON						// LCD power-on signal
);

	logic en,rw,rs;
	assign LCD_ON = 1'b1;					// LCD is always on
	assign LCD_DATA = (en) ? DATA : 8'd0;	// If enabled, LCD_DATA is just what the software says it is. Else, it is 0.
	assign LCD_EN = en;						// feed logic versions of en, rw, and rs to the inputs
	assign LCD_RW = rw;
	assign LCD_RS = rs;
	
	enum int unsigned						// states of the FSM
	{
		s_idle,
		s_reset0,
		s_reset1,
		s_run0,
		s_run1
	} state, next_state;
	
always @ (posedge clk)//State transitions
begin
	next_state = state;

	case (state)

		s_idle : 
		begin
			if(reset == 1)
			next_state = s_reset0;
		end

		s_reset0 : 
		begin
			if(reset == 0)
			next_state = s_reset1;
		end

		s_reset1 : 
		begin
			next_state = s_run0;
		end

		s_run0 : 
		begin
			if(reset == 1)
			next_state = s_reset0;
			else
			next_state = s_run1;
		end

		s_run1 : 
		begin
			if(reset == 1)
			next_state = s_reset0;
		end

		default : ;

	endcase

end

always_comb //State Actions
begin

	en = 1'b0;
	rw = 1'b0;
	rs = 1'b0;

	case(state)

		s_idle : ;//nothing
		s_reset0 : ;//nothing
		s_reset1 : ;//nothing
		s_run0 : ;

		s_run1 : 
		begin
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