module ee357_sign_extend_16_to_32_tb;

	//Inputs
	reg [15:0] in;
	
	//Outputs
	wire [31:0] out;
	
	reg fail;

	ee357_sign_extend_16_to_32 uut (
	.in(in),
	.out(out)
	);
	
	initial
	begin
		fail = 0;
		in = 16'h8001;
		
		#100;
		
		if (out !== 32'hffff8001)
		begin
			fail = 1;
			$display("Failed to sign extend %h", in);
			$display("Got %h", out);
			$display("Binary: %b", out);
		end
		
		in = 16'h0003;
		
		#100;
		
		if (out !== 32'h00000003)
		begin
			fail = 1;
			$display("Failed to sign extend %h", in);
			$display("Got %h", out);
			$display("Binary: %b", out);
		end
		
		if (fail === 1)
		begin
			$display("***** ee357_sign_extend_16_to_32 FAILED *****");
			$stop();
		end
		else
		begin
			$display("ee357_sign_extend_16_to_32 Passed");
			$finish();
		end
	end

endmodule