module register_file
(
  input i_clk, i_we3,
  input [4:0] ra1, ra2,
  input [4:0] wa,
  input [31:0] wd,
  output [31:0] rd1, rd2
);


  reg [31:0] reg_mem [31:1];
  
  always @(posedge i_clk)
    begin
	   if(i_we3 && wa)
		  reg_mem[wa] <= wd;
	 end
	 
	 
  assign rd1 = (ra1 == 0 ? 0 : reg_mem[ra1]);
  assign rd2 = (ra2 == 0 ? 0 : reg_mem[ra2]);


endmodule 