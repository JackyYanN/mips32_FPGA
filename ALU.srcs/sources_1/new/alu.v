`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/29 17:41:48
// Design Name: 
// Module Name: alu
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


module alu(
    input [11:0] alu_control,
    input [31:0] alu_src1,
    input [31:0] alu_src2,
    output [31:0] alu_result
);
    wire [31:0] r_as,r_slt,r_sltu,r_and,r_nor,r_or,r_xor,r_sll,r_srl,r_sra,r_lui,result;

    AS as_m(alu_src1,alu_src2,(alu_control[11]&~alu_control[10]),r_as);
    SLT slt_m(alu_src1,alu_src2,r_slt);
    SLTu sltu_m(alu_src1,alu_src2,r_sltu);
    And and_m(alu_src1,alu_src2,r_and);
    Nor nor_m(alu_src1,alu_src2,r_nor);
    Or or_m(alu_src1,alu_src2,r_or);
    Xor xor_m(alu_src1,alu_src2,r_xor);
    SLL sll_m(alu_src1,alu_src2,r_sll);
    SRL srl_m(alu_src1,alu_src2,r_srl);
    SRA sra_m(alu_src1,alu_src2,r_sra);
    LUI lui_m(alu_src2,r_lui);
    
    SELECTOR selector_m(r_as,r_slt,r_sltu,r_and,r_nor,r_or,r_xor,r_sll,r_srl,r_sra,r_lui,alu_control,result);
    assign alu_result = result;

endmodule
