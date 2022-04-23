module prom(
    input clk,
    input [4:0] addr,
    output reg [7:0] data
    );

    always @(posedge clk)
        case (addr)
            4'b0000: data = {4'b1000, addr};
            4'b0001: data = {4'b0111, addr};
            4'b0010: data = {4'b0110, addr};
            4'b0011: data = {4'b0101, addr};
            4'b0100: data = {4'b0100, addr};
            4'b0101: data = {4'b0011, addr};
            4'b0110: data = {4'b0010, addr};
            4'b0111: data = {4'b0001, addr};
            4'b1000: data = {4'b0000, addr};
            4'b1001: data = {4'b1111, addr};
            4'b1010: data = {4'b1110, addr};
            4'b1011: data = {4'b1101, addr};
            4'b1100: data = {4'b1100, addr};
            4'b1101: data = {4'b1011, addr};
            4'b1110: data = {4'b1010, addr};
            4'b1111: data = {4'b1001, addr};
            default: data = 8'b00000000; // blank
        endcase
endmodule
