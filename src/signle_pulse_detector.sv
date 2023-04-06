module single_pulse_detector 
    #(
        parameter detect_type = 2'b0
    )
    (
        input logic clk,
        input logic rst,
        input logic input_signal,
        output logic output_pulse
    );
        
    // declar
    logic ff0;
    logic ff1;

    // model
    always_ff@(posedge clk, posedge rst) begin
        if (rst == 1) begin
            ff0 <= 1'b0;
            ff1 <= 1'b0;
        end
        else if (clk == 1) begin
            ff0 <= input_signal;
            ff1 <= ff0;
        end
    end

    always_comb begin
        if (detect_type == 2'd0)
            output_pulse = ~ff1 & ff0;
        else if (detect_type == 2'd1)
            output_pulse = ~ff0 & ff0;
        else if (detect_type == 2'd3)
            output_pulse = ff0 ^ ff1;
        else
            output_pulse = 1'd0;
    end


endmodule