module deserializer
(
	input SCK,
	input in,
	input begin_receive,
	output LRCK,
	output BCK,
	output [23:0] left,
	output [23:0] right
);
logic [23:0] running_left, running_right;
/*
BCK = 48*f_s = SCK / 8
LRCK = f_s
SCK = 384*f_s = 16934400 Hz
f_s = 44.1 kHz


Binary 2's complement MSB-first audio data
*/
clk_div_2N div_8 //Divide SCK by 8 to get BCK, set defaults to 8
(
.clk(SCK),
.reset(begin_receive),
.clk_out(BCK)
);

clk_div_2N div_384 #(.WIDTH(8), .N(9'd192)) //Since you do a division by 2N, 192 * 2 = 384
(
.clk(SCK)
.reset(begin_receive),
.clk_out(LRCK)
);

logic [4:0] count;



always @(posedge BCK or posedge begin_receive)
begin
	if(begin_receive)
	begin
		count <= 5'h00;
	end
	
	if (LRCK == 1)
	begin
		running_left[count] <= in; //left channel
	end
	else if (LRCK == 0)
	begin
		running_right[count] <= in; //right channel
	end
	
	if (count == 5'b10111) //last one
	begin
	count <= 5'h00;
	left <= running_left;
	right <= running_right;
	end
	else
	count = count + 1;
end

endmodule : deserializer