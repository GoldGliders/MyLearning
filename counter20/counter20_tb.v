`timescale 1ns/1ns
module counter20_tb();
	reg start, ud, mclk, reset;
	wire [4:0] state;
	counter20 a0(.start(start), .ud(ud), .mclk(mclk), .reset(reset), .state(state));

	initial begin
		    reset = 1'b1; mclk = 1'b1;
		#5  reset =1'b0; ud = 1'b0; start = 1'b0; //state 0
		#20 start = 1'b1;
		#20 start = 1'b0; //state 1
		#20 start = 1'b1;
		#20 start = 1'b0; //state 2
		#20 start = 1'b1;
		#20 start = 1'b0; //state 3
		#20 start = 1'b1;
		#20 start = 1'b0; //state 4
		#20 start = 1'b1;
		#20 start = 1'b0; //state 5
		#20 start = 1'b1;
		#20 start = 1'b0; //state 6
		#20 start = 1'b1;
		#20 start = 1'b0; //state 7
		#20 start = 1'b1;
		#20 start = 1'b0; //state 8
		#20 start = 1'b1;
		#20 start = 1'b0; //state 9
		#20 start = 1'b1;
		#20 start = 1'b0; //state 10
		#20 start = 1'b1;
		#20 start = 1'b0; //state 11
		#20 start = 1'b1;
		#20 start = 1'b0; //state 12
		#20 start = 1'b1;
		#20 start = 1'b0; //state 13
		#20 start = 1'b1;
		#20 start = 1'b0; //state 14
		#20 start = 1'b1;
		#20 start = 1'b0; //state 15
		#20 start = 1'b1;
		#20 start = 1'b0; //state 16
		#20 start = 1'b1;
		#20 start = 1'b0; //state 17
		#20 start = 1'b1;
		#20 start = 1'b0; //state 18
		#20 start = 1'b1;
		#20 start = 1'b0; //state 19
		#20 start = 1'b1;

		#20 ud = 1'b1; start = 1'b0; //state 19
		#20 start = 1'b1;
		#20 start = 1'b0; //state 18
		#20 start = 1'b1;
		#20 start = 1'b0; //state 17
		#20 start = 1'b1;
		#20 start = 1'b0; //state 16
		#20 start = 1'b1;
		#20 start = 1'b0; //state 15
		#20 start = 1'b1;
		#20 start = 1'b0; //state 14
		#20 start = 1'b1;
		#20 start = 1'b0; //state 13
		#20 start = 1'b1;
		#20 start = 1'b0; //state 12
		#20 start = 1'b1;
		#20 start = 1'b0; //state 11
		#20 start = 1'b1;
		#20 start = 1'b0; //state 10
		#20 start = 1'b1;
		#20 start = 1'b0; //state 9
		#20 start = 1'b1;
		#20 start = 1'b0; //state 8
		#20 start = 1'b1;
		#20 start = 1'b0; //state 7
		#20 start = 1'b1;
		#20 start = 1'b0; //state 6
		#20 start = 1'b1;
		#20 start = 1'b0; //state 5
		#20 start = 1'b1;
		#20 start = 1'b0; //state 4
		#20 start = 1'b1;
		#20 start = 1'b0; //state 3
		#20 start = 1'b1;
		#20 start = 1'b0; //state 2
		#20 start = 1'b1;
		#20 start = 1'b0; //state 1 
		#20 start = 1'b1;
		#20 start = 1'b0; //state 0 
		#20 start = 1'b1;
		#20 start = 1'b0;
		#20 $finish;
	end
	always #10 mclk =~ mclk;
endmodule
