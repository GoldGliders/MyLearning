module regfile32_32 (rdaddr1, rdaddr2, wraddr, wrdata, clock, reset, RegWrite, rddata1, rddata2);
    input [4:0] rdaddr1, rdaddr2, wraddr;
    input [31:0] wrdata;
    input clock, reset, RegWrite;
    output [31:0] rddata1, rddata2;
    reg [31:0] register[31:0];

    assign rddata1 = register[rdaddr1], rddata2 = register[rdaddr2];

    integer i;
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            for (i=0; i < 32; i=i+1)
                register[i] = 0;
        end else begin
            if (RegWrite)
                register[wraddr] <= wrdata;
        end
    end
endmodule