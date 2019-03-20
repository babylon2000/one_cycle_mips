module pc_jmp
(
  input [3:0] head_old_pc,
  input [25:0] jmp,
  output [31:0] new_pc 
);


  assign new_pc = {head_old_pc, jmp, 2'b00};


endmodule 