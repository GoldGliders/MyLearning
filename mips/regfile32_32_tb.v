`timescale 1ns/1ns

module regfile32_32_tb();
    reg [4:0] rdaddr1, rdaddr2, wraddr;
    reg [31:0] wrdata;
    reg clock, reset, RegWrite;
    wire [31:0] rddata1, rddata2;

    regfile32_32 a0(.rdaddr1(rdaddr1), .rdaddr2(rdaddr2), .wraddr(wraddr), .wrdata(wrdata),
                    .clock(clock), .reset(reset), .RegWrite(RegWrite), .rddata1(rddata1), .rddata2(rddata2));

    initial begin
        clock = 1'b0;
        #3 reset = 1; //3
        #5 reset = 0; //8
        #8 RegWrite = 1; wraddr = 5'd1; wrdata = 32'd100; //16
        #10 wraddr = 5'd4; wrdata = 32'd5; //26
        #10 wraddr = 5'd8; wrdata = 32'd333; //36
        #10 wraddr = 5'd16; wrdata = 32'd2000; //46
        #10 RegWrite = 0; rdaddr1 = 5'd1; //56
        #10 rdaddr2 = 5'd4; //66
        #10 rdaddr1 = 5'd8; rdaddr2 = 5'd16; //76
        #10 rdaddr1 = 5'd24; //86
        #20 $finish;
    end
    always #5 clock =~ clock;
endmodule
