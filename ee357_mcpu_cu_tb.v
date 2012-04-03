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

	//PCWrite
	wire pcw;
	//PCWriteCond
	wire pcwc;
	//IorD
	wire iord;
	//MemRead
	wire mr;
	//MemWrite
	wire mw;
	//IRWrite
	wire irw;
	//RegWrite
	wire regw;
	//MemtoReg
	wire mtor;
	//RegDst
	wire rdst;
	//ALUSelA
	wire alusela;
	//ALUSelB
	wire [1:0] aluselb;
	//ALUSelOp
	wire [1:0] aluop;
	//TargetWrite
	wire tw;
	//PCSource
	wire [1:0] pcs;
	
	/*
	pcw;
	pcwc;
	iord;
	mr;
	mw;
	irw;
	regw;
	mtor;
	rdst;
	alusela;
	aluselb;
	aluop;
	tw;
	pcs;
	*/

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
		.aluselb(aluselb),
		.aluop(aluop),
		.tw(tw),
		.pcs(pcs)
	);

	initial begin
		// Initialize Inputs
		op = 0;
		func = 0;
		rst = 1;
		clk = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk = 0;
		rst = 0;
		
		// Wait 100 ns for rst to go down
		#100

		/*	
		//PCWrite
		wire pcw;
		//PCWriteCond
		wire pcwc;
		//IorD
		wire iord;
		//MemRead
		wire mr;
		//MemWrite
		wire mw;
		//IRWrite
		wire irw;
		//RegWrite
		wire regw;
		//MemtoReg
		wire mtor;
		//RegDst
		wire rdst;
		//ALUSelA
		wire alusela;
		//ALUSelB
		wire [1:0] aluselb;
		//ALUSelOp
		wire [1:0] aluop;
		//TargetWrite
		wire tw;
		//PCSource
		wire [1:0] pcs;
		*/
		
		/*
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b00)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
		
		*/
		
		//Check if initial state is correct
		$display("Checking state 0 (Instruc. Fetch)");
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 1)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			begin
				$display("aluselb wrong");
				$display("got %b", aluselb);
			end
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		op = OP_LW;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 1 (Instruc. Decode + Reg Fetch");
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b11)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 1)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
		
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 2 (mem addr computation)");
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 1)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b10)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 3 (memory access)");
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 1)
			$display("iord wrong");
		if (mr !== 1)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b10)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 4 (write back)");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 1)
			$display("iord wrong");
		if (mr !== 1)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 1)
			$display("regw wrong");
		if (mtor !== 1)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b10)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
	
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking to make sure we're back in state 0");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		op = OP_SW;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		//Now in state 1, skip it
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking to make sure we're in state 2");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 1)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b10)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 5 (Memory Access)");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 1)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 1)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b10)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Making sure we're back in state 0");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
		
		op = OP_RTYPE;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		//Skip state 1
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 6 (Execution)");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b00)
			$display("aluselb wrong");
		if (aluop != 2'b10)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk =  0;
		#100;
		
		$display("Checking state 7 (Write back)");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 1)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 1)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b00)
			$display("aluselb wrong");
		if (aluop != 2'b10)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Making sure we're back in state 0");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		op = OP_BEQ;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		//Skipping state 1
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 8 (Branch Completion)");
		
		if (pcw !== 0)
			$display("pcw wrong");
		if (pcwc !==  1)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 1)
			$display("alusela wrong");
		if (aluselb !== 2'b00)
			$display("aluselb wrong");
		if (aluop != 2'b01)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b01)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Making sure we're back in state 0");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		op = OP_JMP;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		//Skipping state 1
		
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Checking state 9 (Jump Completion)");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 0)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b00)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b10)
			$display("pcs wrong");
			
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Making sure we're back in state 0");
		
		if (pcw !== 1)
			$display("pcw wrong");
		if (pcwc !==  0)
			$display("pcwc wrong");
		if (iord !== 0)
			$display("iord wrong");
		if (mr !== 0)
			$display("mr wrong");
		if(mw !== 0)
			$display("mw wrong");
		if (irw !== 1)
			$display("irw wrong");
		if (regw !== 0)
			$display("regw wrong");
		if (mtor !== 0)
			$display("mtor wrong");
		if (rdst !== 0)
			$display("rdst wrong");
		if (alusela !== 0)
			$display("alusela wrong");
		if (aluselb !== 2'b01)
			$display("aluselb wrong");
		if (aluop != 2'b00)
			$display("aluop wrong");
		if (tw !== 0)
			$display("tw wrong");
		if (pcs != 2'b00)
			$display("pcs wrong");
			
		op = OP_ADDI;
		#100;
		clk = 1;
		#100;
		clk = 0;
		#100;
		
		$display("Done");
		$stop();

	end
endmodule

