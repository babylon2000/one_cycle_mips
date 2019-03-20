module controller
(
  input [5:0] i_opcode, i_funct,
  output o_reg_dst, o_op2sel, o_mem2reg, o_we3, o_we, branch, o_jmp,
  output [2:0] o_alu_ctrl
);


  wire [1:0] mc2ad;
  
   main_control mc
  (
    .opcode(i_opcode),
    .reg_dst(o_reg_dst), 
	 .op2sel(o_op2sel),
	 .branch(branch), 
	 .jmp(o_jmp),
	 .mem2reg(o_mem2reg), 
	 .we3(o_we3), 
	 .we(o_we),
    .alu_op(mc2ad)
  );
  
  
   alu_decoder ad
  (
    .funct(i_funct),
    .i_alu_op(mc2ad),
    .alu_ctrl(o_alu_ctrl)
  );


endmodule 