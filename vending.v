module vending (
    input clk,
    input reset,
    input [1:0] coin, // 01 = 5rs and 10 = 10rs
    output reg out,
    output reg[1:0] change
);
parameter s0 = 2'b00; // Initial state
parameter s1 = 2'b01; // 5rs inserted
parameter s2 = 2'b10; // 10rs inserted
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
                next_state = s0; // No coin inserted, stay in state s0
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b01) begin
                next_state = s1; // 5rs inserted, move to state s1
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b10) begin
                next_state = s2; // 10rs inserted, move to state s2
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
                next_state = s2; // Another 5rs inserted, move to state s2
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b10) begin
                next_state = s0; // 10rs inserted, return change and go to state s0
                out = 1; // Item dispensed
                change = 2'b00; // Change of 5rs returned
            end
            s2:
            if(coin == 2'b00) begin
                next_state = s2; // No coin inserted, stay in state s2
                out = 0;
                change = 2'b00;
            end else if(coin == 2'b01) begin
                next_state = s0; // 5rs inserted, return change and go to state s0
                out = 1; // Item dispensed
                change = 2'b00; // Change of 5rs returned
            end else if(coin == 2'b10) begin
                next_state = s1; // Another 10rs inserted, return change and go to state s0
                out = 1; // Item dispensed
                change = 2'b01; // No change returned
            end
        endcase
    end    
endmodule