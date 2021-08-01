module dmem (addr, rddata, wrdata, MemRead, MemWrite, clock);
    input [31:0] addr, wrdata;
    input MemRead, MemWrite, clock;
    output reg [31:0] rddata;
    reg [31:0] mcell [1023:0];

    always @(MemRead or addr) begin
        if (MemRead)
            rddata = mcell[addr];
    end

    always @(posedge clock) begin
        if (MemWrite)
            mcell[addr] = wrdata;
    end
endmodule
