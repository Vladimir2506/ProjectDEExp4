`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/08 10:40:08
// Design Name: 
// Module Name: MainTestBench
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


module MainTestBench();
    
    reg rClk;
    supply0 VSS;
    supply1 VDD;
    wire[3:0] wEN;
    wire[7:0] wDATA;
    wire wBz, wCarr;
    parameter pHalfT = 5;
    
    Main mainTest
    (
        .wCLK(rClk),
        .wModeSel(VDD),
        .wBtnRst(VSS),
        .wBtnFlip(VDD),
        .wEnSound(VSS),
        .wBuzzer(wBz),
        .wCar(wCarr),
        .wEns(wEN),
        .wDisp(wDATA)
    );
       
    initial
    begin
        rClk = 1'b0;
    end
    
    always
    begin
        #pHalfT rClk <= ~rClk;
    end
    
    
    
endmodule
