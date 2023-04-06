module decoder (
    input logic clk,
    input logic rst,
    input logic [3:0] row,
    output logic [3:0] col,
    output logic [3:0] decoder_out,
    output logic is_a_key_pressed
);

// declar
logic [26:0] sclk;
logic [3:0] decode_reg;
logic is_a_key_pressed_reg;

// model
always_ff @ (posedge clk, posedge rst) begin
    if (rst) begin
        decode_reg <= 4'b0;
        is_a_key_pressed_reg <= 1'b0;
    end
    else begin
        if (sclk == 26'd100000) begin
            // C1
            col <= 4'b0111;
            sclk <= sclk + 1;
        end
        else if (sclk == 26'd100008) begin
            // R1
            if (row == 4'b0111) begin
                decode_reg <= 4'b0001; // 1
                is_a_key_pressed_reg <= 1'b1;
            end
            // R2
            else if (row == 4'b1011) begin
                decode_reg <= 4'b0100; //4
                is_a_key_pressed_reg <= 1'b1;
            end
            // R3
            else if (row == 4'b1011) begin
                decode_reg <= 4'b0111; // 7
                is_a_key_pressed_reg <= 1'b1;
            end
            // R4
            else if (row == 4'b1011) begin
                decode_reg <= 4'b0000; // 0
                is_a_key_pressed_reg <= 1'b1;
            end
            sclk <= sclk + 1;
        end
        // C2
        else if (sclk == 26'd200000) begin
            // C1
            col <= 4'b0111;
            sclk <= sclk + 1;
        end
        else if (sclk == 26'd200008) begin
            // R1
            if (row == 4'b0111) begin
                decode_reg <= 4'b0010; // 2
                is_a_key_pressed_reg <= 1'b1;
            end
            // R2
            else if (row == 4'b1011) begin
                decode_reg <= 4'b0101; // 5
                is_a_key_pressed_reg <= 1'b1;
            end
            // R3
            else if (row == 4'b1101) begin
                decode_reg <= 4'b1111; // 8
                is_a_key_pressed_reg <= 1'b1;
            end
            // R4
            else if (row == 4'b1110) begin
                decode_reg <= 4'b1111; // F
                is_a_key_pressed_reg <= 1'b1;
            end
            sclk <= sclk + 1;
        end
        // C3
        else if (sclk == 26'd300000) begin
            // C1
            col <= 4'b1011;
            sclk <= sclk + 1;
        end
        else if (sclk == 26'd300008) begin
            // R1
            if (row == 4'b0111) begin
                decode_reg <= 4'b0011; // 3
                is_a_key_pressed_reg <= 1'b1;
            end
            // R2
            else if (row == 4'b1011) begin
                decode_reg <= 4'b0110; // 6
                is_a_key_pressed_reg <= 1'b1;
            end
            // R3
            else if (row == 4'b1101) begin
                decode_reg <= 4'b1001; // 9
                is_a_key_pressed_reg <= 1'b1;
            end
            // R4
            else if (row == 4'b1110) begin
                decode_reg <= 4'b1110; // E
                is_a_key_pressed_reg <= 1'b1;
            end
            sclk <= sclk + 1;
        end
        // C4
        else if (sclk == 26'd400000) begin
            // C1
            col <= 4'b0111;
            sclk <= sclk + 1;
        end
        else if (sclk == 26'd400008) begin
            // R1
            if (row == 4'b0111) begin
                decode_reg <= 4'b1010; // A
                is_a_key_pressed_reg <= 1'b1;
            end
            // R2
            else if (row == 4'b1011) begin
                decode_reg <= 4'b1011; // B
                is_a_key_pressed_reg <= 1'b1;
            end
            // R3
            else if (row == 4'b1101) begin
                decode_reg <= 4'b1100; // C
                is_a_key_pressed_reg <= 1'b1;
            end
            // R4
            else if (row == 4'b1110) begin
                decode_reg <= 4'b1101; // D
                is_a_key_pressed_reg <= 1'b1;
            end
            sclk <= sclk + 1;
        end
    end
end;

assign is_a_key_pressed = is_a_key_pressed_reg;
assign decoder_out = decode_reg;

endmodule