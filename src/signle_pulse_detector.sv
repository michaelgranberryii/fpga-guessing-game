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
        
    
    logic ff0;
    logic ff1;

    // Register input signal
    always_ff@(posedge clk, posedge rst) begin
        if (rst) begin
            ff0 <= 1'b0;
            ff1 <= 1'b0;
        end
        else begin
            ff0 <= input_signal;
            ff1 <= ff0;
        end
    end

    // Produce output pulse type
    always_comb begin
        if (detect_type == 2'b00)
            output_pulse = ~ff1 & ff0;
        else if (detect_type == 2'b01)
            output_pulse = ~ff0 & ff1;
        else if (detect_type == 2'b10)
            output_pulse = ff0 ^ ff1;
        else
            output_pulse = 1'b0;
    end


endmodule