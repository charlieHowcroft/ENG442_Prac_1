module MUX_2_bit(input [3:0] in, input [1:0] choose, output reg z_out);
    
    always @(*) begin
        z_out = in[choose];
    end

endmodule