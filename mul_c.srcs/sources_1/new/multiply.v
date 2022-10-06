`timescale 1ns / 1ps

module multiply(
    input clk,
    input mult_begin,
    input [31:0] mult_op1,
    input [31:0] mult_op2,
    output [63:0] product,
    output mult_end
    );
    reg [31:0] op2;
    reg  [63:0] op1;
   
    reg [63:0] temp;
    reg s_end;
    reg s_ign;
    reg s_rgn;
       
    always @(posedge clk) begin
    
        if (~mult_begin) begin
            temp <= 0;
            s_end <= 0;
            s_ign <= 0;
            s_rgn <= 0; 
            op2 <= 1;
        end
    
        if (mult_begin & ~s_rgn) begin
            op2 <= mult_op2;
            op1 <= mult_op1;
            s_rgn <= 1;
        end    
        
        if (mult_begin & ~s_end & ~s_ign & s_rgn) begin
	       if (op2[0]) begin
	           temp <= temp + op1;
	       end
	       s_ign <= 1;
        end
        
        if (mult_begin & ~s_end & s_ign & s_rgn) begin
            op2 <= op2 >> 1;
            op1 <= op1 << 1;
            s_ign <= 0;
        end
        
        if (mult_begin == 1 && op2 == 0) begin
            s_end <= 1;
        end
        
    end
    
    assign product = s_end? temp:0;
    assign mult_end = s_end;
endmodule
