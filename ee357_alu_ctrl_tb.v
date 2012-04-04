module ee357_alu_ctrl_tb;
	//Inputs
	reg [1:0] aluOP;
	reg [5:0] func;
	
	//Outputs
	wire [5:0] alu_ctrl;
	
	reg fail;
	
	
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
	
	localparam FORCE_ADD = 2'b00;
	localparam FORCE_SUBTRACT = 2'b01;
	localparam FORCE_PASS = 2'b10;
	localparam UNDEFINED = 2'b11;
	
	
	alu_ctrl uut (
	.aluOP(aluOP),
	.func(func),
	.alu_ctrl(alu_ctrl)
	);
	
	initial
	begin
		fail = 0;
		aluOP = FORCE_ADD;
		func = FUNC_XOR;
		
		#100;
		
		if (func !== FUNC_ADD)
		begin
			fail = 1;
			$display("Failed to force an add");
			$display("Extected $%h", FUNC_ADD);
			$display("Got $%h", func);
			$display("When aluOP is $%h", aluOP);
		end
		
		aluOP = FORCE_SUBTRACT;
		#100;
		
		if (func !== FUNC_SUB)
		begin
			fail = 1;
			$display("Failed to force a subtraction");
			$display("Extected $%h", FUNC_SUB);
			$display("Got $%h", func);
			$display("When aluOP is $%h", aluOP);
		end
		
		aluOP = FORCE_PASS;
		#100;
		
		if (func !== FUNC_XOR)
		begin
			fail = 1;
			$display("Pass through failed");
		end
		
		if (fail === 1)
		begin
			$display("***** ee357_alu_ctrl_tb FAILED *****");
			$stop();
		end
		else
			$display("ee357_alu_ctrl_tb Passed");
			$finish();
		begin
		end
	end
endmodule