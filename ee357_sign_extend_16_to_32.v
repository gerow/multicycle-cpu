module ee357_sign_extend_16_to_32 (
	input [15:0] in,
	output [31:0] out,
);
	
	wire in [15:0];
	wire out [31:0];
	
	assign out = {16{in[15]}, in};

endmodule