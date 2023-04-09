`timescale 1ns / 1ps
module ssd_top_tb;

parameter clk_freq = 1024;
parameter stable_time = 5;

logic clk_tb; 
logic [1:0] btn_tb;
logic sw_tb;
logic led_tb;
logic [6:0] seg_tb;
logic chip_sel_tb;
logic [3:0] row_tb;
logic [3:0] col_tb;

integer duty_cycle = 10;
integer wait_time = 16*2*duty_cycle;
integer debouce_time = 10*2*duty_cycle;

ssd_top
#(
    .clk_freq(clk_freq),
    .stable_time(stable_time)
)
ssd_top_i
(
    .clk(clk_tb),
    .btn(btn_tb),
    .sw(sw_tb),
    .led(led_tb),
    .seg(seg_tb),
    .chip_sel(chip_sel_tb),
    .row(row_tb),
    .col(col_tb)
);

initial begin
    btn_tb[0] = 1;
    clk_tb = 0;
    #duty_cycle; #duty_cycle;
    btn_tb[0] = 0;
    #duty_cycle; #duty_cycle;
end

always #duty_cycle clk_tb = ~clk_tb;

initial begin
    sw_tb = 0;
    btn_tb[1] = 0;
    // Row 1
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 2
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 3
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 4
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;

    // Not presses
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Toggle chip select
    btn_tb[1] = 1; #debouce_time;
    btn_tb[1] = 0; #duty_cycle; #duty_cycle;

    // Row 1
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;


    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 2
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;


    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 3
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 4
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;

    // Not presses
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Toggle chip select
    btn_tb[1] = 1; #debouce_time;
    btn_tb[1] = 0; #duty_cycle; #duty_cycle;


    // Switch = 1;
    sw_tb = 1;

    // Row 1
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 2
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 3
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;
    row_tb = 4'b1111; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Row 4
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b0111; #wait_time;
    
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1011; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1101; #wait_time;

    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1110; #wait_time;

    // Not presses
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;
    row_tb = 4'b1111; #wait_time;

    // Switch = 0;
    sw_tb = 0;
    $stop;
end

endmodule