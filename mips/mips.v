module mips (clock, reset, pcout, inst, waddrout, wdout, rd1, rd2, aluop2out, 
            aluout, dmemout, ALUCtr, RegDst, Jump, Branch, MemRead, MemtoReg, 
            ALUOp, MemWrite, ALUSrc, RegWrite);

    input clock, reset;
    output [31:0] pcout, inst, wdout, rd1, rd2, aluop2out, aluout, dmemout;
    output [4:0] waddrout;
    output [2:0] ALUCtr;
    output [1:0] ALUOp;
    output RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    wire [31:0] plus4out, sign32, sign32_left2, aluresult_j, baddr, nxtaddr, jaddr;
    wire [27:0] left2_28out;
    wire Zero;

    reg32a pc(.in(nxtaddr), .clock(clock), .reset(reset), .out(pcout));
    //imem imem(.addr(pcout), .inst(inst)) //instruction memory
    add32 add0(.a(pcout), .b(4), .out(plus4out));
    left2_28 left28_shift(.in(inst[25:0]), .out(left2_28out));
    assign jaddr = {plus4out[31:28], left2_28out};

    left2_32 left32_shift(.in(sign32), .out(sign32_left2));
    add32 add1(.a(plus4out), .b(sign32_left2), .out(aluresult_j));
    mux2_32 mux0(.a(plus4out), .b(aluresult_j), .sel(Zero & Branch), .out(baddr));
    mux2_32 mux1(.a(baddr), .b(jaddr), .sel(Jump), .out(nxtaddr));

    ctr control(.op(inst[31:26]), .RegDst(RegDst), .Jump(Jump), .Branch(Branch),
    .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite),
    .ALUSrc(ALUSrc), .RegWrite(RegWrite));
    mux2_5 mux2(.a(inst[20:16]), .b(inst[15:11]), .sel(RegDst), .out(waddrout));
    regfile32_32 register(.rdaddr1(inst[25:21]), .rdaddr2(inst[20:16]),
    .wraddr(waddrout), .wrdata(wdout), .clock(clock), .reset(reset),
    .RegWrite(RegWrite), .rddata1(rd1), .rddata2(rd2));
    sign16_32 signext(.in(inst[15:0]), .out(sign32));

    mux2_32 mux3(.a(rd2), .b(sign32), .sel(ALUSrc), .out(aluop2out));
    aluctr aluctr(.ALUOp(ALUOp), .func(inst[5:0]), .ALUctr(ALUCtr));
    alu alu(.A(rd1), .B(aluop2out), .ALUctr(ALUCtr), .Result(aluout), .Zero(Zero));
    //dmem dmem(.addr(aluout), .rddata(dmemout), .wrdata(rd2),
    //.MemRead(MemRead), .MemWrite(MemWrite), .clock(clock));

    mux2_32 mux4(.a(aluout), .b(dmemout), .sel(MemtoReg), .out(wdout));
endmodule