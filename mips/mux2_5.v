module mux2_5(a, b, sel, out);
	input [4:0] a,b;
	input sel;
	output [4:0] out;
	reg [4:0] out;
	
	always @(a or b or sel) begin
		if (sel == 1'b0) out <= a;
		else out <= b;
	end
endmodule
