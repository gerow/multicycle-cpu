module ee357_32reg_tb;

	//Inputs
	reg [31:0] in;
	reg enable;
	reg sys_clk;
	reg reset;
	
	//Outputs
	wire [31:0] out;
	
	reg fail;
	
	ee357_32reg uut (
	.in(in),
	.out(out),
	.enable(enable),
	.sys_clk(sys_clk),
	.reset(reset)
	);
	
	initial
	begin
		fail = 0;
		sys_clk = 0;
		in = 32'h5;
		reset = 1;
		
		#100
		
		sys_clk = 1;
		#100;
		sys_clk = 0;
		#100;
		
		if (out !== 32'b0)
		begin
			fail = 1;
			$display("Failed to reset properly");
		end
		
		reset = 0;
		
		#100;
		
		sys_clk = 1;
		#100;
		sys_clk = 0;
		#100;
		
		if (out !== 32'h0)
		begin
			fail = 1;
			$display("Updated even through enable was off");
		end
		
		enable = 1;
		
		#100;
		
		sys_clk = 1;
		#100;
		sys_clk = 0;
		#100;
		
		if (out !== 32'h5)
		begin
			fail = 1;
			$display("Failed to update properly when enabled");
		end
		
		if (fail === 1)
		begin
			$display("***** ee357_32reg_tb FAILED *****");
			$stop();
		end
		else
			$display("ee357_32reg_tb Passed");
			$finish();
		begin
		end
	end

endmodule