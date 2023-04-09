`timescale 1ns / 1ps
module disp_ctrl_tb;
    logic [15:0] disp_val_tb;
    logic [6:0] seg_out_tb;

    disp_ctrl uut (
        .disp_val(disp_val_tb),
        .seg_out(seg_out_tb)
    );


initial begin
    disp_val_tb = 16'b0000000000000001; #10;
    disp_val_tb = 16'b0000000000000010; #10;
    disp_val_tb = 16'b0000000000000100; #10;
    disp_val_tb = 16'b0000000000001000; #10;
    disp_val_tb = 16'b0000000000010000; #10;
    disp_val_tb = 16'b0000000000100000; #10;
    disp_val_tb = 16'b0000000001000000; #10;
    disp_val_tb = 16'b0000000010000000; #10;
    disp_val_tb = 16'b0000000100000000; #10;
    disp_val_tb = 16'b0000001000000000; #10;
    disp_val_tb = 16'b0000010000000000; #10;
    disp_val_tb = 16'b0000100000000000; #10;
    disp_val_tb = 16'b0001000000000000; #10;
    disp_val_tb = 16'b0010000000000000; #10;
    disp_val_tb = 16'b0100000000000000; #10;
    disp_val_tb = 16'b1000000000000000; #10;
    $stop;
end
endmodule