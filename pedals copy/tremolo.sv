module tremolo	(input logic				Enable, Lrck, Reset,
					 input logic	[7:0]		Rate, Depth, Duty_Cycle,
					 input logic	[23:0]	D_In,
					 output logic	[23:0]	D_Out);
					 
	logic On_Clear, Off_Clear, On_Up, Off_Up, Attenuate;
	logic [7:0]	 Duty_Numerator;
	logic [14:0] On_Period, Off_Period, On_Count, Off_Count, Total_Period;

	rate_lut RATE_LUT (.*);
	duty_lut DUTY_LUT (.*);
	tremolo_fsm LETSGOCUBS (.*);
	attenuator LETSGOHAWKS (.*);
	trem_counter ON_COUNTER (.*, .Increment(On_Up), .Clear(On_Clear), .Count(On_Count));
	trem_counter OFF_COUNTER (.*, .Increment(Off_Up), .Clear(Off_Clear), .Count(Off_Count));
	
	
	
endmodule
	