`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Use lsfr_clock_div_tool to calculate overflow value at desired count.
//
// References:
// - https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
//////////////////////////////////////////////////////////////////////////////////

module div_by_100M(input clk, input rst, output reg q);
    reg [25:0] d;

    wire div_overflow = (lsfr == 26'd45641777);
    always @(posedge clk)
        if (rst || div_overflow)
            d <= 26'b1;
        else
            d <= { d[24:0], d[25] ^ d[5] ^ d[1] ^ d[0] };

    always @(posedge clk)
        if (div_overflow) q <= ~q;
endmodule
