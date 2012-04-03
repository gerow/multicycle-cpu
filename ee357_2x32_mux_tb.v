module ee357_2x32_mux_tb;

	reg [31:0] zero;
	reg [31:0] one;
	reg sel;
	
	wire [31:0] out;
	
	reg fail;
	
	ee357_2x32_mux uut (
	.zero(zero),
	.one(one),
	.sel(sel),
	.out(out)
	);
	
	initial
	begin
		zero = 32'b1;
		one = 32'b0;
		sel = 0;
		fail = 0;
		
		#100
		
		if (out !== 32'b1)
		begin
			fail = 1;
			$display("Failed with sel 0, zero 32'b1, and one 32'b0");
		end
		
		zero = 32'b0;
		
		#100
		
		if (out !== 32'b0)
		begin
			fail = 1;
			$display("Failed with sel 0, zero 32'b0, and one 32'b1");
		end
		
		zero = 32'b1;
		#100
		
		sel = 1;
		#100;
		
		if (out !== 32'b0)
		begin
			fail = 1;
			$display("Failed with sel 1, zero 32'b1, and one 32'b0");
		end
		
		$display("\n");
		if (fail)
		begin
			$display("***** ee357_2x32_mux_tb FAILED *****");
			$stop();
		end
		else
		begin
			$display("ee357_2x32_mux_tb Passed");
			$finish();
		end
	end

endmodule