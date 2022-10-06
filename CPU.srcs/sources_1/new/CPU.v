`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 11:10:25
// Design Name: 
// Module Name: CPU
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


module CPU(
    input btn_clk,
    input clk,
    input resetn,
    input [4:0] rf_addr,
    input [7:0] mem_addr,
    output [31:0] rf_data,
    output [31:0] mem_data,
    output [7:0] cpu_pc,
    output [31:0] cpu_inst
    );
    //alu
    wire [11:0] control;
    wire [31:0] alu_src2;
    wire [31:0] result;
    //reg
    wire rf_wen;
    wire [4:0] rf_raddr1, rf_raddr2, rf_waddr;
    wire [31:0] rf_rdata1, rf_rdata2, rf_wdata;
    //ram
    wire [3:0] ram_wen;
    wire [31:0] ram_rdata;
    //pc
    wire jumpd;
    wire [1:0] flag_jump;
    wire [7:0] offset, pc;
    //rom
    wire [31:0] inst;
    //select
    wire selectAlu;
    //imm
    wire [15:0] imm;
    wire srcSelect;
    
    Pc pc_m(
        clk,
        btn_clk,
        flag_jump,
        result,
        jumpd,
        alu_src2[7:0],
        offset,
        pc
    );
    
    inst_rom rom(
        clk,
        pc,
        inst
    );
        
    data_ram ram(
        clk,
        ram_wen,
        result[7:0],
        rf_rdata2,
        ram_rdata,
        mem_addr,
        mem_data
    );
    
    alu alu(
        control,
        rf_rdata1,
        alu_src2,
        result
    );
    
    regfile rf(
        clk,
        rf_wen,
        rf_raddr1,
        rf_raddr2,
        rf_waddr,
        rf_wdata,
        rf_rdata1,
        rf_rdata2,
        rf_addr,
        rf_data
    );
    
    Select select(
        selectAlu,
        result,
        ram_rdata,
        rf_wdata
    );
    
    Src_Select src_Select(
        srcSelect,
        rf_rdata2,
        imm,
        alu_src2
    );
    
    Decode decode(
        clk,
        inst,
    //alu
        control,
    //reg
        rf_wen,
        rf_raddr1,
        rf_raddr2,
        rf_waddr,
    //ram
        ram_wen,
    //select
        selectAlu,
        imm,
        srcSelect,
    //pc   
        flag_jump,
        jumpd,
        offset 
    );
    assign cpu_pc = pc;
    assign cpu_inst = inst;
endmodule
