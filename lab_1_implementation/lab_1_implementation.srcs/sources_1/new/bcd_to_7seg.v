module bcd_to_7seg(input [3:0] bcd, output reg[6:0] segments);
    
    parameter zero = ~7'b0111111;
    parameter one = ~7'b0000110;
    parameter two = ~7'b1011011;
    parameter three = ~7'b1001111;
    parameter four = ~7'b1100110;
    parameter five = ~7'b1101101;
    parameter six = ~7'b1111101;
    parameter seven = ~7'b0000111;
    parameter eight = ~7'b1111111;
    parameter nine = ~7'b1100111;
    parameter negative = ~7'b1000000;
    parameter null = ~7'b0000000;

    always @(bcd) begin

        case(bcd)
            4'b0000: segments = zero;
            4'b0001: segments = one;
            4'b0010: segments = two;
            4'b0011: segments = three;
            4'b0100: segments = four;
            4'b0101: segments = five;
            4'b0110: segments = six;
            4'b0111: segments = seven;
            4'b1000: segments = eight;
            4'b1001: segments = nine;
            4'b1111: segments = negative;
            default: segments = null;
        endcase  
    end

    initial begin
        segments = zero;
    end

endmodule
