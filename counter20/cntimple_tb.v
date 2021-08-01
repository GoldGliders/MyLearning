`timescale 1ns/1ns
module cntimple_tb();
	reg SW0, SW1, SW2, clock;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	cntimple a0(.SW0(SW0), .SW1(SW1), .SW(SW2), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5), .HEX6(HEX6), .HEX7(HEX7), .clock(clock));

	initial begin
			SW0 = 1'b1; clock = 1'b0;
		#5  SW0 = 1'b0; SW2 = 1'b0; SW1 = 1'b0; //state 0
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 1
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 2
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 3
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 4
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 5
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 6
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 7
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 8
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 9
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 10
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 11
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 12
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 13
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 14
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 15
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 16
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 17
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 18
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 19
		#20 SW1 = 1'b1;

		#20 SW2 = 1'b1; SW1 = 1'b0; //state 19
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 18
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 17
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 16
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 15
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 14
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 13
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 12
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 11
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 10
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 9
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 8
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 7
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 6
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 5
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 4
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 3
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 2
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 1 
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0; //state 0 
		#20 SW1 = 1'b1;
		#20 SW1 = 1'b0;
		#20 $finish;
	end
	always #10 clock =~ clock;
endmodule
