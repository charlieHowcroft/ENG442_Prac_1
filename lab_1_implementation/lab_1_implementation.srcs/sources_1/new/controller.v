`timescale 1ns / 1ps

module controller(
    input [15:0] sw,
    input clk,
    input btnC,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    reg [3:0] bcd_1;
    reg [3:0] bcd_2;
    reg [3:0] bcd_3;
    reg [3:0] bcd_4;  
    reg [3:0] bcd_input;
    
    wire [6:0] segment_out;
    reg [6:0] seg;
    
    wire [3:0] anode_out;
    reg [3:0] an;
    
    wire [7:0] ans;
    wire overflow;
    wire zero;
    
    reg subtract;
    
    
    bcd_to_7seg bcd_seg(.bcd(bcd_input), .segments(segment_out));
    choose_seg choose_display(.segment(display_select), .anode(anode_out));
    initial begin
        bcd_1 = 4'b0011;
        bcd_2 = 4'b0100;
        bcd_3 = 4'b0101;
        bcd_4 = 4'b0110;
        bcd_input = bcd_1;
        b_inv = 0;
    end
    
    reg [7:0] temp;
    integer number;
    integer remainder;
    always @(*) begin
    
        if (led[15]) begin
            bcd_4 = 4'b1110;
            bcd_3 = 4'b1110;
            bcd_2 = 4'b1110;
            bcd_1 = 4'b1110;
              
        end else begin
            if (ans[7]) begin
                bcd_4 = 4'b1111; //show negative
                temp = ~ans + 1; //2's compliment
                number = temp[7:0]; 
            end
            else begin
                bcd_4 = 4'b1110; //show nothing
                number = ans[7:0];
            end
            
            // Extract the most significant digit by dividing the binary number by 100
            bcd_3 = number / 100;
            remainder = number % 100;
            // Extract the least significant digit by taking the remainder after dividing by 100
            bcd_2 = remainder / 10;
            remainder = remainder % 10;
            bcd_1 = remainder;
        end
    end 
    
    // the first 18-bit for creating 2.6ms digit period
    // the other 2-bit for creating 4 LED-activating signals
    reg [19:0] refresh_counter; 
    wire [1:0] display_select;
    always @(posedge clk) begin 
        refresh_counter <= refresh_counter + 1;
    end
    assign display_select = refresh_counter[19:18];
    
    always @(*) begin
        case(display_select)
            2'b00: bcd_input = bcd_1;
            2'b01: bcd_input = bcd_2;
            2'b10: bcd_input = bcd_3;
            2'b11: bcd_input = bcd_4;
            default: bcd_input = bcd_4;
        endcase
        an = anode_out; 
        seg = segment_out;
    end
    
    adder_8_bit add(.a(sw[15:8]), .b(sw[7:0]), .b_inv(led[3]), .operation(2'b00), .result(ans), .overflow(led[15]), .zero(led[0])); // alu implementation
//    adder_basic adder_basic(.a(sw[15:8]), .b(sw[7:0]), .subtract(led[3]), .out(ans), .overflow(led[15]), .zero(led[0])); // subtask 5
    
    reg button_old;
    reg b_inv;
    assign led[3] = b_inv;
    always @(posedge clk) begin
        // detect rising edge
        if (button_old != btnC && btnC == 1'b1) b_inv = ~b_inv;
        button_old = btnC;
    end
endmodule

