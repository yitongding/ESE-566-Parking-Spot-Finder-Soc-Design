module ap_start_timer(
	input wire HCLK,
	input wire HRESETn,
	output wire ap_start
);

	reg ap_start_reg;
	reg [31:0] counter;

	always @(posedge HCLK) begin
		if (!HRESETn) begin
			ap_start_reg <= 1'b0;
			counter		 <= 32'd9999;
		end
		else begin
			if (counter == 32'd10000) begin
				ap_start_reg <= 1'b1;
				counter <= 32'd0;
			end
			else begin
				ap_start_reg <= 1'b0;
				counter <= counter + 1;
			end
		end
	end
	
	
endmodule