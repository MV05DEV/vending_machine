module vending_tb;

    reg clk;
    reg reset;
    reg [1:0] coin;
    wire out;
    wire [1:0] change;

    // Instantiate the vending machine module
    vending uut (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .out(out),
        .change(change)
    );

    // Clock generation
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        #200 $finish; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        $dumpfile("vending_tb.vcd");
        $dumpvars(0, vending_tb);
        $monitor($time, " reset=%b coin=%b out=%b change=%b", reset, coin, out, change);
        // Initialize inputs
        reset = 1;
        coin = 2'b00;
        #10 reset = 0;
        #20 coin = 2'b01; 
        #20 coin = 2'b00; 
        #20 coin = 2'b01; 
        #20 coin = 2'b10; 
        #20 coin = 2'b10; 
        
        $finish;
    end
endmodule    