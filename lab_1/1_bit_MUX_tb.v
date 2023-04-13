`include "1_bit_MUX.v"

module MUX_tb;

    wire z_out;

    reg [1:0] in;
    reg choose;

    MUX_1_bit mux_dut(.in(in), .choose(choose), .z_out(z_out));

    initial begin

        in = 2'b00; choose = 0;

        $display("a\tb\tchoose\tz_out");
        $monitor("%b\t%b\t%b\t\t%b", in[0], in[1], choose, z_out);
        
        #5 in = 2'b00; choose = 0; 
        #5 in = 2'b01; choose = 0; 
        #5 in = 2'b10; choose = 0; 
        #5 in = 2'b11; choose = 0; 
        #5 in = 2'b00; choose = 1; 
        #5 in = 2'b01; choose = 1; 
        #5 in = 2'b10; choose = 1; 
        #5 in = 2'b11; choose = 1; 
    end 
endmodule;