module clk_div_2N #(parameter WIDTH = 3, parameter N = 4) //default for division by 8
(
	input clk,
	input reset,
	output clk_out
);
logic [WIDTH-1:0] count;
logic [WIDTH-1:0] next;
logic running_clk;

always @ (posedge clk or posedge reset)
begin
	if (reset)
	begin
		count <= 0;
		running_clk <= 0;
	end
	
	else if (next == N)
	begin
		count <= 0;
		running_clk <= ~running_clk;
	end
	
	else
		count <= next;
end

assign next = count + 1;
assign clk_out = running_clk;

endmodule : clk_div_N