module ledctr (state, hex0, hex1);
    input [4:0] state;
    output [6:0] hex0, hex1;
    reg [6:0] hex0, hex1;

    always @(state) begin
        case (state)
        5'b00000: begin hex0 <= 7'b0000001; hex1 <= 7'b0000001; end
        5'b00001: begin hex0 <= 7'b1001111; hex1 <= 7'b0000001; end
        5'b00010: begin hex0 <= 7'b0010010; hex1 <= 7'b0000001; end
        5'b00011: begin hex0 <= 7'b0000110; hex1 <= 7'b0000001; end
        5'b00100: begin hex0 <= 7'b1001100; hex1 <= 7'b0000001; end
        5'b00101: begin hex0 <= 7'b0100100; hex1 <= 7'b0000001; end
        5'b00110: begin hex0 <= 7'b0100000; hex1 <= 7'b0000001; end
        5'b00111: begin hex0 <= 7'b0001101; hex1 <= 7'b0000001; end
        5'b01000: begin hex0 <= 7'b0000000; hex1 <= 7'b0000001; end
        5'b01001: begin hex0 <= 7'b0000100; hex1 <= 7'b0000001; end
        5'b01010: begin hex0 <= 7'b0000001; hex1 <= 7'b1001111; end
        5'b01011: begin hex0 <= 7'b1001111; hex1 <= 7'b1001111; end
        5'b01100: begin hex0 <= 7'b0010010; hex1 <= 7'b1001111; end
        5'b01101: begin hex0 <= 7'b0000110; hex1 <= 7'b1001111; end
        5'b01110: begin hex0 <= 7'b1001100; hex1 <= 7'b1001111; end
        5'b01111: begin hex0 <= 7'b0100100; hex1 <= 7'b1001111; end
        5'b10000: begin hex0 <= 7'b0100000; hex1 <= 7'b1001111; end
        5'b10001: begin hex0 <= 7'b0001101; hex1 <= 7'b1001111; end
        5'b10010: begin hex0 <= 7'b0000000; hex1 <= 7'b1001111; end
        5'b10011: begin hex0 <= 7'b0000100; hex1 <= 7'b1001111; end

        5'b10100: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b10101: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b10110: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b10111: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11000: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11001: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11010: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11011: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11100: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11101: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11110: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        5'b11111: begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end
        default:  begin hex0 <= 7'b1111111; hex1 <= 7'b1111111; end

        endcase
    end
endmodule