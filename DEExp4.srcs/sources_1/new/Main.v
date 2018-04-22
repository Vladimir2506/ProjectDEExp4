`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/06 22:18:27
// Design Name: 
// Module Name: Main
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


module Main
(
    input wire wCLKDisp,
    input wire wCLKClock,
    input wire wModeSel,
    input wire wEnSound,
    input wire wReset,
    input wire wBtnFlip,
    output wire wBuzzer,
    output wire[3:0] wEns,
    output wire[7:0] wDisp,
    output wire wCar
);

    /*supply0 VSS;
    supply1 VDD;*/
    
    /*parameter pDiv1 = 100000000;
    parameter pDiv5 = 50000000;
    parameter pDiv10 = 10000000;
    parameter pDiv100 = 1000000;
    parameter pDiv1000 = 100000;*/
    
    reg[26:0] rCnt;
    //reg rClock;
    wire[3:0] wDigD, wDigC, wDigB, wDigA;
    wire wRst, wFlip, wCarryInt;
    wire wCLKActual;
    
    assign wCLKActual = ~wModeSel ? wCLKClock : wBtnFlip;
    assign wBuzzer = wEnSound ? ~(wDigC == 5 && wDigD >= 4) : 1;
    
    Counter60 Mins
    (
        .wClock(wCLKActual),
        .wUp(wBtnFlip),
        .wReset(wReset),
        .rCarry(wCarryInt),
        .rNumber0(wDigD),
        .rNumber1(wDigC)
    );
    
    Counter24 Hrs
    (
       .wClock(wCarryInt),
       .wUp(wCarryInt),
       .wReset(wReset),
       .rCarry(wCar),
       .rNumber0(wDigB),
       .rNumber1(wDigA)
    );
    
    DynamicDisplay LEDS
    (
        .wClock(wCLKDisp),
        .wA(wDigA),
        .wB(wDigB),
        .wC(wDigC),
        .wD(wDigD),
        .wData(wDisp),
        .rEnable(wEns)
    );

    
    /*initial
    begin
        rCnt = 0;
        rClock = 1'b0;
    end
    
    always @(posedge rClock)
    begin
        if (rCnt < pDiv5)
        begin
            rCnt <= rCnt + 1;
        end
        else
        begin
            rCnt <= 0;
            rClock <= ~rClock;
        end
    end*/
    
endmodule
