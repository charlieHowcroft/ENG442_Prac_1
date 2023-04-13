module MUX_2_bit(input [3:0] in, input [1:0] choose, output z_out);
    
    assign z_out = in[choose];

endmodule


