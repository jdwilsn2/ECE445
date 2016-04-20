module serializer 
(
	input SCK,
	input [23:0] left,
	input [23:0] right,
	input reset,
	input LRCK,
	input BCK,
	output logic out
);
/*
BCK = 48*f_s = SCK / 8
LRCK = f_s
SCK = 384*f_s = 16934400 Hz
f_s = 44.1 kHz


Binary 2's complement MSB-first audio data
*/

logic [4:0] count; // count from 00000 to 10111 (24)
//logic old_lrck, lr_rise, lr_fall;
//assign lr_rise = (LRCK & !old_lrck);
//assign lr_fall = (old_lrck & !LRCK);

always @ (posedge BCK or posedge reset)
begin
	//old_lrck = LRCK;
	if (reset)
	begin
	count = 5'd23;
	end
	else if (LRCK) //left channel
	begin
		out = left[count];
		count = count - 5'd1;
	end
	else if (!LRCK) //right channel
	begin
		out = right[count];
		count = count - 5'd1;
	end
	
	else if (count == 5'h00) //last one
	begin
	count = 5'd23;
	end
end


endmodule : serializer