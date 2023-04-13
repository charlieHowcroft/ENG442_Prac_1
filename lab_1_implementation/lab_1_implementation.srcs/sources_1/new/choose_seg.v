`timescale 1ns / 1ps


module choose_seg(
    input [1:0] segment,
    output [3:0] anode
    );
    
    reg [3:0] anode;
    
    always @(segment) begin
        case (segment)
            2'b00: anode = 4'b1110;
            2'b01: anode = 4'b1101;
            2'b10: anode = 4'b1011;
            2'b11: anode = 4'b0111;
            default: anode = 4'b1110;
        endcase      
    end
    
endmodule
