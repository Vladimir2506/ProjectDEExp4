`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/06 19:02:38
// Design Name: 
// Module Name: InputProc
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


module InputProc
(
    input wire wKey,
    input wire wClock,
    input wire wReset,
    output reg rVal
);

    parameter pDiv = 1000000;       //100Hz for Implementation
    parameter pCnt0 = 0;
    reg[19:0] rCnt;
    reg rCheck;
    
    initial 
    begin
        rCnt = pCnt0;
        rCheck = 1'b0;
    end
    
    always @(posedge wClock)
    begin
        if(rCnt < pDiv)
        begin
            rCnt = rCnt + 1;
        end
       else
       begin
           rCnt = pCnt0;
           rCheck = ~rCheck;
       end
    end
    
    always @(rCheck)
    begin
        if(wReset)
        begin
            rVal = 1'b0;
        end
        else
        begin
            rVal = wKey;
        end
    end
    
endmodule
