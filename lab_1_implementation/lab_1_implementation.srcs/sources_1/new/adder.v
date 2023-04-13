module adder(output s, output c0, input a, input b, input c);

    assign s = ~a & ~b & c | ~a & b & ~c | a & ~b & ~c | a & b & c;
    assign c0 = ~a & b & c | a & ~b & c | a & b & ~c | a & b & c;

endmodule