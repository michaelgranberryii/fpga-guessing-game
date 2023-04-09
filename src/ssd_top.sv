module ssd_top
#(
    parameter clk_freq = 50_000_000,
    parameter stable_time = 10
)
(
    input logic clk, 
    input logic [1:0] btn,
    input logic sw,
    output logic led,
    output logic [6:0] seg,
    output logic chip_sel,
    input logic [3:0] row,
    output logic [3:0] col
);

// ----------------------------------
//------------------ Logic and Params
// ----------------------------------
localparam max_delay = clk_freq*stable_time/1024;
localparam keypad_size = 16;
localparam btn_size = 2;

logic rst;
logic c_sel;
logic [(keypad_size -1):0] keys;
logic [(keypad_size -1):0] keys_pulse;
logic btn1_debounce;
logic btn1_pulse;
logic [19:0] count_div;
logic [6:0] disp_ctrl_out;
logic [6:0] seg_reg;
logic [6:0] seg1_reg;
logic [6:0] seg2_reg;
logic btn_press_toggle;

// ----------------------------------
//---------------------------- Keypad
// ----------------------------------
decoder  
#(
    .clk_freq(clk_freq),
    .stable_time(stable_time)
)
decoder_i
(
    .clk(clk),
    .rst(rst),
    .row(row),
    .col(col),
    .keys(keys)
);

genvar n;
generate
    for (n = 0; n<keypad_size; n++) begin
        single_pulse_detector sp_i (
            .clk(clk),
            .rst(rst),
            .input_signal(keys[n]),
            .output_pulse(keys_pulse[n])
        );
    end    
endgenerate

disp_ctrl dc_i (
    .disp_val(keys),
    .seg_out(disp_ctrl_out)
);

// ----------------------------------
//---------------------------- Button
// ----------------------------------
debounce
#(
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

single_pulse_detector sp_i (
    .clk(clk),
    .rst(rst),
    .input_signal(btn1_debounce),
    .output_pulse(btn1_pulse)
);

// ----------------------------------
//---------------------------- Design
// ----------------------------------

// Chip select
always_ff@(posedge rst, posedge clk) begin
    if (rst) begin
        c_sel <= 1'b0;
        count_div <= 'b0;
    end
    else begin
        if (sw == 0) begin
            if (btn1_pulse) begin
                c_sel <= ~c_sel;
            end
        end
        else begin
            count_div <= count_div + 'b1;
            if (count_div == max_delay) begin
                count_div <= 'b0;
                c_sel <= ~c_sel;
            end
        end
    end
end

// Capture ssd value
always_ff@(posedge clk, posedge rst) begin
    if (rst) begin
        seg1_reg <= 7'b0;
        seg2_reg <= 7'b0;
        btn_press_toggle <= 1'b1;
    end
    else begin
        if (|keys_pulse) begin
            if (sw == 0) begin
                
                seg1_reg <= disp_ctrl_out;
            end
            else begin
                if (btn_press_toggle) begin
                    seg1_reg <= disp_ctrl_out;
                    seg2_reg <= 0;
                    btn_press_toggle <= 0;
                end
                else begin
                    seg2_reg <= disp_ctrl_out;
                    btn_press_toggle <= 1;
                end
            end
        end
    end
end

// Show ssd value
always_ff@(posedge clk, posedge rst) begin
    if (rst) begin
        seg_reg <= 0;
    end
    else begin
        if (sw == 0)
            seg_reg <= seg1_reg;
        else 
            if (chip_sel)
                seg_reg <= seg1_reg;
            else
                seg_reg <= seg2_reg;
    end
end

assign seg = seg_reg;
assign rst = btn[0];
assign led = sw;
assign chip_sel = c_sel;
    
endmodule