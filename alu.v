module alu
(
  input [31:0] srca, srcb,
  input [2:0] alu_ctrl,
  output reg [31:0] alu_out,
  output zero
);


  assign zero = !alu_out;


  always @(*)
    begin
	   case(alu_ctrl)
		  3'b010: alu_out <= srca + srcb;
		  3'b110: alu_out <= srca - srcb;
		  default: alu_out <= 0;
		endcase
	 end

endmodule 