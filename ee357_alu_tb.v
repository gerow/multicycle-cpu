`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:04:10 03/23/2011
// Design Name:   ee357_alu_golden
// Module Name:   C:/Users/Mark/Documents/EE357/ee357_alu/ee357_alu_tb.v
// Project Name:  ee357_alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ee357_alu_golden
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ee357_alu_tb;

	// Inputs
	reg [31:0] opa;
	reg [31:0] opb;
	reg [5:0] func;
	
	reg [31:0] exp_result;
	reg [3:0] exp_flags;
	wire [3:0] flags;

	// Outputs
	wire [31:0] res;
	wire uov;
	wire sov;
	wire zero;
	wire cout;

	localparam FUNC_ADD = 6'b100000;
	localparam FUNC_SUB = 6'b100010;
	localparam FUNC_AND = 6'b100100;
	localparam FUNC_OR  = 6'b100101;
	localparam FUNC_XOR = 6'b100110;
	localparam FUNC_NOR = 6'b100111;
	localparam FUNC_SLT = 6'b101010;
	localparam FUNC_SLL = 6'b000000;
	localparam FUNC_SRL = 6'b000010;
	localparam FUNC_SRA = 6'b000011;
	localparam FUNC_JR  = 6'b001000;

	assign flags = {uov, sov, zero, cout};
	// Instantiate the Unit Under Test (UUT)
	ee357_alu uut (
		.opa(opa), 
		.opb(opb), 
		.func(func), 
		.res(res), 
		.uov(uov), 
		.sov(sov), 
		.zero(zero), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		opa = 0;
		opb = 0;
		func = 0;

		// Wait 100 ns for global reset to finish
		#100;
		opa = 32'hffffffff;
		opb = 32'h00000001;
		func = FUNC_ADD;
		exp_result = 32'h00000000;
		exp_flags = 4'b1011;
		#100;
		opa = 32'h7fffffff;
		opb = 32'h00000001;
		func = FUNC_ADD;
		exp_result = 32'h80000000;
		exp_flags = 4'b0100;
		#100;
		opa = 32'h80000000;
		opb = 32'h00000001;
		func = FUNC_SUB;
		exp_result = 32'h7fffffff;
		exp_flags = 4'b0101;
		#100;
		opa = 32'h00000000;
		opb = 32'h00000001;
		func = FUNC_SUB;
		exp_result = 32'hffffffff;
		exp_flags = 4'b1000;
		#100;
		opa = 32'hffffffff;
		opb = 32'hfffffffe;
		func = FUNC_SUB;
		exp_result = 32'h00000001;
		exp_flags = 4'b0001;
		#100;
		$display("Running FUNC_AND");
		opa = 32'hffffffff;
		opb = 32'h0033ccff;
		func = FUNC_AND;
		exp_result = 32'h0033ccff;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_OR");
		opa = 32'h00000000;
		opb = 32'h0033ccff;
		func = FUNC_OR;
		exp_result = 32'h0033ccff;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_XOR");
		opa = 32'hffffffff;
		opb = 32'h0033ccff;
		func = FUNC_XOR;
		exp_result = 32'hffcc3300;
		exp_flags = 4'b0000;
		#100;
		$display("Runing FUNC_NOR");
		opa = 32'h00000000;
		opb = 32'h0033ccff;
		func = FUNC_NOR;
		exp_result = 32'hffcc3300;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SLL");
		opa = 32'h00000001;
		opb = 32'h00000001;
		func = FUNC_SLL;
		exp_result = 32'h00000002;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SLL_2");
		opa = 32'h0000001c;
		opb = 32'h0000000a;
		func = FUNC_SLL;
		exp_result = 32'ha0000000;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SRL");
		opa = 32'h00000001;
		opb = 32'h80000000;
		func = FUNC_SRL;
		exp_result = 32'h40000000;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SRL_2");
		opa = 32'h0000001f;
		opb = 32'h80000000;
		func = FUNC_SRL;
		exp_result = 32'h00000001;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SRA");
		opa = 32'h00000001;
		opb = 32'h80000000;
		func = FUNC_SRA;
		exp_result = 32'hc0000000;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SRA_2");
		opa = 32'h0000001f;
		opb = 32'h80000000;
		func = FUNC_SRA;
		exp_result = 32'hffffffff;
		exp_flags = 4'b0000;
		#100;
		$display("Running FUNC_SLT");
		opa = 32'h00000000;
		opb = 32'h00000001;
		func = FUNC_SLT;
		exp_result = 32'h00000001;
		exp_flags = 4'b1000;
		#100;
		$display("Running FUNC_SLT_2");
		opa = 32'hffffffff;
		opb = 32'hfffffffe;
		func = FUNC_SLT;
		exp_result = 32'h00000000;
		exp_flags = 4'b0011;
		#100;
		$stop();

	end
      
	initial
	begin
	   #99;
		while (1)
		begin
			#100;
			if(exp_result != res)
			begin
				$display($time, "Exp_result does not match result");
				$display("Expected: ");
				$display("    Decimal %d", exp_result);
				$display("    Hex $%h", exp_result);
				$display("    Binary %b", exp_result);
				$display("Got:");
				$display("    Decimal %d", res);
				$display("    Hex $%h", res);
				$display("    Binary %b", res);
			end
			if(exp_flags != flags)
			begin
				$display($time, "Exp_flags does not match flags");
				$display("Expected: ");
				$display("    Decimal %d", exp_flags);
				$display("    Hex $%h", exp_flags);
				$display("    Binary %b", exp_flags);
				$display("Got");
				$display("    Decimal %d", flags);
				$display("    Hex $%h", flags);
				$display("    Binary %b", flags);
			end
		end
	end
endmodule

