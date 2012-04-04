module alu_ctrl(
	input [1:0]		aluOP,
	input [5:0] 	func,
	output [5:0]	alu_ctrl
	);
	
	wire [1:0] aluOP;
	wire [5:0] func;
	reg [5:0] alu_ctrl;
	
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

	always@*
	begin
		if(aluOP == 0)
			alu_ctrl <= FUNC_ADD;
		else if(aluOP == 1)
			alu_ctrl <= FUNC_SUB;
		else if(aluOP == 2)
			alu_ctrl <= func;
	end
endmodule