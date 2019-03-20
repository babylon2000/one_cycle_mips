module data_memory
(
  input i_clk, i_we,
  input [31:0] address,
  input [31:0] write_data,
  output [31:0] read_data
);

  reg [31:0] mem [31:0];
  
  initial
    begin
	   $readmemh("E:\\fpga\\labs\\mips\\data.bin", mem);
	 end

  always @(posedge i_clk)
    begin
	   if(i_we)
		  mem[address] <= write_data;
	 end
	 
  assign read_data = mem[address];


endmodule 