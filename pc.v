module pc
(
  input i_clk,
  input i_arst,
  input [31:0] i_pc,
  output reg [31:0] o_pc
);


  always @(posedge i_clk, negedge i_arst)
    begin
	   if(~i_arst)
		  o_pc <= 0;
		else
		  o_pc <= i_pc;
	 end

endmodule 