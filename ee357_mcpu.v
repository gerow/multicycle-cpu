`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:57 03/22/2010 
// Design Name: 
// Module Name:    ee357_mcpu 
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
module ee357_mcpu(
	// I/O interface to memory
   output 		[31:0] 	mem_addr,
   output 		[31:0] 	mem_wdata,
   output 					memread,
   output 					memwrite,
	input			[31:0]	mem_rdata,
	
	// Register File I/O for debug/checking purposes
	output		[4:0]		reg_ra,
	output		[4:0]		reg_rb,
	output		[4:0]		reg_wa,
	output		[31:0]	reg_radata,
	output		[31:0]	reg_rbdata,
	output		[31:0]	reg_wdata,
	output					regwrite,
	 
	// Clock and reset
	input 					clk,
   input 					rst
   );


	// Use these for opcode decoding
	localparam OP_LW    = 6'b100011;
	localparam OP_SW    = 6'b101011;
	localparam OP_RTYPE = 6'b000000;
	localparam OP_BEQ   = 6'b000100;
	localparam OP_BNE   = 6'b000101;
	localparam OP_JMP   = 6'b000010;
	localparam OP_ADDI  = 6'b001000;
	localparam OP_JAL   = 6'b000011;
	localparam FUNC_ADD = 6'b100000;
	localparam FUNC_SUB = 6'b100010;
	localparam FUNC_AND = 6'b100100;
	localparam FUNC_OR  = 6'b100101;
	localparam FUNC_XOR = 6'b000110;
	localparam FUNC_NOR = 6'b000111;
	localparam FUNC_SLT = 6'b101010;
	localparam FUNC_SLL = 6'b000000;
	localparam FUNC_SRL = 6'b000010;
	localparam FUNC_SRA = 6'b000011;
	localparam FUNC_JR  = 6'b001000;

	// ALU signals
	wire [31:0]		ina;
	wire [31:0]		inb;
	wire [5:0]		alu_func;
	wire [31:0]		alu_res;
	wire 				sov;
	wire				zero;
	
	// Control Signals
	wire 				pcwrite;
   wire 				pcwritecond;
   wire 				iord;
   wire 				irwrite;
   wire 				memtoreg;
   wire 				regdst;
   wire 				alusela;
   wire [1:0]		aluselb;
   wire [1:0]		aluop;
   wire 				targetwrite;
   wire [1:0]		pcsource;

	wire [5:0]		opcode;
	wire [4:0]		rs;
	wire [4:0]		rt;
	wire [4:0]		rd;
	wire [4:0]		shamt;	
	wire [5:0]		func;
	wire [15:0]		imm;
	wire [25:0]		jmpaddr;
	
	wire [31:0]		shifted_jmpaddr;

	wire  [31:0]	pc;
	wire			pcwen;
	wire  [31:0]		ir;
	wire [31:0] 	imm_sext;
	wire [31:0]		imm_sext_shl2;
	wire [31:0]		jump_target_pc;
	wire [31:0]		branch_target_pc;
	
	//Misc signals
	wire [31:0] sign_extended_imm;
	wire [31:0] left_shifted_sext_imm;
	wire [31:0] candidate_pc;
	
	
	
	// PC process
	//always @(posedge clk)
	//begin
	//	if(rst == 1)
	//		pc <= 32'b0;
	//	else if(pcwen == 1)
	//		pc <= 32'b0;
	//end
	
	ee357_32reg pc_register (
	.in(candidate_pc),
	.out(pc),
	.enable(pcwen),
	.sys_clk(clk),
	.reset(rst)
	);



	// IR Process
	//always @(posedge clk)
	//begin
	//	if(rst == 1)
	//		ir <= 32'b0;
	//	else if(irwrite == 1)
	//		ir <= mem_rdata;
	//end
	
	ee357_32reg instruction_register (
	.in(mem_rdata),
	.out(ir),
	.enable(irwrite),
	.sys_clk(clk),
	.reset(rst)
	);

	// IR Field Breakout
	assign opcode = ir[31:26];
	assign rs = ir[25:21];
	assign rt = ir[20:16];
	assign rd = ir[15:11];
	assign shamt = ir[10:6];	
	assign func = ir[5:0];
	assign imm = ir[15:0];
	assign jmpaddr = ir[25:0];
	
	assign reg_ra = rs;
	assign reg_rb = rt;
	
	assign bne_bit = ir[26];
	
	//Mux to select the memory address
	ee357_2x32_mux memory_address_mux (
	.zero(pc),
	.one(alu_res),
	.sel(iord),
	.out(mem_addr)
	);
	
	//PC Write contrller
	ee357_pc_write_ctrl pc_write_controller (
	.w(pcwen),
	.pcw(pcwen),
	.pcwcond(pcwc),
	.cond(zero),
	.inv_cond(bne_bit)
	);
	
	ee357_sign_extend_16_to_32 imm_sign_extender (
	.in(imm),
	.out(sign_extended_imm)
	);
	
	ee357_left_shift_2 imm_left_shift_2 (
	.in(sign_extended_imm),
	.out(left_shifted_sext_imm)
	);
	
	alu_ctrl alu_controller (
	.aluOP(aluop),
	.func(func),
	.alu_ctrl(alu_func)
	);
	
	// Regfile instance
	ee357_regfile_2r1w regfile (
		.ra(reg_ra),
		.rb(reg_rb),
		.wa(reg_wa),
		.wdata(reg_wdata),
		.wen(regwrite),
		.clk(clk),
		.rst(rst),
		.radata(reg_radata),
		.rbdata(reg_rbdata)
	);
	
	ee357_2x32_mux alu_a_selection_mux (
	.zero(pc),
	.one(reg_radata),
	.sel(alusela),
	.out(ina)
	);
	
	ee357_4x32_mux alu_b_selection_mux (
	.zero(reg_rbdata),
	.one(4),
	.two(sign_extended_imm),
	.three(left_shifted_sext_imm),
	.sel(aluselb),
	.out(inb)
	);
	
	ee357_left_shift_2 jmp_left_shift (
	.in({{6{1'b0}}, jmpaddr}),
	.out(shifted_jmpaddr)
	);
	
	ee357_4x32_mux pc_select_mux (
	.zero(alu_res),
	.one(branch_target_pc),
	.two(shifted_jmpaddr),
	.three(32'b0),
	.sel(pcsource),
	.out(candidate_pc)
	);

	
	// ALU instance
   ee357_alu alu (
		.opa(ina),
		.opb(inb),
		.func(alu_func),
      .res(alu_res), 
      .uov(), 
		.sov(sov),
      .zero(zero),
		.cout()
		);

	
	// Branch Target Register
	//always @(posedge clk)
	//begin
	//	if(rst == 1)
	//		branch_target_pc <= 32'b0;
	//	else if (targetwrite == 1)
	//		// Change/add your code here
	//		branch_target_pc <= alu_res;
	//end
	
	//Branch Target Register instance
	ee357_32reg branch_target_register (
	.in(alu_res),
	.out(branch_target_pc),
	.enable(targetwrite),
	.sys_clk(clk),
	.reset(rst)
	);
	
	
	// Control Unit (state machine)
	ee357_mcpu_cu ctrl_unit(
    .op(opcode),
    .func(func),
	 .rst(rst),
    .clk(clk),
    .pcw(pcwrite),
    .pcwc(pcwritecond),
    .iord(iord),
    .mr(memread),
    .mw(memwrite),
    .irw(irwrite),
    .regw(regwrite),
    .mtor(memtoreg),
    .rdst(regdst),
    .alusela(alusela),
    .aluselb(aluselb),
    .aluop(aluop),
    .tw(targetwrite),
    .pcs(pcsource)
    );

endmodule
