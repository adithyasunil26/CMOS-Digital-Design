`timescale 1ns / 1ps

module d_ff_tb;

//Inputs
reg d;
reg clk;
reg reset;

//Outputs
wire q;

//Initiate the UUT
d_ff uut(
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q)
);

//Clock Generation
initial begin
    clk =0;
    forever #5 clk = ~clk;
end

initial begin
    //Initialize inputs
    d = 0;
    reset =0;
    $dumpfile("d_ff_tb.vcd");
    $dumpvars(0,d_ff_tb);

    //Apply vectors
    #10 reset = 1;//applying reset
    #10 reset = 0;//releasing reset
    #10 reset = 1;//applying reset
    #10 reset = 0;//releasing reset
    #10 reset = 1;//applying reset
    #10 $finish;
end

initial begin
    //Monitors i/o
    $monitor("time = %t \t d = %d \t clk = %d \t reset = %d \t q = %d", $time, d, clk, reset,q);
end
endmodule