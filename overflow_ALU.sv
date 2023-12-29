module ALU(
input [3:0] A,
input [3:0] B,
input [2:0] op,
output [3:0] out,
output overflow
);

always @(A,B,op) 
begin
case (op)
3'b000: begin
out = A + B; 
overflow=((A[3] & B[3] & ~out[3])|(~A[3] & ~B[3] & out[3]));
end
3'b001: begin
out = A - B; 
overflow=((A[3] & ~B[3] & ~out[3])|(~A[3] & B[3] & out[3]));
end
3'b010:begin
out = A & B; 
overflow=1'b0;
end
3'b011: begin
out = A | B;
overflow=1'b0;
end
3'b100: begin
out = A ^ B;
overflow=1'b0;
end
default: begin
out=4'b0;
overflow=1'b0;
end
endcase
end 
endmodule
