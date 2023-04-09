module decoder 
#(
    parameter clk_freq = 50_000_000,
    parameter stable_time = 10
)
(
    input logic clk,
    input logic rst,
    input logic [3:0] row,
    output logic [3:0] col,
    output logic [15:0] keys
);

localparam keypad_size = 16;
localparam max_delay = 16;

logic [3:0] row_int;
logic [(keypad_size-1):0] keys_int;
logic [(keypad_size-1):0] keys_stored;
logic [(keypad_size-1):0] presses;
logic [31:0] count;

// Generate 16 debounce modules for each key
genvar i;
generate
    for (i = 0; i<keypad_size; i++) begin
       debounce
    #(
        .clk_freq(clk_freq),
        .stable_time(stable_time)
    )
    db_i
    (
        .clk(clk),
        .rst(rst),
        .button(keys_stored[i]),
        .result(keys[i])
    ); 
    end    
endgenerate

// Sync row
always_ff @(posedge clk) begin : synchronizer
    if (rst) begin
        row_int <= 0;
    end
    else begin
        row_int <= row;
    end
end

// Capure keys
integer  j;
always_ff @( posedge rst, posedge clk ) begin : capture_keys 
    if (rst) begin
        col <= 4'b1111;
        keys_int <= 0;
        keys_stored <= 0;
        count <= 0;
        presses <= 0;
    end
    else begin
        presses <= 0;
        if (count < max_delay-1) begin // wait for 320 ns
            count <= count + 1;
        end
        else begin
            count <= 0;
            case (col)
                4'b1111: begin     
                    for (j = 0; j < keypad_size; j++) begin
                        if (keys_int[j] == 1) begin
                            presses <= presses + 1;
                        end
                    end
                    if (presses < 2) begin
                        keys_stored <= keys_int;
                    end
                    else begin
                        keys_stored <= 0;
                    end
                    keys_int <= 0;
                    col <= 4'b0111;
                end
                4'b0111: begin
                    keys_int[1] <= ~row_int[3];
                    keys_int[4] <= ~row_int[2];
                    keys_int[7] <= ~row_int[1];
                    keys_int[0] <= ~row_int[0];
                    col <= 4'b1011;
                end
                4'b1011: begin
                    keys_int[2] <= ~row_int[3];
                    keys_int[5] <= ~row_int[2];
                    keys_int[8] <= ~row_int[1];
                    keys_int[15] <= ~row_int[0];
                    col <= 4'b1101;
                end
                4'b1101: begin
                    keys_int[3] <= ~row_int[3];
                    keys_int[6] <= ~row_int[2];
                    keys_int[9] <= ~row_int[1];
                    keys_int[14] <= ~row_int[0];
                    col <= 4'b1110;
                end
                4'b1110: begin
                    keys_int[10] <= ~row_int[3];
                    keys_int[11] <= ~row_int[2];
                    keys_int[12] <= ~row_int[1];
                    keys_int[13] <= ~row_int[0];
                    col <= 4'b1111;
                end
            endcase
        end
    end
end

endmodule