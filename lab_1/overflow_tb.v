`include "overflow.v"

module overflow_tb;

    wire overflow;
    reg a, b, result;

    overflow overflow_dut(.a(a), .b(b), .result(result), .overflow(overflow));

    initial begin

        a = 0; b = 0; result = 0;

        $display("a\tb\tresult\toverflow");
        $monitor("%b\t%b\t%b\t\t%b", a, b, result, overflow);
        #5 a = 0; b = 0; result = 0;
        #5 a = 0; b = 0; result = 1;
        #5 a = 0; b = 1; result = 0;
        #5 a = 0; b = 1; result = 1;
        #5 a = 1; b = 0; result = 0;
        #5 a = 1; b = 0; result = 1;
        #5 a = 1; b = 1; result = 0;
        #5 a = 1; b = 1; result = 1;
    end 
endmodule;