`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/01 16:22:56
// Design Name: 
// Module Name: nextCount
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


module nextCount(
    input btn_clk,
    output next
    );
    initial count <= 2'b00;
    
    reg[1:0] count;
    reg nextr;
    always@(posedge btn_clk) begin
        if (count[1] & count[0]) begin
            nextr <= ~nextr;
            count <= 2'b00;
        end else begin
            nextr <= 0;
            count <= count + 2'b01;
        end
    end
    assign next = nextr;
endmodule
