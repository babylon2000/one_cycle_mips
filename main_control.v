module main_control
(
  input [5:0] opcode,
  output reg reg_dst, op2sel, mem2reg, we3, we, branch, jmp,
  output reg [1:0] alu_op
);


  always @(*)
    begin
	   case(opcode)
		  6'b000000: begin
		               alu_op <= 2'b10;
							reg_dst <= 1'b1;
							op2sel <= 1'b0;
							branch <= 1'b0;
							jmp <= 0;
							mem2reg <= 1'b0;
							we3 <= 1'b1;
							we <= 1'b0;
						 end
		  6'b100011: begin
		               alu_op <= 2'b00;
							reg_dst <= 1'b0;
							op2sel <= 1'b1;
							branch <= 1'b0;
							jmp <= 0;
							mem2reg <= 1'b1;
							we3 <= 1'b1;
							we <= 1'b0;
						 end
		  6'b101011: begin
		               alu_op <= 2'b00;
							op2sel <= 1'b1;
							branch <= 1'b0;
							jmp <= 0;
							we3 <= 1'b0;
							we <= 1'b1;
		             end
		  6'b000100: begin  //beq
		               alu_op <= 2'b01;
							op2sel <= 1'b0;
							branch <= 1'b1;
							jmp <= 0;
							we3 <= 1'b0;
							we <= 1'b0;
		             end
		  6'b001000: begin //addi
		               alu_op <= 2'b00;
							reg_dst <= 1'b0;
							op2sel <= 1'b1;
							branch <= 1'b0;
							jmp <= 0;
							mem2reg <= 1'b0;
							we3 <= 1'b1;
							we <= 1'b0;
		             end
		  6'b000010: begin //jmp
							jmp <= 1;
							we3 <= 1'b0;
							we <= 1'b0;
		             end
		  default: begin
		             alu_op <= 2'b00;
						 reg_dst <= 1'b0;
						 op2sel <= 1'b0;
						 branch <= 0;
						 jmp <= 0;
						 mem2reg <= 1'b0;
						 we3 <= 1'b0;
						 we <= 1'b0;
		           end
		endcase
	 end


endmodule 