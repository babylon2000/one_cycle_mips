`timescale 1ns / 1ps

module mips_core_test;

    reg i_clk, i_rst_n;

    mips mips_core(.clk(i_clk), .reset(i_rst_n));

    parameter period = 100;

    initial begin
        i_rst_n = 0;
        #70 i_rst_n = 1;
    end

    initial begin
        i_clk = 0;
        forever #(period/2) i_clk = ~i_clk;
    end
	 
  initial begin
    repeat (8) @(posedge i_clk);
  end

  initial begin
    $monitor("pc = %h\npcplus4 = %h\npc_branch = %h\npc_src = %b\npc_b = %h\ni_branch = %b\nzf = %b\nalu_out", mips_core.pc, mips_core.dp.pcplus4, mips_core.dp.pc_branch, mips_core.dp.pc_src, 
                                                                                               mips_core.dp.pc_b, mips_core.dp.i_branch, mips_core.dp.zf, mips_core.alu_out);
  end

  initial #3400 $stop;

endmodule