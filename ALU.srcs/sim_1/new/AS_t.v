`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 18:03:42
// Design Name: 
// Module Name: AS_t
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


module AS_t();
    reg [31:0] a,b;
    reg op;
    wire [31:0] r;
    AS AS_t(a,b,op,r);
    initial begin
        a = 32'h7fffffff;
        b = 32'h0000000f;
        op = 1;
        #100
        op = ~op;
    end
endmodule
