`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 19:39:03
// Design Name: 
// Module Name: IFU
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


module IFU(
    input btn_clk,
    input valid,
    input [7:0] iu_pc,
    input [31:0] iu_ins,
    output [7:0] ifu_pc,
    output [31:0] ifu_ins
    );
    reg [31:0] ins_ifu;
    reg [7:0] pc_ifu;
    always @(posedge btn_clk) begin
        if (valid) begin
            ins_ifu <= iu_ins;
            pc_ifu <= iu_pc;
        end else begin
            ins_ifu <= 32'b0;
            pc_ifu <= 8'b0;
        end
    end
    assign ifu_pc = pc_ifu;
    assign ifu_ins = ins_ifu;
endmodule
