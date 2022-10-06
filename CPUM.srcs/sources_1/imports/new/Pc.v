`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 13:26:12
// Design Name: 
// Module Name: Pc
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


module Pc(
    input clk,
    input btn_clk,
    input jump,
    input [1:0] jumpd,
    input [7:0] position,
    input [7:0] offset,
    output [7:0] pc
    );
    reg [7:0] pcReg[1:0];
    initial begin
        pcReg[0] <= 8'b0;
        pcReg[1] <= 8'b1;
    end
    always @(posedge btn_clk) begin
        if (jump) begin
            if(jumpd[1]) begin
                pcReg[0] <= position;
            end else if (jumpd[0]) begin
                pcReg[0] <= position>>2;
            end else begin
                pcReg[0] <= pcReg[0] + offset - 1'b1;
            end
        end else begin
            pcReg[0] <= pcReg[1];
        end
    end 
    
    always @(posedge clk) begin
        pcReg[1] <= pcReg[0] + 8'b1;
    end
    assign pc = pcReg[0];
endmodule

