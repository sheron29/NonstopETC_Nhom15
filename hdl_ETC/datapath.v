module datapath (clk, reset_n, init, up, down, en, dis, en_barrier);
	input clk;    
	input reset_n;
	input init;
	input up;
	input down;
	input en;
	input dis;
	output reg en_barrier;

/**============================================
 * 	          Update value for en_barrier
 *=============================================*/
always @(posedge clk or negedge reset_n) begin
	if(~reset_n) begin
		en_barrier <= 0;
	end else begin
		if (up || en) begin
			en_barrier <= 1;
		end
		else if (dis || down) begin
			en_barrier <= 0;
		end
	end
end
endmodule




