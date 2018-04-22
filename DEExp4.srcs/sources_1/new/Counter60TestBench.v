`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/04 23:12:13
// Design Name: 
// Module Name: Counter24TestBench
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


module Counter60TestBench();
    reg rCLK;
    parameter pHalfT = 50;
    
    supply0 VSS;
    supply1 VDD;
    wire[3:0] wN1, wN0;
    wire wC;
    
    Counter60 Cnt60
    (
        .wClock(rCLK),
        .wMode(VDD),
        .wUp(VDD),
        .rNumber1(wN1),
        .rNumber0(wN0),
        .rCarry(wC)
    );
    
    initial
    begin
        rCLK = 1'b0;
    end
    
    always
    begin
        #pHalfT rCLK <= ~rCLK;
    end
    
endmodule
