`timescale 1ns/1ns

module left2_32_tb ();
    reg [31:0] in;
    reg clock;
    wire [31:0] out;

    left2_32 a0(.in(in), .out(out));

    initial begin
        clock = 1'b0; in = 32'd1270033;
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule
