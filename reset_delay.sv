module reset_delay
(
	input clk,
	input reset,
	output reset_out
);
	logic [19:0] count;
	
	always_ff @(posedge clk)
	begin
	if(reset)
		count <= 20'h0000;
		
	else if(count != 20'hFFFFF)
		begin
			count <= count + 1;
			reset_out = 1'b0;
		end
		else
		begin
			reset_out = 1'b1;
		end
	end
	
endmodule : reset_delay