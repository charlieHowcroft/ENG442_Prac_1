`include "adder.v"

module adder_tb;

    wire s, c0;

    reg a, b, c;

    adder adder_dut(s, c0, a, b, c);

    initial begin

        a = 0; b = 0; c = 0;

        $display("a\tb\tc\t\ts\tc0");
        $monitor("%b\t%b\t%b\t\t%b\t%b", a, b, c, s, c0);
        
        #5 a = 0; b = 0; c = 0;
        #5 a = 0; b = 0; c = 1;
        #5 a = 0; b = 1; c = 0;
        #5 a = 0; b = 1; c = 1;
        #5 a = 1; b = 0; c = 0;
        #5 a = 1; b = 0; c = 1;
        #5 a = 1; b = 1; c = 0;
        #5 a = 1; b = 1; c = 1;
    end 
endmodule;