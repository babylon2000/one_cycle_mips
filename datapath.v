module datapath
(
  input i_clk, reset,
  input i_reg_dst, i_op2sel, i_mem2reg, i_we3, i_branch, i_jmp,
  input [2:0] i_alu_ctrl,
  input [31:0] i_instr, i_read_data,
  output [31:0] o_pc, o_write_data, o_alu
);

  wire [31:0] pcplus4, pc_b;
  wire [4:0] wa_sel;
  wire [31:0] src_a;
  wire [31:0] w2alumux;
  wire [31:0] w2alu;
  wire [31:0] result;
  wire zf, pc_src;
  wire [31:0] after_shift, pc_branch;
  
  wire [31:0] pc_branch_jmp, pc_from_mux2pc;
  
  assign pc_src = i_branch & zf;
  
  
  /**********************Adding jump instruction*****************************/
  
    mux2in1 #(32) muxbtwpc
  (
    .op1(pc_branch_jmp),
	 .op2(pc_from_mux2pc),
	 .sel(i_jmp),
	 .res(pc_b)
  );
  
  
  pc_jmp pcjmp
  (
    .head_old_pc(pcplus4[31:28]),
	 .jmp(i_instr[25:0]),
	 .new_pc(pc_branch_jmp)
  );
  
  
  /**************************************************************************/
  
  mux2in1 #(32) mux2pc
  (
    .op1(pc_branch),
	 .op2(pcplus4),
	 .sel(pc_src),
	 .res(pc_from_mux2pc)
  );
  
  shift_left_by_2 slb2
  (
    .bef_shift(w2alumux),
	 .aft_shift(after_shift)
  );
  
  adder b_add
  (
    .a(after_shift),
	 .b(pcplus4),
	 .y(pc_branch)
  );
  
  pc pc_inst
  (
    .i_clk(i_clk),
    .i_arst(reset),
    .i_pc(pc_b),
    .o_pc(o_pc)
  );

  
  adder adder_inst
  (
    .a(o_pc),
	 .b(32'b100),
    .y(pcplus4)
  );
  
  register_file rf
  (
    .i_clk(i_clk), 
    .i_we3(i_we3),
    .ra1(i_instr[25:21]),
    .ra2(i_instr[20:16]),
    .wa(wa_sel),
    .wd(result),
    .rd1(src_a), 
    .rd2(o_write_data)
  );
  
  mux2in1 #(5) mux2wa
  (
    .op1(i_instr[15:11]), 
	 .op2(i_instr[20:16]),
    .sel(i_reg_dst),
    .res(wa_sel)
  );
  
    mux2in1 #(32) resmux
  (
    .op1(i_read_data), 
	 .op2(o_alu),
    .sel(i_mem2reg),
    .res(result)
  );
  

  sign_extend se
  (
    .sne_data(i_instr[15:0]),
    .se_data(w2alumux)
  );
  
  
  mux2in1 #(32) mux2alu
  (
    .op1(w2alumux), 
	 .op2(o_write_data),
    .sel(i_op2sel),
    .res(w2alu)
  );

  
  alu alu_inst
  (
    .srca(src_a), 
	 .srcb(w2alu),
	 //.srcb(w2alumux),
    .alu_ctrl(i_alu_ctrl),
    .alu_out(o_alu),
	 .zero(zf	)
  );
  

endmodule 