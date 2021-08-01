module alu(A, B, ALUctr, Result, Zero);
    input [31:0] A, B;
    input [2:0] ALUctr;
    output reg [31:0] Result;
    output reg Zero;

    always @(A or B or ALUctr) begin
        case (ALUctr)
            3'b000: Result = A & B;
            3'b001: Result = A | B;
            3'b010: Result = A + B;
            3'b011: Result = 0;
            3'b100: Result = 0;
            3'b101: Result = 0;
            3'b110: Result = A - B;
            3'b111: begin
                if (A < B)
                    Result = 1;
                else
                    Result = 0;
            end
            default: Result = 0;
        endcase

        if (Result == 0)
            Zero = 1;
        else
            Zero = 0;
    end
endmodule
