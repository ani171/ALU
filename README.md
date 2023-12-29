# ALU

## Simple ALU
* Designing a simple Arithmetic Logic Unit (ALU) in SystemVerilog involves defining the operations it can perform and implementing the corresponding logic. Below is a basic example of a 4-bit ALU that supports addition, subtraction, AND, OR, and XOR operations.

[Code](https://github.com/ani171/ALU/blob/0b8ac3330d8789bbc9474fdd2d4d74b7245a34b2/simple_alu.sv)

![image](https://github.com/ani171/ALU/assets/97838595/ee2410d5-e820-4ce0-9bcf-a0401eae3219)


## ALU with overflow detection

[Code](https://github.com/ani171/ALU_implementations/blob/c9ae3c3b3c4e5c4b4d8c5dda62f43b21b23025b8/overflow_ALU.sv)

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

![image](https://github.com/ani171/ALU/assets/97838595/8ac6945c-9e63-44fb-a104-904f921f7118)

## ALU with parallelism

* Parallelism is a concept in computing where multiple tasks or operations are performed simultaneously, either concurrently or in parallel, to improve overall system performance and efficiency.
#### Need for parallelism
 1. Increased Performance:
   * Simultaneous Processing: Parallelism allows multiple tasks to be executed at the same time, leading to faster completion of operations.
   * Task Parallelism: Dividing a complex task into subtasks that can be processed concurrently improves overall performance.
 2. Resource Utilization:
   * Efficient Use of Resources: Parallelism helps in utilizing available resources effectively by distributing workloads across multiple processors or cores.
   * Optimized Throughput: With parallel processing, a system can handle more tasks in a given time, optimizing throughput.
 3. Energy Efficiency:
   * Distributed Workloads: Distributing tasks across multiple processors allows for better energy efficiency, as each processor can operate at lower power levels.

[Code](https://github.com/ani171/ALU/blob/3fb3d837b741b004d3600b9333b6eb7a84ef610a/parallel_alu.sv)

![image](https://github.com/ani171/ALU/assets/97838595/87af62a3-907f-454b-9a7d-f4ea070a51ad)
