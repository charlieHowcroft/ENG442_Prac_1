`include "adder_basic.v"
`include "overflow.v"

module adder_basic_tb;

    wire [7:0] out;
    wire overflow;

    reg [7:0] a;
    reg [7:0] b;
    reg subtract;

    adder_basic adder_basic_dut(
        .a(a), 
        .b(b),
        .subtract(subtract),
        .out(out),
        .overflow(overflow)
        );

    initial begin

        a = 8'b00000000; b = 8'b00000000;

        $display("a\t\t\tb\t\t\tsubtract\tresult\tOverflow");
        $monitor("%b\t%b\t%b\t\t%b\t%b", a, b, subtract, out, overflow);
        
        #5 a = 8'b00010111; b = 8'b00111100; subtract = 0;
        #5 a = 8'b01100100; b = 8'b00011011; subtract = 0;
        #5 a = 8'b01100100; b = 8'b00011100; subtract = 0;

        #5 a = 8'b00010111; b = 8'b11000100; subtract = 0;
        #5 a = 8'b00000000; b = 8'b10000000; subtract = 0;
        #5 a = 8'b11110110; b = 8'b10000000; subtract = 0;

        #5 a = 8'b00000000; b = 8'b00000000; subtract = 1;
        #5 a = 8'b00010111; b = 8'b00111100; subtract = 1;
        #5 a = 8'b00000000; b = 8'b01111111; subtract = 1;

        #5 a = 8'b00010111; b = 8'b11111010; subtract = 1;
        #5 a = 8'b00001010; b = 8'b01111111; subtract = 1;
        #5 a = 8'b01100100; b = 8'b11100101; subtract = 1;
        #5 a = 8'b01100100; b = 8'b11100100; subtract = 1;
        
    end 
endmodule;