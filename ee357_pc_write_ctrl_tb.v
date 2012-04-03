module ee357_pc_write_ctrl_tb;

	//Inputs
	reg pcw;
	reg pcwcond;
	reg cond;
	reg inv_cond;
	
	//Outputs
	wire w;
	
	reg fail;
	
	ee357_pc_write_ctrl uut (
	.pcw(pcw),
	.pcwcond(pcwcond),
	.cond(cond),
	.inv_cond(inv_cond),
	.w(w)
	);
	
	initial
	begin
		fail = 0;
		pcw = 0;
		pcwcond = 0;
		cond = 0;
		inv_cond = 0;
		
		#100;
		
		if (w !== 0)
		begin
			fail = 1;
			$display("Failed when pcw=0, pcwcond=0, cond=0, and inv_cond=1");
		end
		
		pcw = 1;
		
		#100;
		
		if (w !== 1)
		begin
			fail = 1;
			$display("Failed when only pcw=1");
		end
		
		pcwcond = 1;
		inv_cond = 1;
		cond = 1;
		
		#100;
		
		if (w !== 1)
		begin
			fail = 1;
			$display("Failed when pcw=1, pcwcond=1, inv_cond=1, and cond=1");
		end
		
		pcw = 0;
		
		#100;
		
		if (w !== 0)
		begin
			fail = 1;
			$display("failed when pcwcond=1, inv_cond=1, and cond=1");
		end
		
		inv_cond = 0;
		
		#100;
		
		if (w !== 1)
		begin
			fail = 1;
			$display("Failed when pcwcond=1, and cond=1");
		end
		
		cond = 0;
		
		#100;
		
		if (w !== 0)
		begin
			fail = 1;
			$display("Failed when pcwcond=1");
		end
		
		inv_cond = 1;
		
		#100;
		
		if (w !== 1)
		begin
			fail = 1;
			$display("Failed when pcwcond=1 and inv_cond=1");
		end
		
		if (fail == 1)
		begin
			$display("***** ee357_pc_write_ctrl_tb FAILED *****");
			$stop();
		end
		else
		begin
			$display("ee357_pc_write_ctrl_tb Passed");
			$finish();
		end
	end

endmodule