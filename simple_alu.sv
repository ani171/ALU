module ALU(
input [3:0] A,
input [3:0] B,
input [2:0] op,
output [3:0] out
);

always @(A,B,op) 
begin
case (op)
3'b000: out = A + B; 
3'b001: out = A - B; 
3'b010: out = A & B; 
3'b011: out = A | B;
3'b100: out = A ^ B;
default: out=4'b0;
endcase
end 
endmodule
