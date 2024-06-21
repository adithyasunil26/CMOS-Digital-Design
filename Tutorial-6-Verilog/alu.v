module alu(input [3:0]A,B,
input [2:0]op,
output reg [3:0]result);

always @*
begin
    case (op)
        3'b000: result = A + B;
        3'b001: result = A - B;
        3'b010: result = A & B;
        3'b011: result = A | B;
        3'b100: result = A ^ B; 
        default: result = 4'b0;
    endcase
end
endmodule