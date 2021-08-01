module cntimple (SW0, SW1, SW2, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, clock);
    input SW0, SW1, SW2, clock;
    output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
    wire [4:0] state;
    wire mclk;

    assign HEX2 = 7'b1111111, HEX3 = 7'b1111111, HEX4 = 7'b1111111,
           HEX5 = 7'b1111111, HEX6 = 7'b1111111, HEX7 = 7'b1111111;

    clockgen a0(.clock(clock), .reset(reset), .mclk(mclk));
    counter20 a1(.start(SW1), .ud(SW2), .mclk(mclk), .reset(SW0), .state(state));
    ledctr a2(.state(state), .hex0(HEX0), .hex1(HEX1));
endmodule