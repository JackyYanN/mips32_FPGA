`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 11:59:54
// Design Name: 
// Module Name: RstU
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


module RstU(
    input btn_clk,
    input [7:0] ifu_pc,
    input rf_w,
    input aluslct,//alu alu select
    input [4:0] rf_wa,//write addr
    input [3:0] ram_w,//ram wen
    input [31:0] aluresult,
    input [31:0] rf_data2,
    output [7:0] pc,
    output rf_wen,
    output selectAlu,
    output [4:0] rf_waddr,
    output [3:0] ram_wen,
    output [31:0] result,
    output [31:0] data
    );
    reg [7:0] pcr;
    reg rfw;
    reg select;
    reg [4:0] rfa;
    reg [3:0] raw;
    reg [31:0] rst,rf_data;
    always @(posedge btn_clk) begin
        pcr <= ifu_pc;
        rfw <= rf_w;
        select <= aluslct;
        rfa <= rf_wa;
        raw <= ram_w;
        rst <= aluresult;
        rf_data <= rf_data2;
    end
    assign pc = pcr;
    assign rf_wen = rfw; 
    assign selectAlu = select;
    assign rf_waddr = rfa;
    assign ram_wen = raw;
    assign result = rst;
    assign data = rf_data;
endmodule
