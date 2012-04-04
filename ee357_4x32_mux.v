module ee357_4x32_mux(
	output [31:0] out,
	
	input   [31:0] zero,
	input   [31:0] one,
	input	[31:0] two,
	input	[31:0] three,
	input	[1:0] sel
	);
	
	reg [31:0] out;
	wire [31:0] zero;
	wire [31:0] one;
	wire [31:0] two;
	wire [31:0] three;
	wire [1:0] sel;
	
	always@*
	begin
		if(sel == 0)
			out <= zero;
		else if(sel == 1)
			out <= one;
		else if(sel == 2)
			out <= two;
		else if(sel == 3)
			out <= three;
	end
	
endmodule