module mux_tb;

  parameter W1 = 5,
            W2 = 32;

  reg [W1-1:0] op1_5, op2_5;
  reg [W2-1:0] op1_32, op2_32;
  reg sel_tb;
  wire [W1-1:0] res_5;
  wire [W2-1:0] res_32;
  

  /*mux2in1 #(W1) mux_inst
  (
    .op1(op1_5), 
    .op2(op2_5),
    .sel(sel_tb),
    .res(res_5)
  );  

  initial begin
    op1_5 = 5'b10000;
    op2_5 = 5'b00000;
    sel_tb = 1;
    #1;
    $display("%5b", res_5);
    sel_tb = 0;
    #1;
    $display("\n%5b", res_5);
  end*/


  mux2in1 #(W2) mux_inst
  (
    .op1(op1_32), 
    .op2(op2_32),
    .sel(sel_tb),
    .res(res_32)
  );  

  initial begin
    op1_32 = 32'd55;
    op2_32 = 32'd30;
    sel_tb = 1;
    #1;
    $display("%d", res_32);
    sel_tb = 0;
    #1;
    $display("\n%d", res_32);
  end

endmodule 