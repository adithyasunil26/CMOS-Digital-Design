`timescale 1ns / 1ps // Define timescale for simulation accuracy

module alu_tb;

   // Declare signals for ALU inputs and outputs
   reg [3:0] operand1, operand2;
   reg [2:0] opcode;
   wire [3:0] result;
   

   // Instantiate ALU module
   alu uut (
       .A(operand1),
       .B(operand2),
       .op(opcode),
       .result(result)
       
   );

   // Stimulus generation
   initial begin

       $dumpfile("alu_tb.vcd"); // Specify the dump file name
       $dumpvars(0, alu_tb); // Dump all variables in the testbench
       // Test case 1: Addition
       operand1 = 4'b0010; // 2 in decimal
       operand2 = 4'b0011; // 3 in decimal
       opcode = 3'b000; // Addition
       #10; // Wait for 10 time units
       // Expected result: 5 (4'b0101)
       $display("Result of %b + %b = %b", operand1, operand2, result);
       
       // Test case 2: Bitwise AND
       operand1 = 4'b1010; // 10 in decimal
       operand2 = 4'b1100; // 12 in decimal
       opcode = 3'b010; // Bitwise AND
       #10; // Wait for 10 time units
       // Expected result: 8 (4'b1000)
       $display("Result of %b & %b = %b", operand1, operand2, result);
       
       // Add more test cases for other operations as needed

       // End simulation after all test cases
       $finish;
   end

endmodule