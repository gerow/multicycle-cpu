module ee357_2x32_mux(
	output [31:0] out,
	
	input   [31:0] zero,
	input   [31:0] one,
	input sel
	);
	
	wire [31:0] out;
	wire [31:0] zero;
	wire [31:0] one;
	wire sel;
	
	assign out = sel ? one : zero;
	
endmodule