`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 18:20:29
// Design Name: 
// Module Name: SLT
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


module SLT(
    input [31:0] src1,
    input [31:0] src2,
    output [31:0] result
    );
    wire flag;
    assign flag = src1[30:0] < src2[30:0] ? 1'b1:1'b0;
    assign result = src1[31] ^~ src2[31] & flag | src1[31] & ~src2[31] ? 1'b1 : 1'b0;
endmodule
