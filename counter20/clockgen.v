module clockgen (clock, reset, mclk);
    input clock;
    input reset;
    output reg mclk;
    reg cmp;
    reg[25:0] count, cout;

    always @(cout)
        if (cout == 49999999)
            count = 0;
        else
            count = cout + 1;

    always @(posedge clock or posedge reset) begin
        if (reset == 1)
            cout = 0;
        else
            cout = count;
    end

    always @(count)
        cmp = count > 24999999;
    
    always @(posedge clock or posedge reset) begin
        if (reset == 1)
            mclk = 0;
        else
            mclk = cmp;
    end

endmodule