module mux2in1
#(parameter WIDTH = 8)
(
  input [WIDTH-1:0] op1, op2,
  input sel,
  output [WIDTH-1:0] res
);

  
  assign res = ((sel) ? op1 : op2);

endmodule 