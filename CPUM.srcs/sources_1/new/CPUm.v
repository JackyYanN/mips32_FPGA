`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/13 19:18:11
// Design Name: 
// Module Name: CPUm
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


module CPUm(
        input btn_clk,
        input clk,
        input resetn,
        input [5:0] rf_addr,
        input [7:0] mem_addr,
        output [31:0] rf_data,
        output [31:0] mem_data,
        output [7:0] IF_pc,
        output [31:0] IF_inst,
        output [7:0] ID_pc,
        output [7:0] EXE_pc,
        output [7:0] MEM_pc,
        output [7:0] WB_pc,
        output [31:0] display_state
);
    //alu
    wire [11:0] control;
    wire [31:0] alu_src2;
    wire [31:0] result;
    wire zeroS;
    //reg
    wire rf_wen,flag_jal;
    wire [4:0] rf_raddr1, rf_raddr2, rf_waddr;
    wire [31:0] rf_rdata1, rf_rdata2, rf_wdata;
    //ram
    wire [3:0] ram_wen;
    wire [31:0] ram_rdata;
    //pc
    wire [1:0] jumpd;
    wire [6:0] flag_jump;
    wire jump;
    wire [7:0] offset, pc;
    //rom
    wire [31:0] inst;
    //select
    wire selectAlu;
    //imm
    wire [16:0] imm;
    wire [1:0] srcSelect;
    wire [31:0] src_pc;
    //ifu
    wire valid;
    wire [7:0] ifu_pc;
    wire [31:0] ifu_inst;
    //rstu
    wire [7:0] rst_pc;
    wire rst_rfw,rst_select;
    wire [4:0] rst_rfwa;
    wire [3:0] rst_raw;
    wire [31:0] rst_result,rst_data;
    
    Pc pc_m(
        clk,
        btn_clk,
        jump,
        jumpd,
        src_pc[7:0],
        offset,
        pc
    );
    
    inst_rom rom(
        clk,
        pc,
        inst
    );
    
    IFU ifu(
        btn_clk,
        valid,
        pc,
        inst,
        ifu_pc,
        ifu_inst
    );
        
    data_ram ram(
        clk,
        rst_raw,
        rst_result[7:0],
        rst_data,
        ram_rdata,
        mem_addr,
        mem_data
    );
    
    alu alu(
        control,
        rf_rdata1,
        alu_src2,
        result,
        zeroS
    );
    
    RstU rstu(
        btn_clk,
        ifu_pc,
        rf_wen,
        selectAlu,
        rf_waddr,
        ram_wen,
        result,
        rf_rdata2,
        rst_pc,
        rst_rfw,
        rst_select,
        rst_rfwa,
        rst_raw,
        rst_result,
        rst_data
    );
    
    JJudge jjudge(
        flag_jump,
        jumpd,
        result,
        zeroS,
        jump,
        valid
    );
    
    regfile rf(
        clk,
        rst_rfw,
        rf_raddr1,
        rf_raddr2,
        rst_rfwa,
        rf_wdata,
        flag_jal,
        rst_pc,
        rf_rdata1,
        rf_rdata2,
        rf_addr,
        rf_data
    );
    
    Select select(
        rst_select,
        rst_result,
        ram_rdata,
        rf_wdata
    );
    
    Src_Select src_Select(
        srcSelect,
        rf_rdata2,
        imm,
        alu_src2,
        src_pc
    );
    
    Decode decode(
        clk,
        ifu_inst,
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
        flag_jal,
        offset 
    );
    assign IF_pc = pc;
    assign IF_inst = inst;
    assign ID_pc = ifu_pc;
    assign EXE_pc = ifu_pc;
    assign MEM_pc = rst_pc;
    assign WB_pc = rst_pc;
    assign display_state = 0;
endmodule
