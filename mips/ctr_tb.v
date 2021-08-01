`timescale 1ns/1ns

module ctr_tb();
    reg [5:0] op;
    reg clock;
    wire [1:0] ALUOp;
    wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;

    ctr a0(.op(op), .RegDst(RegDst), .Jump(Jump), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));

    initial begin
        clock = 1'b0; op = 6'b000000; //R-type
        #20 op = 6'b000010; //j
        #20 op = 6'b000100; //beq
        #20 op = 6'b101011; //sw
        #20 op = 6'b100011; //lw
        #20 $finish;
    end
    always #10 clock =~ clock;
endmodule
