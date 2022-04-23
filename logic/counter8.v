module counter8(
    input reset,
    input clk,
    input en,
    input load,
    input [7:0] data_in,
    output reg [7:0] data_out
    );

    always @(posedge clk)
    begin
        if (reset)
            data_out <= 8'b00000000;
        else if (en)
        begin
            data_out <= (load) ? data_in : data_out + 1;
        end
    end
endmodule
