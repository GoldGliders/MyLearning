module counter20 (start, ud, mclk, reset, state);
  input start, ud, mclk, reset;
  output [4:0] state;
  reg [4:0] state, next_state;

  always @(posedge mclk) begin
         if(reset)
           state <= 5'b00000;
         else
           state <= next_state;
  end

  always @(start or ud or mclk) begin
         if (start)
           if (ud)
             if (state == 5'b00000)
                    next_state <= 5'b10011;
              else
                    next_state <= state - 5'b00001;
           else
             if (state == 5'b10011)
                    next_state <= 5'b00000;
             else
                    next_state <= state + 5'b00001;
         else
			  next_state <= state;
	end
 endmodule
						
