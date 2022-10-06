`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 17:58:02
// Design Name: 
// Module Name: AS
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


module AS(
    input [31:0] src1,
    input [31:0] src2,
    input op,
    output [31:0] result
    );
    assign result = op? src1 + src2 : src1 - src2;
endmodule
