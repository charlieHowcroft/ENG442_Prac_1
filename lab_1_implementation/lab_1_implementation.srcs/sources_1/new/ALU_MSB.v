// `include "overflow.v"
// `include "ALU.v"

module ALU_MSB(
    input a, 
    input b, 
    input b_inv, 
    input c_in, 
    input [1:0] operation, 
    output result, 
    output c_out,
    output overflow
    );

    wire a_out, sum_out;

    ALU ALU_raw(
        .a(a), 
        .b(b), 
        .b_inv(b_inv), 
        .c_in(c_in), 
        .operation(operation), 
        .result(result), 
        .carry_out(c_out),
        .a_out(a_out),
        .b_out(b_out),
        .sum_out(sum_out)
        );

    overflow ovr_flo(.a(a_out), .b(b_out), .result(sum_out), .overflow(overflow));

endmodule