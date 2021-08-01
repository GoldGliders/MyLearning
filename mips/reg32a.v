module reg32a(in, clock, reset, out);
    input [31:0] in;
    input clock, reset;
    output [31:0] out;
    reg [31:0] out;

    always @(posedge clock or posedge reset) begin
        if (reset == 1'b1)
            out <= 32'h00000000;
        else
            out <= in;
    end
endmodule
