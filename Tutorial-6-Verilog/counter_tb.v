module counter(
    input wire clk,
    input wire reset,
    output reg [3:0] cout
);

always @(posedge clk or posedge reset)begin
    if (reset) begin
        cout <= 4'b0000;
    end else begin
        cout <= cout + 1;
    end
end

endmodule