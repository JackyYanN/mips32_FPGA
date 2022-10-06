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
    reg [ 4:0] rf_addr;   //ɨ��Ĵ����ѵĵ�ַ
    wire [31:0] rf_data;   //�Ĵ����Ѵӵ��Զ˿ڶ���������
    reg  [7:0] mem_addr;  //Ҫ�۲���ڴ��ַ
    wire [31:0] mem_data;  //�ڴ��ַ��Ӧ������
    wire [7:0] IF_pc;     //IFģ���PC
    wire [31:0] IF_inst;   //IFģ��ȡ����ָ��
    wire [7:0] ID_pc;     //IDģ���PC
    wire [7:0] EXE_pc;    //EXEģ���PC
    wire [7:0] MEM_pc;    //MEMģ���PC
    wire [7:0] WB_pc;     //WBģ���PC
    wire [31:0] display_state; //չʾCPU��ǰ״̬
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
