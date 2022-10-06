`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/05 11:53:25
// Design Name: 
// Module Name: Decode
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


module Decode(
    input clk,
    input [31:0] ins,
    //alu
    output [11:0] controlo,
    //reg
    output rf_weno,
    output [4:0] rf_raddr1o,
    output [4:0] rf_raddr2o,
    output [4:0] rf_waddro,
//    output [31:0] rf_wdata,
    //ram
    output [3:0] ram_weno,
//    output [31:0] ram_wdata
    //select
    output selectAluo,
    //imm
    output [15:0] immo,
    output srcSelecto,
    output [1:0] flag_jumpo,
    output jumpdo,
    output [7:0] offseto
    );
    
    reg [11:0] control;
    //reg
    reg rf_wen, selectAlu, srcSelect, jumpd;
    reg [1:0] flag_jump;
    reg [5:0] rf_raddr1, rf_raddr2, rf_waddr;
    //ram
    reg [3:0] ram_wen;
    //select
    //imm
    reg [15:0]imm;
    reg [7:0 ]offset;
    
    
    always@(*) begin
        case(ins[31:26])//r
            6'b000000: begin
            if (ins[5:3] == 3'b100) begin
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= ins[20:16];
                rf_waddr <= ins[15:11];
                imm <= 16'b0;
                srcSelect <= 1'b1;
                selectAlu <= 1'b1;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                if (ins[2:0] == 5'b001) begin//add
                    control <= 12'h800;                    
                end
                else if (ins[2:0] == 5'b011) begin//sub
                    control <= 12'h400;
                end
                else if (ins[2:0] == 5'b100) begin//and
                    control <= 12'h80;
                end
                else if (ins[2:0] == 5'b111) begin//nor
                    control <= 12'h40;
                end
                else if (ins[2:0] == 5'b101) begin//or
                    control <= 12'h20;
                end
                else if (ins[2:0] == 5'b110) begin//xor
                    control <= 12'h10;
                end
                else begin
                    control <= 12'h0;
                end
            end
            else if(ins[5:3] == 3'b000) begin
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[20:16];
                rf_raddr2 <= 5'b0;
                rf_waddr <= ins[15:11];
                imm <= {11'b0,ins[10:6]};
                srcSelect <= 1'b0;
                selectAlu <= 1'b1;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                if (ins[2:0] == 5'b000) begin//sll
                    control <= 12'h8;
                end
                else if (ins[2:0] == 5'b010) begin//srl
                    control <= 12'h4;
                end
                else if (ins[2:0] == 5'b011) begin//sra
                    control <= 12'h2;
                end
                else begin
                    control <= 12'h0;
                end
            end
            else if(ins[5:3] == 3'b101) begin
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= ins[20:16];
                rf_waddr <= ins[15:11];
                imm <= 16'b0;
                srcSelect <= 1'b1;
                selectAlu <= 1'b1;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                if (ins[2:0] == 5'b010) begin//slt
                    control <= 12'h200;                    
                end
                else if (ins[2:0] == 5'b011) begin//sltu
                    control <= 12'h100;
                end
                else begin
                    control <= 12'h0;
                end
            end
            else if(ins[5:3] == 3'b001) begin//jr
                rf_wen <= 1'b0;
                ram_wen <= 4'b0000;
                rf_raddr1 <= 5'b0;
                rf_raddr2 <= ins[25:21];
                rf_waddr <= 5'b0;
                imm <= 16'b0;
                srcSelect <= 1'b1;
                selectAlu <= 1'b0;
                flag_jump <= 2'b10;
                jumpd <= 1'b1;
                offset <= 8'b0;
                control <= 12'h0;
            end
            end
            6'b001111: begin//lui
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= 5'b0;
                rf_raddr2 <= 5'b0;
                rf_waddr <= ins[25:21];
                imm <= ins[15:0];
                srcSelect <= 1'b0;
                selectAlu <= 1'b1;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                control <= 12'h1;
            end
            6'b100011: begin//lw
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= 5'b0;
                rf_waddr <= ins[20:16];
                imm <= ins[15:0];
                srcSelect <= 1'b0;
                selectAlu <= 1'b0;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                control <= 12'h800;
            end
            6'b101011: begin//sw
                rf_wen <= 1'b0;
                ram_wen <= 4'b1111;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= ins[20:16];
                rf_waddr <= 5'b0;
                imm <= ins[15:0];
                srcSelect <= 1'b0;
                selectAlu <= 1'b0;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                control <= 12'h800;
            end
            6'b001001: begin//addiu
                rf_wen <= 1'b1;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= 5'b0;
                rf_waddr <= ins[20:16];
                imm <= ins[15:0];
                srcSelect <= 1'b0;
                selectAlu <= 1'b1;
                flag_jump <= 2'b00;
                jumpd <= 1'b0;
                offset <= 8'b0;
                control <= 12'h800;
            end
            6'b000100: begin//beq
                rf_wen <= 1'b0;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= ins[20:16];
                rf_waddr <= 5'b0;
                imm <= 16'b0;
                srcSelect <= 1'b1;
                selectAlu <= 1'b0;
                flag_jump <= 2'b11;
                jumpd <= 1'b0;
                offset <= ins[7:0];
                control <= 12'h400;
            end
            6'b000101: begin//bne
                rf_wen <= 1'b0;
                ram_wen <= 4'b0000;
                rf_raddr1 <= ins[25:21];
                rf_raddr2 <= ins[20:16];
                rf_waddr <= 5'b0;
                imm <= 16'b0;
                srcSelect <= 1'b1;
                selectAlu <= 1'b0;
                flag_jump <= 2'b10;
                jumpd <= 1'b0;
                offset <= ins[7:0];
                control <= 12'h400;
            end
            6'b000010: begin//j
                rf_wen <= 1'b0;
                ram_wen <= 4'b0000;
                rf_raddr1 <= 5'b0;
                rf_raddr2 <= 5'b0;
                rf_waddr <= 5'b0;
                imm <= ins[15:0];
                srcSelect <= 1'b0;
                selectAlu <= 1'b0;
                flag_jump <= 2'b10;
                jumpd <= 1'b1;
                offset <= 8'b0;
                control <= 12'h0;
            end
        endcase
    end
    assign controlo = control;
    //reg
    assign rf_weno = rf_wen;
    assign rf_raddr1o = rf_raddr1;
    assign rf_raddr2o = rf_raddr2;
    assign rf_waddro = rf_waddr;
    //ram
    assign ram_weno = ram_wen;
    //select
    assign selectAluo = selectAlu;
    //imm
    assign immo = imm;
    assign srcSelecto = srcSelect;
    assign flag_jumpo = flag_jump;
    assign jumpdo = jumpd;
    assign offseto = offset;
    
    
endmodule
