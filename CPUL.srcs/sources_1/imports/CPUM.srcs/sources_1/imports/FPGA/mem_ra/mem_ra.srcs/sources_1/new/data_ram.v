`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/22 20:13:24
// Design Name: 
// Module Name: data_ram
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

module data_ram(
    input clk,
    input [3:0] wen,//write enable
    input [7:0] addr,
    input [31:0] wdata,//write data
    output [31:0] rdata,//read data
    input [7:0] test_addr,
    output [31:0] test_data
    );
    blk_ram ram(
        .clka(clk),
        .wea(wen),
        .addra(addr),
        .dina(wdata),
        .douta(rdata),
        .clkb(clk),
        .web(4'b0000),
        .addrb(test_addr),
        .dinb(),
        .doutb(test_data)
    );
endmodule
