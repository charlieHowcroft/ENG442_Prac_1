`include "ALU.v"
`include "1_bit_MUX.v"
`include "2_bit_MUX.v"
`include "adder.v"

module ALU_tb;

    wire result, c_out;
    wire a_out, b_out, sum_out;

    reg a, b, b_inv, c_in;
    reg [1:0] operation;

    ALU ALU_dut(
        .a(a), 
        .b(b), 
        .b_inv(b_inv), 
        .c_in(c_in), 
        .operation(operation), 
        .result(result), 
        .carry_out(c_out),
        .a_out(a_out),
        .b_out(b_out),
        .sum_out(sum_out));

    initial begin

        a = 0; b = 0; b_inv = 0; c_in = 0; operation = 2'b00;

        $display("a\tb\tb_inv\tc_in\toperation\tresult\tc_out");
        $monitor("%b\t%b\t%b\t\t%b\t\t%b%b\t\t\t%b\t\t%b", a, b, b_inv, c_in, operation[1], operation[0], result, c_out);
        
        #5 a = 0; b = 0; b_inv = 0; c_in = 1; operation = 2'b00;
        #5 a = 0; b = 1; b_inv = 0; c_in = 0; operation = 2'b00;
        #5 a = 0; b = 1; b_inv = 0; c_in = 1; operation = 2'b00;
        #5 a = 1; b = 0; b_inv = 0; c_in = 0; operation = 2'b00;
        #5 a = 1; b = 0; b_inv = 0; c_in = 1; operation = 2'b00;
        #5 a = 1; b = 1; b_inv = 0; c_in = 0; operation = 2'b00;
        #5 a = 1; b = 1; b_inv = 0; c_in = 1; operation = 2'b00;

        #5 a = 0; b = 0; b_inv = 1; c_in = 0; operation = 2'b00;
        #5 a = 0; b = 0; b_inv = 1; c_in = 1; operation = 2'b00;
        #5 a = 0; b = 1; b_inv = 1; c_in = 0; operation = 2'b00;
        #5 a = 0; b = 1; b_inv = 1; c_in = 1; operation = 2'b00;
        #5 a = 1; b = 0; b_inv = 1; c_in = 0; operation = 2'b00;
        #5 a = 1; b = 0; b_inv = 1; c_in = 1; operation = 2'b00;
        #5 a = 1; b = 1; b_inv = 1; c_in = 0; operation = 2'b00;
        #5 a = 1; b = 1; b_inv = 1; c_in = 1; operation = 2'b00;

        #5 a = 0; b = 0; b_inv = 0; c_in = 0; operation = 2'b00;

        #5 a = 1; b = 1; b_inv = 1; c_in = 1; operation = 2'b01;
        #5 a = 1; b = 1; b_inv = 1; c_in = 1; operation = 2'b10;
        #5 a = 1; b = 1; b_inv = 1; c_in = 1; operation = 2'b11;
    end 
endmodule;