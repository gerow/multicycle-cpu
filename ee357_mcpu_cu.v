`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:48 03/27/2009 
// Design Name: 
// Module Name:    ee357_cpu_m_cu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ee357_mcpu_cu(
    input 		[5:0] op,
    input 		[5:0] func,
    input 				rst,
    input 				clk,
    output reg			pcw,
    output reg			pcwc,
    output reg			iord,
    output reg			mr,
    output reg			mw,
    output reg			irw,
    output reg			regw,
    output reg			mtor,
    output reg			rdst,
    output reg			alusela,
    output reg	[1:0] aluselb,
    output reg	[1:0] aluop,
    output reg			tw,
    output reg	[1:0] pcs
    );
	

   // Use these for IFL (opcode decoding) if desired
	localparam OP_LW = 6'b100011;
	localparam OP_SW = 6'b101011;
	localparam OP_RTYPE = 6'b000000;
	localparam OP_BEQ = 6'b000100;
	localparam OP_BNE = 6'b000101;
	localparam OP_JMP = 6'b000010;
	localparam OP_ADDI = 6'b001000;
	localparam OP_JAL = 6'b000011;

	// State definitions if desired
	localparam STATE0 = 4'd0;
	localparam STATE1 = 4'd1;
	localparam STATE2 = 4'd2;
	localparam STATE3 = 4'd3;
	localparam STATE4 = 4'd4;
	localparam STATE5 = 4'd5;
	localparam STATE6 = 4'd6;
	localparam STATE7 = 4'd7;
	localparam STATE8 = 4'd8;
	localparam STATE9 = 4'd9;
	localparam STATE10 = 4'd10;
	localparam STATE11 = 4'd11;
	localparam STATE12 = 4'd12;
	localparam STATE13 = 4'd13;

	localparam FUNC_JR = 6'b001000;

	reg [3:0]        state_d;
	reg [3:0]        state;
	
	
	// STATE_MEMORY => Complete
	always @(posedge clk)
	begin
		if(rst == 1)
			state = STATE0;
		else
			state = state_d;
	end


	// NSL - should produce state_d based on current state and OPCODES
	// NSL
	always @*
	begin
		// default assignment
		state_d <= STATE0;
		if(state == STATE0)
			state_d <= STATE1;
		else if (state == STATE1)
			begin
				if (op == OP_LW || op == OP_SW)
					state_d <= STATE2;
				else if (op == OP_RTYPE)
					state_d <= STATE6;
				else if (op == OP_BEQ)
					state_d <= STATE8;
				else if (op == OP_JMP)
					state_d <= STATE9;
			end
		else if (state == STATE2)
			begin
				if (op == OP_LW)
					state_d <= STATE3;
				else
					state_d <= STATE5;
			end
		else if (state == STATE3)
			state_d <= STATE4;
		else if (state == STATE4)
			state_d <= STATE0;
		else if (state == STATE5)
			state_d <= STATE0;
		else if (state == STATE6)
			state_d <= STATE7;
		else if (state == STATE7)
			state_d <= STATE0;
		else if (state == STATE8)
			state_d <= STATE0;
		else if (state == STATE9)
			state_d <= STATE0;
	end
	
	// OFL
	always @(state)
	begin
		// default assignments
		pcw <= 0;
		pcwc <= 0;
		iord <= 0;
		mr <= 0;
		mw <= 0;
		irw <= 0;
		regw <= 0;
		mtor <= 0;
		rdst <= 0;
		alusela <= 0;
		tw <= 0;
		aluselb <= 2'b00;
		aluop <= 2'b00;
		pcs <= 2'b00;
		
		// FETCH
		if(state == STATE0)
			begin
				mr <= 1;
				irw <= 1;
				aluselb <= 2'b01;
				pcw <= 1;
			end
		else if (state == STATE1)
			begin
				//alusela <= 0;
				aluselb <= 2'b11;
				//aluop <= 2'b00;
				tw <= 1;
			end
		else if (state == STATE2)
			begin
				alusela <= 1;
				aluselb <= 2'b10;
				//aluop <= 2'b00;
				iord <= 1;
			end
		else if (state == STATE3)
			begin
				mr <= 1;
				alusela <= 1;
				aluselb <= 2'b10;
				//aluop <= 2'b00;
				iord <= 1;
			end
		else if (state == STATE4)
			begin
				mr <= 1;
				alusela <= 1;
				aluselb <= 2'b10;
				//aluop <= 2'b00;
				iord <= 1;
				mtor <= 1;
				//rdst <= 0;
				regw <= 1;
			end
		else if (state == STATE5)
			begin
				mw <= 1;
				alusela <= 1;
				aluselb <= 2'b10;
				//aluop <= 2'b00;
				iord <= 1;
			end
		else if (state == STATE6)
			begin
				alusela <= 1;
				//aluselb <= 2'b00;
				aluop <= 2'b10;
			end
		else if (state == STATE7)
			begin
				alusela <= 1;
				//aluselb <= 2'b00;
				aluop <= 2'b10;
				rdst <= 1;
				//mtor <= 0;
				regw <= 1;
			end
		else if (state == STATE8)
			begin
				alusela <= 1;
				//aluselb <= 2'b00;
				aluop <= 2'b01;
				pcwc <= 1;
				pcs <= 2'b01;
			end
		else if (state == STATE9)
			begin
				pcw <= 1;
				pcs <= 2'b10;
			end
	end	   
		
endmodule
