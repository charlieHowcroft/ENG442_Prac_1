module MUX_1_bit(input [1:0] in, input choose, output reg z_out);
    
    always @(*) begin
        z_out = in[choose];
    end

endmodule