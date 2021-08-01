module aluctr(ALUOp, func, ALUctr);
    input [5:0] func;
    input [1:0] ALUOp;
    output reg [2:0] ALUctr;

    always @(ALUOp or func) begin
        case (ALUOp)
            2'b00: ALUctr <= 3'b010;
            2'b01: ALUctr <= 3'b110;
            2'b10: begin
                case (func[3:0])
                    4'b0000: ALUctr <= 3'b010; //
                    4'b0001: ALUctr <= 3'b000;
                    4'b0010: ALUctr <= 3'b110; //
                    4'b0011: ALUctr <= 3'b000;
                    4'b0100: ALUctr <= 3'b000;
                    4'b0101: ALUctr <= 3'b001; //
                    4'b0110: ALUctr <= 3'b000;
                    4'b0111: ALUctr <= 3'b000;
                    4'b1000: ALUctr <= 3'b000;
                    4'b1001: ALUctr <= 3'b000;
                    4'b1010: ALUctr <= 3'b111; //
                    4'b1011: ALUctr <= 3'b000;
                    4'b1100: ALUctr <= 3'b000;
                    4'b1101: ALUctr <= 3'b000;
                    4'b1110: ALUctr <= 3'b000;
                    4'b1111: ALUctr <= 3'b000;
                    default:  ALUctr <= 3'b000;
                endcase
            end
            2'b11: ALUctr <= 3'b000;
            default: ALUctr <= 3'b000;
        endcase
    end
endmodule
