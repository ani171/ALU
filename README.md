# ALU

## Simple ALU
* Designing a simple Arithmetic Logic Unit (ALU) in SystemVerilog involves defining the operations it can perform and implementing the corresponding logic. Below is a basic example of a 4-bit ALU that supports addition, subtraction, AND, OR, and XOR operations.

[Code](https://github.com/ani171/ALU/blob/8af278bb2c22c1cbb9fc323ab20bb2245ada7315/simple_ALU.sv)
![image](https://github.com/ani171/ALU/assets/97838595/bd1f19c2-e79b-4491-b562-8962097d9f47)

## ALU with overflow detection

[Code](https://github.com/ani171/ALU/blob/6bc3843512f82deb073967c118d12e55056ac82e/overflow_ALU.sv)

`overflow=(A[3] & B[3] & ~Result[3]) | (~A[3] & ~B[3] & Result[3])`
* Overflow occurs when both operands have the same sign, and the sign of the result is different.
  * If A[3] and B[3] are both 1 (negative operands), and Result[3] is 0 (positive result), then overflow has occurred.
  * If A[3] and B[3] are both 0 (positive operands), and Result[3] is 1 (negative result), then overflow has occurred.
* Overflow does not occur when the signs of the operands are different.
  * If A[3] is 1 (negative) and B[3] is 0 (positive), or vice versa, overflow cannot occur.

 `overflow = (A[3] & ~B[3] & ~Result[3]) | (~A[3] & B[3] & Result[3])`
* Overflow occurs when the two operands have different signs, and the sign of the result is the same as the sign of the second operand.
 * If A[3] is 1 (negative) and B[3] is 0 (positive), and Result[3] is 1 (negative result), then overflow has occurred.
 * If A[3] is 0 (positive) and B[3] is 1 (negative), and Result[3] is 0 (positive result), then overflow has occurred.
* Overflow does not occur when both operands have the same sign.
* If A[3] and B[3] are both 1 (negative) or both 0 (positive), overflow cannot occur.

![image](https://github.com/ani171/ALU/assets/97838595/a8431c4b-d3fa-4844-9ba6-841272efee53)

