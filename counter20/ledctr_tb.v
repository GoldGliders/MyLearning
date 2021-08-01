`timescale 1ns/1ns
module ledctr_tb ();
    reg [4:0] state;
    //wire h00, h01, h02, h03, h04, h05, h06, h10, h11, h12, h13, h14, h15, h16;
    /*ledctr a0(.state(state), .h00(h00), .h01(h01), .h02(h02), .h03(h03), .h04(h04), .h05(h05), .h06(h06),
              .h10(h10), .h11(h11), .h12(h12), .h13(h13), .h14(h14), .h15(h15), .h16(h16));
            */
    wire [6:0] hex0, hex1;
    ledctr a0(.state(state), .hex0(hex0), .hex1(hex1));

    initial begin
            state = 5'b00000; //state = 0
        #20 state = 5'b00001;
        #20 state = 5'b00010;
        #20 state = 5'b00011;
        #20 state = 5'b00100;
        #20 state = 5'b00101;
        #20 state = 5'b00110;
        #20 state = 5'b00111;
        #20 state = 5'b01000;
        #20 state = 5'b01001;
        #20 state = 5'b01010;
        #20 state = 5'b01011;
        #20 state = 5'b01100;
        #20 state = 5'b01101;
        #20 state = 5'b01110;
        #20 state = 5'b01111;
        #20 state = 5'b10000;
        #20 state = 5'b10001;
        #20 state = 5'b10010;
        #20 state = 5'b10011; //state = 19
        #20 $finish;
    end
endmodule