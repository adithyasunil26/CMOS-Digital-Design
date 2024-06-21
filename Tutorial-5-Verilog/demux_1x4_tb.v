`timescale 1ns /1ps

module demux_1x4_tb;

    //Inputs
    reg y;
    reg S_0;
    reg S_1;

    //Outputs 
    wire a;
    wire b;
    wire c;
    wire d;


//Instantiate the UUT

demux_1x4 uut(
    .y(y),
    .S_0(S_0),
    .S_1(S_1),
    .a(a),
    .b(b),
    .c(c),
    .d(d)
);

initial begin
    $dumpfile("demux_1x4_tb.vcd");
    $dumpvars(0, demux_1x4_tb);

    y=0;
    S_0=0;
    S_1=0;
    #10 y=1;
    #10 S_0=1;
    #10 S_1=1;S_0=0;
    #10 S_0=1;
    #10 y = 0; S_0=0;S_1=0;
    #100 $finish;
end

initial begin
    $monitor("time = %t \t y = %d \t S_0=%d \t S_1 = %d \t a =%d \t b= %d \t c=%d \t d= %d \t",$time, y, S_0, S_1, a, b, c, d);
end
endmodule
