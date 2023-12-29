module ALU #(parameter WIDTH = 8) (
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  input [2:0] op,
  output reg [WIDTH-1:0] out
);

always @(A, B, op) begin
  case (op)
    3'b000: out = A + B;
    3'b001: out = A - B;
    3'b010: out = A & B;
    3'b011: out = A | B;
    3'b100: out = A ^ B;
  endcase
end

endmodule
