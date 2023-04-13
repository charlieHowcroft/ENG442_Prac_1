`timescale 1ns / 1ps

module adder_basic(input [7:0] a, input [7:0] b, input subtract, output reg [7:0] out, output overflow, output zero);

    reg [7:0] b_out;
    always @(*) begin
        if (subtract) begin
            b_out = ~b + 1;
        end else begin 
            b_out = b;
        end
        out = a + b_out;
    end
    overflow ovr_flo(.a(a[7]), .b(b_out[7]), .result(out[7]), .overflow(overflow));
    assign zero = out == 0;
endmodule
