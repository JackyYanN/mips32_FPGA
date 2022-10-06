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
    input [1:0] flag_jump,
    input [31:0] do,
    input jumpd,
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
        if (flag_jump[1]) begin
            if(jumpd) begin
                pcReg[0] <= position;
            end else if(flag_jump[0]) begin
                if (do == 31'b0) begin
                    pcReg[0] <= pcReg[0] + offset;
                end else begin
                    pcReg[0] <= pcReg[1];
                end
            end else if(~flag_jump[0]) begin
                if (do != 0) begin
                    pcReg[0] <= pcReg[0] + offset;
                end else begin
                    pcReg[0] <= pcReg[1];
                end
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

