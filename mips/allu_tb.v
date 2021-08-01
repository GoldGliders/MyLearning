`timescale 1ns/1ns

module alu_tb();
    reg [31:0] in1, in2;
    reg [1:0] ALUctr;
    wire [31:0] Result;
    wire Zero;

    alu a0(.A(in1), .B(in2), .ALUctr(ALUctr), .Result(Result), .Zero(Zero));

    initial begin
        clock = 1'b0; in1 = 32'd127; in2 = 32'd0033; ALUctr = 000;
        #20 in1 = 32'd127; in2 = 32'd0033; ALUctr = 001;
        #20 in1 = 32'd127; in2 = 32'd0033; ALUctr = 010;
        #20 in1 = 32'd127; in2 = 32'd0033; ALUctr = 110;
        #20 in1 = 32'd127; in2 = 32'd0033; ALUctr = 111;
        #20 in1 = 32'd10; in2 = 32'd10; ALUctr = 110;
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule
