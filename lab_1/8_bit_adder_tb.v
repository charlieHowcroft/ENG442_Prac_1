`include "8_bit_adder.v"

module adder_8_bit_tb;

    wire [7:0] result;
    wire overflow, zero;

    reg [7:0] a;
    reg [7:0] b;
    reg b_inv, c_in;
    reg [1:0] operation;

    adder_8_bit adder_8_bit_dut(
        .a(a), 
        .b(b),
        .b_inv(b_inv),
        .operation(operation),
        .result(result), 
        .overflow(overflow),
        .zero(zero)
        );

    integer a_int, b_int, ans_int;
    initial begin

        a = 8'b00000000; b = 8'b00000000; b_inv = 0; operation = 2'b00;

        $display("a\t\t\tb\t\t\tb_inv\toperation\toverflow\tresult");
        $monitor("%b\t%b\t%b\t\t%b%b\t\t\t%b\t\t\t%b", a, b, b_inv, operation[1], operation[0], overflow, result);
        
        #5 a = 8'b00010111; b = 8'b00111100; b_inv = 0; operation = 2'b00; 
        #5 a = 8'b01100100; b = 8'b00011011; b_inv = 0; operation = 2'b00; 
        #5 a = 8'b01100100; b = 8'b00011100; b_inv = 0; operation = 2'b00; 

        #5 a = 8'b00010111; b = 8'b11000100; b_inv = 0; operation = 2'b00;
        #5 a = 8'b00000000; b = 8'b10000000; b_inv = 0; operation = 2'b00;
        #5 a = 8'b11110110; b = 8'b10000000; b_inv = 0; operation = 2'b00;

        #5 a = 8'b00000000; b = 8'b00000000; b_inv = 1; operation = 2'b00;
        #5 a = 8'b00010111; b = 8'b00111100; b_inv = 1; operation = 2'b00;
        #5 a = 8'b00000000; b = 8'b01111111; b_inv = 1; operation = 2'b00;

        #5 a = 8'b00001010; b = 8'b01111111; b_inv = 1; operation = 2'b00;
        #5 a = 8'b00010111; b = 8'b11111010; b_inv = 1; operation = 2'b00; 
        #5 a = 8'b01100100; b = 8'b11100101; b_inv = 1; operation = 2'b00; 
        #5 a = 8'b01100100; b = 8'b11100100; b_inv = 1; operation = 2'b00; 
        
    end 
endmodule;