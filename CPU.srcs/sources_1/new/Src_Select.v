`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 13:00:09
// Design Name: 
// Module Name: Src_Select
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


module Src_Select(
    input srcSelect,
    input [31:0] rf_rdata2,
    input [15:0] imm,
    output [31:0] alu_src2
    );
    assign alu_src2 = srcSelect? rf_rdata2 : {{16'b0},imm};
endmodule
