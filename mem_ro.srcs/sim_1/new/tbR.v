`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/28 12:19:26
// Design Name: 
// Module Name: tbR
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


module tbR;
    reg  [7:0] addr;
    wire [31:0] inst;

    inst_romR inst_rom_module(
        .addr  (addr),
        .inst  (inst)
    );
    initial begin
        addr <= 8'b0;
    end
    always #10 begin
            addr <= addr + 8'b1;
    end
endmodule
