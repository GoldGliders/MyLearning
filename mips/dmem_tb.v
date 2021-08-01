`timescale 1ns/1ns

module dmem_tb();
    reg [31:0] addr, wrdata;
    reg MemRead, MemWrite, clock;
    wire [31:0] rddata;

    dmem d(.addr(addr), .rddata(rddata), .wrdata(wrdata), .MemRead(MemRead), .MemWrite(MemWrite), .clock(clock));
    initial begin
        clock = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        #6
        addr = 32'd10;
        MemWrite = 1'b1;
        wrdata = 32'd01270033;
        #10
        MemWrite = 1'b0;
        MemRead = 1'b1;
        #10
        addr = 32'd100;
        #10
        $finish;
    end
    always #5 clock =~ clock;
endmodule
