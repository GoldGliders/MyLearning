module mux2_32(a, b, sel, out);
	input [31:0] a,b;
	input sel;
	output [31:0] out;
	reg [31:0] out;
	
	always @(a or b or sel) begin
		if (sel == 1'b0) out <= a;
		else out <= b;
	end
endmodule
