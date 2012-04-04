module ee357_left_shift_2_tb;
	
	//inputs
	reg [31:0] in;
	wire [31:0] out;
	
	reg fail;
	
	ee357_left_shift_2 uut (
	.in(in),
	.out(out)
	);
	
	initial
	begin
		in = 32'b00000000000000000000000000000011;
		fail = 0;
		
		#100;
		
		if (out !== 32'b00000000000000000000000000001100)
		begin
			fail = 1;
			$display("Failed to shift %h left by two.", in);
		end
		
		in = 32'b11000000000000000000000000000000;
		
		#100;
		
		if (out !== 32'b00000000000000000000000000000000)
		begin
			fail = 1;
			$display("Failed to shift %h left by two.", in);
		end
		
		if (fail === 1)
		begin
			$display("***** ee357_left_shift_2_tb FAILED *****");
			$stop();
		end
		else
		begin
			$display("ee357_left_shift_2_tb Passed");
			$finish();
		end
	end
	
endmodule