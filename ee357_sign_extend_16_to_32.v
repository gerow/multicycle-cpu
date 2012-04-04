module ee357_sign_extend_16_to_32 (
	input [15:0] in,
	output [31:0] out
);
	
	wire [15:0] in;
	wire [31:0] out;
	
	//wire sign;
	
	//assign sign = in[15];
	//{16{in[15]}}
	assign out = { {16{ in[15] }}, in};
	
	//assign out = 32'b0;

endmodule