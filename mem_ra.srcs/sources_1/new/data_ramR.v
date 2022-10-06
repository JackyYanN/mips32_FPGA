`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/28 12:36:40
// Design Name: 
// Module Name: data_ramR
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


module data_ramR(
    input clk,
    input [3:0] wen,//write enable
    input [7:0] addr,
    input [31:0] wdata,//write data
    output [31:0] rdata,//read data
    input [7:0] test_addr,
    output [31:0] test_data
    );
    reg [31:0] ram[255:0];
    always @(posedge clk) begin
        if (wen[0])
            ram[addr][7:0] <= wdata[7:0];
        if (wen[1])
            ram[addr][15:8] <= wdata[15:8];
        if (wen[2])
            ram[addr][23:16] <= wdata[23:16];
        if (wen[3])
            ram[addr][31:24] <= wdata[31:24];
    end
    assign rdata = ram[addr];
    assign test_data = ram[test_addr];
endmodule
