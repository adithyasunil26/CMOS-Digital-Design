`timescale 1ns/1ps

module decoder_1x2_tb;

// Inputs
reg sel;

//Output
wire y0;
wire y1;

//Instantiate the Unit Under Test(uut)

decoder_1x2 uut(
    .sel(sel),
    .y0(y0),
    .y1(y1)
);

initial begin
    //Initialize inputs
    sel = 0;

    $dumpfile("decoder_1x2_tb.vcd");
    $dumpvars(0, decoder_1x2_tb);

    //Applying test vectors
    #10 sel = 0;
    #10 sel = 1;
    #10 $finish; //End simulation
end

initial begin
    //Monitor the  inputs and outputs
    $monitor("time = %t \t sel = %d \t y0 = %d y1 = %d",$time, sel,y0,y1);
end
endmodule
