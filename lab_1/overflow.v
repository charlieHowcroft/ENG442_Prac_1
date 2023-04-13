module overflow(input a, input b, input result, output overflow);
    
    assign overflow = ~a & ~b & result | a & b & ~result;
    
endmodule

