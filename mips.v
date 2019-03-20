module mips
(
  input clk,
  input reset
);


  wire [31:0] instr;
  wire reg_dst, op2sel, mem2reg, we3, we, branch, jmp;
  wire [2:0] alu_ctrl;
  wire [31:0] rd;
  wire [31:0] pc;
  wire [31:0] write_data;
  wire [31:0] alu_out;

  controller c
  (
    .i_opcode(instr[31:26]), 
	 .i_funct(instr[5:0]),
    .o_reg_dst(reg_dst), 
	 .o_op2sel(op2sel), 
	 .branch(branch),
	 .o_jmp(jmp),
	 .o_mem2reg(mem2reg), 
	 .o_we3(we3), 
	 .o_we(we),
    .o_alu_ctrl(alu_ctrl)
  );
  
  datapath dp
  (
    .i_clk(clk), 
	 .reset(reset),
    .i_reg_dst(reg_dst), 
	 .i_op2sel(op2sel), 
	 .i_mem2reg(mem2reg), 
	 .i_we3(we3),
	 .i_jmp(jmp),
	 .i_branch(branch),
    .i_alu_ctrl(alu_ctrl),
    .i_instr(instr), 
	 .i_read_data(rd),
    .o_pc(pc), 
	 .o_write_data(write_data), 
	 .o_alu(alu_out)
  );
  
  
  instruction_memory im
  (
    .address(pc),
    .instruction(instr)
  );
  
  data_memory dm
  (
    .i_clk(clk), 
	 .i_we(we),
    .address(alu_out),
    .write_data(write_data),
    .read_data(rd)
  );


endmodule 