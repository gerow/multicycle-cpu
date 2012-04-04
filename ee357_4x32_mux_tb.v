module ee357_4x32_mux_tb;
	//inputs
	reg [31:0] zero;
	reg [31:0] one;
	reg [31:0] two;
	reg [31:0] three;
	reg [1:0] sel;
	
	//outputs
	wire [31:0] out;
	
	reg fail;
	
	ee357_4x32_mux uut (
	.zero(zero),
	.one(one),
	.two(two),
	.three(three),
	.sel(sel),
	.out(out)
	);
	
	initial
	begin
		fail = 0;
		zero = 32'h0;
		one = 32'h1;
		two = 32'h2;
		three = 32'h3;
		sel = 2'b00;
		
		#100;
		
		if (out !== 32'h0)
		begin
			$display("Failed when sel %h", sel);
			$display("Got %h", out);
			fail = 1;
		end
		
		zero = 32'h7;
		
		#100;
		
		if (out !== 32'h7)
		begin
			$display("Failed when sel %h and when out = 32'h7", sel);
			fail = 1;
		end
		
		sel = 2'b01;
		
		#100;
		
		if (out !== 32'h1)
		begin
			$display("Faild when sel %h", sel);
			fail = 1;
		end
		
		sel = 2'b10;
		
		#100;
		
		if (out !== 32'h2)
		begin
			$display("Failed when %h", sel);
			fail = 1;
		end
		
		sel = 2'b11;
		
		#100;
		
		if (out !== 32'h3)
		begin
			$display("Failed when %h", sel);
			fail = 1;
		end
		
		if (fail === 1)
		begin
			$display("***** ee357_4x32_mux_tb FAILED *****");
			$stop();
		end
		else
		begin
			$display("ee357_4x32_mux_tb Passed");
			$finish();
		end
	end
	
endmodule