module ALU (
  input wire [3:0] A,
  input wire [3:0] B,
  input wire [2:0] op,
  input wire clk,
  input wire rst_n,
  output reg [3:0] out
);

  reg [3:0] result_add, result_sub, result_and, result_or, result_xor;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      result_add <= 4'b0;
      result_sub <= 4'b0;
      result_and <= 4'b0;
      result_or  <= 4'b0;
      result_xor <= 4'b0;
    end else begin
      result_add <= (op == 3'b000) ? A + B : 4'b0;
      result_sub <= (op == 3'b001) ? A - B : 4'b0;
      result_and <= (op == 3'b010) ? A & B : 4'b0;
      result_or  <= (op == 3'b011) ? A | B : 4'b0;
      result_xor <= (op == 3'b100) ? A ^ B : 4'b0;
    end
  end

  always @* begin
    case (op)
      3'b000: out = result_add;
      3'b001: out = result_sub;
      3'b010: out = result_and;
      3'b011: out = result_or;
      3'b100: out = result_xor;
      default: out = 4'b0;
    endcase
  end

endmodule
