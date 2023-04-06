module ssd_top_tb;
    logic clk_tb = 1'b1;
    logic [3:0] btn_tb;
    logic [3:0] sw_tb;
    logic [3:0] led_tb;
    logic [6:0] seg_tb;
    logic chip_sel_tb;

    ssd_top uut (
        .clk(clk_tb),
        .tn(btn_tb),
        .sw(sw_tb),
        .led(led_tb),
        .seg(seg_tb),
        .chip_sel(chip_sel_tb)
    );

    initial
        begin
          sw_tb <= 4'b0010; 
        end

    always 
    begin
        clk_tb = ~ clk_tb; # 5;
    end
endmodule