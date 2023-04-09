`timescale 1ns / 1ps


module debounce
    #(
        parameter clk_freq = 50_000_000,
        parameter stable_time = 10
        
    )
    (
        input logic clk,
        input logic rst,
        input logic button,
        output logic result
    );

    logic sig;
    logic [31:0] count;
    localparam max_delay = clk_freq*stable_time/1024;

    // Debounce button
    always_ff @( posedge clk, posedge rst ) begin
        if (rst) begin
            sig <= 1'b0;
            count <= 0;
        end
        else begin
            if (button) begin
                if (count == max_delay) begin
                    sig <= 1'b1;
                end
                count <= count + 1;
            end
            else begin
                sig <= 1'b0;
                count <= 0;
            end
        end
    end

    assign result = sig;
endmodule