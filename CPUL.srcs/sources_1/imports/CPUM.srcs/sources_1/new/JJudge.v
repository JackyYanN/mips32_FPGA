`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 11:25:08
// Design Name: 
// Module Name: JJudge
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


module JJudge(
    input [6:0] flag,
    input [1:0] jumpd,
    input [31:0] result,
    input zerosrc,
    output jump,
    output valid_ifu
    );
    wire beq, ben,bgez,bgtz,blez,bltz, zeroR;
    assign zeroR = (result==0)? 1'b1:1'b0;
    assign beq = zeroR & flag[0];
    assign bne = ~zeroR & flag[1];
    assign bgez = zeroR & flag[2];
    assign bgtz = bgez & ~zerosrc & flag[3];
    assign bltz = ~zeroR & flag[5];
    assign blez = (bltz | zerosrc) & flag[4];
    
    assign jump = (jumpd[1] | jumpd[0] | beq | bne | bgez | bgtz | blez | bltz) & flag[6];
    assign valid_ifu = ~jump;
endmodule
