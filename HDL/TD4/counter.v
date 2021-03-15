module COUNTER(
    input logic clk, n_reset,
    output logic [3:0] count
);

    always @(posedge clk or negedge n_reset)begin
        if (~n_reset)begin
            count <= 4'h0;
        end else begin
            count <= count + 4'h1;
        end
    end
endmodule
