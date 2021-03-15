module TOP;

logic clk, n_reset;
logic [3:0] led, switch;

MOTHERBOARD motherboard(clk, n_reset, switch, led);

initial begin;
    $dumpfile("td4.vcd");
    $dumpvars(0, TOP);

    clk = 0;
    n_reset = 0;
    switch = 4'b1110;

    #15 n_reset = 1;
    #640 $finish;
end

always #10
    clk <= !clk;

endmodule
