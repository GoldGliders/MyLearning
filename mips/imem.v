module imem (addr, inst);
    input [31:0] addr;
    output [31:0] inst;
    reg [31:0] mcell [1023:0];

    assign inst = mcell[addr];
endmodule
