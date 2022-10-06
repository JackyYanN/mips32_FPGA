`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/19 12:57:35
// Design Name: 
// Module Name: tb
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


module tb;

    reg clk;
    reg btn_clk;
    reg resetn;

    // Instantiate the Unit Under Test (UUT)
    reg [ 4:0] rf_addr;   //扫描寄存器堆的地址
    wire [31:0] rf_data;   //寄存器堆从调试端口读出的数据
    reg  [7:0] mem_addr;  //要观察的内存地址
    wire [31:0] mem_data;  //内存地址对应的数据
    wire [7:0] IF_pc;     //IF模块的PC
    wire [31:0] IF_inst;   //IF模块取出的指令
    wire [7:0] ID_pc;     //ID模块的PC
    wire [7:0] EXE_pc;    //EXE模块的PC
    wire [7:0] MEM_pc;    //MEM模块的PC
    wire [7:0] WB_pc;     //WB模块的PC
    wire [31:0] display_state; //展示CPU当前状态
    CPUm cpu(
        .btn_clk     (btn_clk ),
        .clk(clk),
        .resetn  (resetn  ),
        .rf_addr (rf_addr ),
        .mem_addr(mem_addr),
        .rf_data (rf_data ),
        .mem_data(mem_data),
        .IF_pc   (IF_pc   ),
        .IF_inst (IF_inst ),
        .ID_pc   (ID_pc   ),
        .EXE_pc  (EXE_pc  ),
        .MEM_pc  (MEM_pc  ),
        .WB_pc   (WB_pc   ),
        .display_state (display_state)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        btn_clk = 0;
        resetn = 0;
        rf_addr = 0;
        mem_addr = 0;
        // Wait 100 ns for global reset to finish
        // Add stimulus here
    end
    always #10 clk=~clk;
    always #100 btn_clk=~btn_clk;
endmodule
