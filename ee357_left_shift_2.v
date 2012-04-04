module ee357_left_shift_2 (
	input [31:0] in,
	output [31:0] out
);
	
	wire [31:0] in;
	wire [31:0] out;

	assign out = {in[29:0], 2'b0};
	
endmodule