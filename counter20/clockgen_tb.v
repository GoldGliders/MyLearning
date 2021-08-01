`timescale 1ns/1ns

module clockgen_tb();
    reg clock, reset;
    wire mclk;
    clockgen a0(.clock(clock), .reset(reset), .mclk(mclk));

    initial begin
        clock = 1'b0; reset = 1'b1;
        #5 reset = 1'b0;
        #1000000100 $finish;
    end
    always  #10 clock =~ clock;
endmodule