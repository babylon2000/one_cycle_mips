`timescale 1ns / 1ps
module datapath_tb;

  reg clk, reset, reg_dst, op2sel, mem2reg, we3;
  reg [2:0] alu_ctrl;
  reg [31:0] instr, read_data;
  wire [31:0] pc, write_data, alu;


  reg [31:0] data_mem[31:0];

  datapath dp
  (
    .i_clk(clk), 
    .reset(reset),
    .i_reg_dst(reg_dst), 
    .i_op2sel(op2sel), 
    .i_mem2reg(mem2reg), 
    .i_we3(we3),
    .i_alu_ctrl(alu_ctrl),
    .i_instr(instr), 
    .i_read_data(read_data),
    .o_pc(pc), 
    .o_write_data(write_data), 
    .o_alu(alu)
  );


  initial begin
    clk = 0;
    forever #20 clk = ~clk;
  end

  initial begin
    reset = 0;
    reg_dst = 0;
    op2sel = 0;
    mem2reg = 0;
    we3 = 0;
    alu_ctrl = 3'b010;
    instr = 32'b10001100000001000000000000000011;  //lw $4, 3($0)
    #10;
    reset = 1;
    we3 = 1'b1;
    op2sel = 1'b1;
    mem2reg = 1'b1;
    #1;
    $display("alu = %32b\nsrcb = %32b\nsrca = %32b", alu, dp.w2alu, dp.src_a);
    read_data = 32;
    @(posedge clk);
    #1;
    $display("%h\n", dp.rf.reg_mem[4]);
    instr = 32'b10001100000001010000000000000010; //lw $5, 2($0)
    read_data = 64;
    @(posedge clk);
    #1;
    $display("%h\n", dp.rf.reg_mem[5]);
    #10;
    //add check
    reg_dst = 1'b1;
    op2sel = 1'b0;
    mem2reg = 1'b0;
    instr = 32'b00000000101001000011000000100000; //add $6, $5, $4
    @(posedge clk);
    #1;
    $display("%d\n", dp.rf.reg_mem[6]);
    #10;
    we3 = 1'b0;
    op2sel = 1'b1;
    instr = 32'b10101100000001100000000000000001; //sw $6, 1($0)
    @(posedge clk) begin
      data_mem[alu] = write_data;   
    end
    #1;
    $display("%d", data_mem[1]);
  end

endmodule 