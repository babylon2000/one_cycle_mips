module shift_left_by_2
(
  input [31:0] bef_shift,
  output [31:0] aft_shift
);


  assign aft_shift = bef_shift << 2;


endmodule 