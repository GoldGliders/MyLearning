module TOP;

logic CLK, RST, led, addr, data;
logic [3:0] COUNT, OUT;

COUNTER counter(CLK, RST, COUNT);
ROM1 rom(addr, data);
CPU1 cpu(CLK, RST, data, led, addr);


initial begin;
    $dumpfile("test.vcd");
    $dumpvars(1, TOP);

    CLK = 0;
    RST = 1;

    #15 RST = 0;
    #640 $finish;
end

always #10
    CLK <= !CLK;

endmodule
