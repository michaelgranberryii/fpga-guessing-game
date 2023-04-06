module ssd_top (
    input logic clk, 
    input logic [3:0] btn,
    input logic [3:0] sw,
    output logic [3:0] led,
    output logic [6:0] seg,
    output logic chip_sel,
    inout logic [7:0] keypd
);

parameter clk_freq = 125_000_000;
parameter stable_time = 10;

logic rst;
logic btn1_debounce;
logic btn1_pulse;
logic c_sel;
logic [3:0] decode_out_w;
logic is_a_key_pressed;



decoder dc_i (
    .clk(clk),
    .rst(rst),
    .row(keypd[7:4]),
    .col(keypd[3:0]),
    .decoder_out(decode_out_w),
    .is_a_key_pressed(is_a_key_pressed)
);

disp_ctrl ssd_i_sw (
    .disp_val(sw),
    .seg_out(seg)
);

// disp_ctrl ssd_i_kp (
//     .disp_val(decode_out_w),
//     .seg_out(seg)
// );

debounce #(
    .clk_freq(clk_freq),
    .stable_time(stable_time)
)
db_i
(
    .clk(clk),
    .rst(rst),
    .button(btn[1]),
    .result(btn1_debounce)
);

single_pulse_detector
    #(
        .detect_type(2'b0)
    )
    pls_i_1
    (
        .clk(clk),
        .rst(rst),
        .input_signal(btn1_debounce),
        .output_pulse(btn1_pulse)
    );

always_ff@(posedge rst, posedge btn1_pulse) begin
    if (rst) begin
        c_sel <= 1'b0;
    end
    else if (btn1_pulse) begin
        c_sel <= ~c_sel;
    end
end

assign rst = btn[0];
assign keypd_w = keypd;
assign led = sw;
assign chip_sel = c_sel;
    
endmodule