`timescale 1ns/1ns

module sign16_32_tb();
    reg [15:0] in;
    reg clock;
    wire [31:0] out;

    sign16_32 a0(.in(in), .out(out));

    initial begin
        clock = 1'b0; in = 16'b0000100001011000;
        #20 in = 16'b1110001110010011;
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule
