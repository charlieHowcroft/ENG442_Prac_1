`include "2_bit_MUX.v"

module MUX_tb;

    wire z_out;

    reg [3:0] in;
    reg [1:0] choose;

    MUX_2_bit mux_dut(.in(in), .choose(choose), .z_out(z_out));

    initial begin

        in = 4'b0000; choose = 2'b00;

        $display("a\tb\tc\td\tchoose\tz_out");
        $monitor("%b\t%b\t%b\t%b\t%b%b\t\t%b", in[3], in[2], in[1], in[0], choose[1], choose[0], z_out);
        
        #5 in = 4'b0001; choose = 2'b00; 
        #5 in = 4'b1110; choose = 2'b00; 
        #5 in = 4'b0010; choose = 2'b01; 
        #5 in = 4'b1101; choose = 2'b01; 
        #5 in = 4'b0100; choose = 2'b10; 
        #5 in = 4'b1011; choose = 2'b10; 
        #5 in = 4'b1000; choose = 2'b11; 
        #5 in = 4'b0111; choose = 2'b11; 
    end 
endmodule;