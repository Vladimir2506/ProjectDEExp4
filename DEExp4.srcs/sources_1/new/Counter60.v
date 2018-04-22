`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 20:38:51
// Design Name: 
// Module Name: Counter24
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter60
(
    input wire wClock,
    input wire wUp,
    input wire wReset,
    output reg[3:0] rNumber1,
    output reg[3:0] rNumber0,
    output reg rCarry
);

   initial
   begin
        rNumber1 = 4'b0000;
        rNumber0 = 4'b0000;
        rCarry = 1'b0;
   end

    always @(posedge wClock or posedge wReset)
    begin
        rCarry <= 1'b0;
        if (wReset)
        begin
            rNumber1 <= 4'b0000;
            rNumber0 <= 4'b0000;
        end
        else
        begin
            if (rNumber0 == 4'b1001)
            begin
                rNumber0 <= 4'b0000;
                rNumber1 <= rNumber1 + 1'b1;
                if (rNumber1 == 4'b0101)
                begin 
                    rNumber1 <= 4'b0000;
                    rCarry <= 1'b1;
                end
            end
            else
            begin
                rNumber0 <= rNumber0 + 1'b1;
            end
        end
    end
endmodule
