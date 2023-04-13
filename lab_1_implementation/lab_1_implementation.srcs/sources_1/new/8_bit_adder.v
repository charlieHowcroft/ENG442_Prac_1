//`include "ALU_MSB.v"
//`include "ALU.v"
//`include "1_bit_MUX.v"
//`include "2_bit_MUX.v"
//`include "adder.v"
//`include "overflow.v"

module adder_8_bit(
    input [7:0] a, 
    input [7:0] b,
    input b_inv,
    input [1:0] operation,
    output [7:0] result, 
    output overflow,
    output zero
    );

    wire [7:0] c_in;
    wire [7:0] c_out;

    // unused
    wire [6:0] a_out;
    wire [6:0] b_out;
    wire [6:0] sum_out;

    // 7 1 bit ALUs
    ALU ALU1[6:0](
        .a(a[6:0]), 
        .b(b[6:0]),
        .b_inv(b_inv), 
        .c_in(c_in[6:0]), 
        .operation(operation), 
        .result(result[6:0]),
        .carry_out(c_out[6:0]),
        .a_out(a_out[6:0]),
        .b_out(b_out[6:0]),
        .sum_out(sum_out[6:0])
        );

    // MSB ALU
    ALU_MSB MSB(
        .a(a[7]), 
        .b(b[7]), 
        .b_inv(b_inv), 
        .c_in(c_in[7]), 
        .operation(operation), 
        .result(result[7]), 
        .c_out(c_out[7]),
        .overflow(overflow)
        );

    assign c_in[0] = b_inv;
    assign c_in[7:1] = c_out[6:0];

    assign zero = result == 0;

endmodule