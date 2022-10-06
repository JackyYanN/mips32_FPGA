`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 18:20:29
// Design Name: 
// Module Name: SLTu
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


module SLTu(
    input [31:0] src1,
    input [31:0] src2,
    output [31:0] result
    );
    assign result = src1 < src2 ? 32'b1 : 32'b0;
endmodule
