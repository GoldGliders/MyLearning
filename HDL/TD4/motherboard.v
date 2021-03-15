module MOTHERBOARD(
    input logic clk,
    input logic n_reset,
    input logic [3:0] switch,
    output logic [3:0] led
);

logic [3:0] addr, count;
logic [7:0] data;

COUNTER counter(clk, n_reset, count);
CPU cpu(clk, n_reset, addr, data, switch, led);
ROM rom(addr, data);

endmodule
