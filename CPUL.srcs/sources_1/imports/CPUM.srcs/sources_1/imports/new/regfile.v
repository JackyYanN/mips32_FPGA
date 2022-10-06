`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/07 11:48:30
// Design Name: 
// Module Name: regfile
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

module regfile(
    input clk,
    input wen,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    input flag_jal,
    input [7:0] pc,
    output [31:0] rdata1,
    output [31:0] rdata2,
    input [4:0]test_addr,
    output [31:0] test_data
    );
    
    reg [31:0] regs[31:0];
    integer i;
    initial begin
        for (i=0;i<32;i=i+1) begin
            regs[i] = 0;
        end
    end
    always@(posedge clk) begin
        regs[0] <= 5'd0;
        if (wen) begin
            if (waddr != 5'd0)
                regs[waddr] <= wdata;
        end
        else if (flag_jal) begin
            regs[31] <= pc + 1;
        end
    end
    
    assign rdata1 = regs[raddr1];
    assign rdata2 = regs[raddr2];
    assign test_data = regs[test_addr];
    
    
endmodule
