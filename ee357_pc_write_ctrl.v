module ee357_pc_write_ctrl(
	output w,
	
	input pcw,
	input pcwcond,
	input cond,
	input inv_cond
);

	wire pcw;
	wire pcwcond;
	wire cond;
	wire inv_cond;
	
	reg w;

	always @*
	begin
		w = 0;
		if (pcw)
			begin
				w = 1;
			end
		else
			begin
				if (pcwcond)
					begin
						//if (cond && !inv_cond)
						//	w = 1;
						//else if (!cond && inv_cond)
						//	w = 1;
						w = cond ^ inv_cond;
					end
			end
	end

endmodule