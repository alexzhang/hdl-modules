module mux16(
    input [3:0] addr,
    input [15:0] data_in,
    output out
    );

    assign out = data_in[addr];
endmodule
