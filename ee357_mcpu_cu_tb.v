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
	reg [5:0] op;
	reg [5:0] func;
	reg rst;
	reg clk;

	// Outputs

	wire pcw;
	wire pcwc;
	wire iord;
	wire mr;
	wire mw;
	wire irw;
	wire regw;
	wire mtor;
	wire rdst;
	wire alusela;
	wire [1:0] aluselb;
	wire [1:0] aluop;
	wire tw;
	wire [1:0] pcs;

	localparam OP_LW = 6'b100011;
	localparam OP_SW = 6'b101011;
	localparam OP_RTYPE = 6'b000000;
	localparam OP_BEQ = 6'b000100;
	localparam OP_BNE = 6'b000101;
	localparam OP_JMP = 6'b000010;
	localparam OP_ADDI = 6'b001000;
	localparam OP_JAL = 6'b000011;
	
	// Instantiate the Unit Under Test (UUT)
	ee357_mcpu_cu uut (
		.op(op),
		.func(func),
		.rst(rst),
		.clk(clk),
		.pcw(pcw),
		.pcwc(pcwc),
		.iord(iord),
		.mr(mr),
		.mw(mw),
		.irw(irw),
		.regw(regw),
		.mtor(mtor),
		.rdst(rdst),
		.alusela(alusela),
		.aluop(aluop),
		.tw(tw),
		.pcs(pcs)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		func = 0;
		rst = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 0;
		
		// Wait 100 ns for rst to go down
		#100
		
		$display("Done");
		
		$stop();

	end
endmodule

