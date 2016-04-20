module deserializer
(
	input SCK,
	input in,
	input reset,
	input LRCK,
	input BCK,
	output logic [23:0] left,
	output logic [23:0] right
);
logic [23:0] running_left, running_right;


logic [4:0] count;
//logic old_lrck, lr_rise, lr_fall;
//assign lr_rise = (LRCK & !old_lrck);
//assign lr_fall = (old_lrck & !LRCK);

always @(posedge BCK or posedge reset)
begin
	//old_lrck = LRCK;
	if(reset)
	begin
		count = 5'd23;
	end
	
	else if (LRCK)
	begin
		running_left[count] <= in; //left channel
		count = count - 5'd1;
	end
	else if (!LRCK)
	begin
		running_right[count] <= in; //right channel
		count = count - 5'd1;
	end
	
	else if (count == 5'h00) //last one
	begin
	count = 5'd23;
	left = running_left;
	right = running_right;
	end
end

endmodule : deserializer