module serializer 
(
	input SCK,
	input [23:0] left,
	input [23:0] right,
	input begin_transmit,
	output LRCK,
	output BCK,
	output out
);

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
.reset(begin_transmit),
.clk_out(BCK)
);

clk_div_2N div_384 #(.WIDTH(8), .N(9'd192)) //Since you do a division by 2N, 192 * 2 = 384
(
.clk(SCK)
.reset(begin_transmit),
.clk_out(LRCK)
);

logic [4:0] count; // count from 00000 to 10111 (24)

always @ (posedge BCK or posedge begin_transmit)
begin
	if (begin_transmit)
	begin
	count <= 5'b10111;
	end
	if (LRCK == 1) //left channel
	begin
		out <= left[count];
	end
	else if (LRCK == 0) //right channel
	begin
		out = right[count];
	end
	
	if (count == 5'h00) //last one
	begin
	count <= 5'b10111;
	end
	else
	count = count - 1;
end


endmodule : serializer