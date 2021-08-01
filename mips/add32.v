module add32(a, b, out);
    input [31:0] a, b;
    output [31:0] out;
    reg [31:0] out;

    always@(a or b)
        out <= a + b;

endmodule
