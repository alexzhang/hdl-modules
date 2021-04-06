`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// References:
// - https://en.wikipedia.org/wiki/Xorshift
// - https://electronics.stackexchange.com/questions/30521/random-bit-sequence-using-verilog
//////////////////////////////////////////////////////////////////////////////////

module xorshift_32(input clk, input rst, output [31:0] out);
    /* PSEUDORANDOM INPUT DATA GENERATOR XORSHIFT */
    reg [31:0] xorshift_32_state;
    wire [31:0] xorshift_step1 = xorshift_32_state ^ {xorshift_32_state[18:0], 13'b0};
    wire [31:0] xorshift_step2 = xorshift_step1 ^ {17'b0, xorshift_step1[31:17]};
    wire [31:0] xorshift_step3 = xorshift_step2 ^ {xorshift_step2[26:0], 5'b0};

    always @(posedge clk)
        if (rst)
            xorshift_32_state <= 32'b01010101010101010101010101010101;
        else
            xorshift_32_state <= xorshift_step3;

    assign out = xorshift_32_state[0];
endmodule

module PRBS7(input clk, input rst, output reg [6:0] d);
    always @(posedge clk)
        if (rst)
            d <= 7'b1010101;
        else
            d <= { d[5:0], d[6] ^ d[5] };
endmodule

module PRBS23(input clk, input rst, output reg [22:0] d);
    always @(posedge clk)
        if (rst)
            d <= 23'b1010101;
        else
            d <= { d[22:0], d[22] ^ d[17] };
endmodule

module PRBS31(input clk, input rst, output reg [30:0] d);
    always @(posedge clk)
        if (rst)
            d <= 31'b1010101;
        else
            d <= { d[30:0], d[30] ^ d[27] };
endmodule
