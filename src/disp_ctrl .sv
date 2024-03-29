module disp_ctrl (
    input logic [15:0] disp_val,
    output logic [6:0] seg_out
);

always_comb begin
    case (disp_val)
        16'b0000000000000001: seg_out = 7'b1111110; // 0
        16'b0000000000000010: seg_out = 7'b0110000; // 1
        16'b0000000000000100: seg_out = 7'b1101101; // 2
        16'b0000000000001000: seg_out = 7'b1111001; // 3
        16'b0000000000010000: seg_out = 7'b0110011; // 4
        16'b0000000000100000: seg_out = 7'b1011011; // 5
        16'b0000000001000000: seg_out = 7'b1011111; // 6
        16'b0000000010000000: seg_out = 7'b1110000; // 7
        16'b0000000100000000: seg_out = 7'b1111111; // 8
        16'b0000001000000000: seg_out = 7'b1110011; // 9
        16'b0000010000000000: seg_out = 7'b1110111; // A
        16'b0000100000000000: seg_out = 7'b0011111; // C
        16'b0001000000000000: seg_out = 7'b1001110; // b
        16'b0010000000000000: seg_out = 7'b0111101; // d
        16'b0100000000000000: seg_out = 7'b1001111; // E
        16'b1000000000000000: seg_out = 7'b1000111; // F
    endcase

end
    
endmodule