`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/05 11:52:49
// Design Name: 
// Module Name: DecTestBench
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


module DecTestBench();
    reg[3:0] rT = 4'b0000;
    wire[7:0] wNum;
    parameter pDelay = 50;
    
    DisplayDecoder dTest
    (
        .wBinary(rT),
        .rNumeros(wNum)
    );
    
    always
    begin
        #pDelay rT = rT + 1'b1;
    end
    
endmodule
