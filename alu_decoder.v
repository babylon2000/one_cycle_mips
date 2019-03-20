module alu_decoder
(
  input [5:0] funct,
  input [1:0] i_alu_op,
  output reg [2:0] alu_ctrl
);


  always @(*)
    begin
		case(i_alu_op)
		  2'b00: alu_ctrl <= 3'b010;
		  2'b01: alu_ctrl <= 3'b110;
		  default: case(funct)
		             6'b100000: alu_ctrl <= 3'b010;
						 6'b100010: alu_ctrl <= 3'b110;
						 default: alu_ctrl <= 3'b010; //default add op
		           endcase
		endcase
	 end


endmodule 