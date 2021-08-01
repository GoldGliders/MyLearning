`timescale 1ns/1ns

module aluctr_tb();
    reg [5:0] func;
    reg [1:0] ALUOp;
    wire [2:0] ALUctr;

    aluctr a0(.ALUOp(ALUOp), .func(func), .ALUctr(ALUctr));

    initial begin
        clock = 1'b0; ALUOp = 2'b00; func = 6'b000000;
        #20 ALUOp = 2'b01; func = 6'b000000;
        #20 ALUOp = 2'b10; func = 6'b000000;
        #20 ALUOp = 2'b10; func = 6'b000010;
        #20 ALUOp = 2'b10; func = 6'b000100;
        #20 ALUOp = 2'b10; func = 6'b000101;
        #20 ALUOp = 2'b10; func = 6'b001010;
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule
