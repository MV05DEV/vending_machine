module vending (
    input clk,
    input reset,
    input [1:0] coin, // 01 = 5rs and 10 = 10rs
    output reg out,
    output reg[1:0] change
);
parameter s0 = 2'b00; 
parameter s1 = 2'b01; // 5rs 
parameter s2 = 2'b10; // 10rs 
    reg[1:0] state, next_state;
    always @(posedge clk or reset == 1) begin
        if (reset) begin
            state = s0;
            out = 0;
            change = 2'b00;
        end else begin
            state = next_state;
        end
        case (state)        
            s0:
            if(coin==2'b00) begin
                next_state = s0; 
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b01) begin
                next_state = s1; 
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b10) begin
                next_state = s2; 
                out = 0;
                change = 2'b00;
            end
            s1:
            if(coin ==2'b00) begin
                next_state=s1;
                out=0;
                change=2'b00;
            end
            else if(coin == 2'b01) begin
                next_state = s2; 
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b10) begin
                next_state = s0; 
                out = 1; 
                change = 2'b00; 
            end
            s2:
            if(coin == 2'b00) begin
                next_state = s2; 
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b01) begin
                next_state = s0; 
                out = 1; 
                change = 2'b00; 
            end else if(coin == 2'b10) begin
                next_state = s1; 
                out = 1; 
                change = 2'b01; 
            end
        endcase
    end    
endmodule