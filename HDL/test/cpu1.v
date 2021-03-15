module CPU1(
    input logic CLK,
    input logic RST,
    input logic data,
    output logic led,
    output logic addr
);

logic a, next_a;
logic ip, next_ip;

always_ff @(posedge CLK)begin
    if (RST)begin
        a <= 1'b0;
        ip <= 1'b0;
    end else begin
        a <= next_a;
        ip <= next_ip;
    end
end

assign led = a;
assign addr = ip;

always_comb begin
    case(data)
        1'b0: next_a = a;
        1'b1: next_a = ~a;
    endcase
    next_ip = ip + 1'b1;
end

endmodule
