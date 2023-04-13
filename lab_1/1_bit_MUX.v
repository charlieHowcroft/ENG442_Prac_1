module MUX_1_bit(input [1:0] in, input choose, output z_out);
    
    assign z_out = in[choose];

endmodule

