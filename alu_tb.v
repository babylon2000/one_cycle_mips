`timescale 1ns / 1ps
module alu_tb;

  reg [31:0] srca_t, srcb_t;
  reg [2:0] control;
  wire [31:0] res;


  alu alu_inst(.srca(srca_t), .srcb(srcb_t), .alu_ctrl(control), .alu_out(res));


  initial begin
    control = 3'b010;
    srca_t = 32'd10;
    srcb_t = 32'd15;
    #1;
    $display("Control si 3'b%3b\nResult = %d", control, res);
    #10;
    control = 3'b110;
    srca_t = 32'd15;
    srcb_t = 32'd10;
    #1;
    $display("Control si 3'b%3b\nResult = %d", control, res);
  end

endmodule 