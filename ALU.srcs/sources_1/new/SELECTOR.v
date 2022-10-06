`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 19:37:39
// Design Name: 
// Module Name: SELECTOR
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


module SELECTOR(
    input [31:0] ras,
    input [31:0] rslt,
    input [31:0] rsltu,
    input [31:0] rand,
    input [31:0] rnor,
    input [31:0] ror,
    input [31:0] rxor,
    input [31:0] rsll,
    input [31:0] rsrl,
    input [31:0] rsra,
    input [31:0] rlui,
    input wire [11:0] ctl,
    output [31:0] result
    );
    wire [31:0] r_as,r_slt,r_sltu,r_and,r_nor,r_or,r_xor,r_sll,r_srl,r_sra,r_lui;
    assign r_as = ras & {32{ctl[11]|ctl[10]}};
    assign r_slt = rslt & {32{ctl[9]}};
    assign r_sltu = rsltu & {32{ctl[8]}};
    assign r_and = rand & {32{ctl[7]}};
    assign r_nor = rnor & {32{ctl[6]}};
    assign r_or = ror & {32{ctl[5]}};
    assign r_xor = rxor & {32{ctl[4]}};
    assign r_sll = rsll & {32{ctl[3]}};
    assign r_srl = rsrl & {32{ctl[2]}};
    assign r_sra = rsra & {32{ctl[1]}};
    assign r_lui = rlui & {32{ctl[0]}};
    
    assign result = r_as|r_slt|r_sltu|r_and|r_nor|r_or|r_xor|r_sll|r_srl|r_sra|r_lui;
endmodule
