module deserializer
(
	input SCK,
	input in,
	input begin_receive,
	input LRCK,
	input BCK,
	output [23:0] left,
	output [23:0] right
);
logic [23:0] running_left, running_right;


logic [4:0] count;
logic old_lrck, lr_rise, lr_fall;
assign lr_rise = (LRCK & !old_lrck);
assign lr_fall = (old_lrck & !LRCK);

always @(negedge BCK or posedge begin_receive)
begin
	old_lrck = LRCK;
	if(begin_receive)
	begin
		count <= 5'd23;
	end
	
	else if (lr_rise)
	begin
		running_left[count] <= in; //left channel
	end
	else if (lr_fall)
	begin
		running_right[count] <= in; //right channel
	end
	
	else if (count == 5'h00) //last one
	begin
	count <= 5'd23;
	left <= running_left;
	right <= running_right;
	end
	else
	count <= count - 5'd1;
end

endmodule : deserializer