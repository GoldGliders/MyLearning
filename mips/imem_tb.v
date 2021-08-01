`timescale 1ns/1ns

module imem_tb();
    reg [31:0] addr;
    wire [31:0] inst;

    imem i(.addr(addr), .inst(inst));
    initial begin
        i.mcell[32'd0] = 32'd00000000;
        i.mcell[32'd1] = 32'd00000127;
        i.mcell[32'd10] = 32'd00000033;
        addr = 32'd0;
        #10
        addr = 32'd1;
        #10
        addr = 32'd10;
        #10
        addr = 32'd100;
        #10
        $finish;
    end
endmodule
