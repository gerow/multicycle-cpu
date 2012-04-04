module ee357_32reg(
	input [31:0] in,
	output[31:0] out,
	input enable,
	input sys_clk
	);
	
	wire	[31:0] in;
	wire	enable;
	wire	sys_clk;
	reg		[31:0] out;
	
	always@(posedge sys_clk)
	begin
		if(enable)
			out <= in;
	end

endmodule