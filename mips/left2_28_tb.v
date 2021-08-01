`timescale 1ns/1ns

module left2_28_tb ();
    reg [25:0] in;
    reg clock;
    wire [27:0] out;

    left2_28 a0(.in(in), .out(out));

    initial begin
        clock = 1'b0; in = 26'd1270033;
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule