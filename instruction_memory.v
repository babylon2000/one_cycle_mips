module instruction_memory
(
  input [31:0] address,
  output [31:0] instruction
);


  reg [31:0] mem [31:0];
  
  
  initial
    begin
	   $readmemb("E:\\fpga\\labs\\mips\\instr.bin", mem);
	 end
	 
  assign instruction = mem[address];

endmodule 