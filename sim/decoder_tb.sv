`timescale 1ns / 1ps
module decoder_tb;
    parameter clk_freq = 1024;
    parameter stable_time = 0;

    logic clk_tb;
    logic rst_tb;
    logic [3:0] row_tb;
    logic [3:0] col_tb;
    logic [15:0] keys_tb;
    integer duty_cycle = 10;
    integer wait_time = 16*2*duty_cycle;

decoder
#(
    .clk_freq_db(clk_freq),
    .stable_time(stable_time)
)
uut_i
(
    .clk(clk_tb),
    .rst(rst_tb),
    .row(row_tb),
    .col(col_tb),
    .keys(keys_tb)
);
initial begin
    rst_tb = 1;
    clk_tb = 1;
    #duty_cycle;
    rst_tb = 0;
    #duty_cycle;
end

always #duty_cycle clk_tb = ~clk_tb;
        
initial begin
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
$stop;
end

endmodule