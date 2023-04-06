`timescale 1ns / 1ps
module disp_ctrl_tb;
    logic [3:0] disp_val_tb;
    logic [6:0] seg_out_tb;
    
    disp_ctrl uut (
        .disp_val(disp_val_tb),
        .seg_out(seg_out_tb)
    );


endmodule