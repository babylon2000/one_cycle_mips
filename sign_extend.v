module sign_extend
(
  input [15:0] sne_data,
  output [31:0] se_data
);


  assign se_data = {{16{sne_data[15]}}, sne_data};

endmodule 