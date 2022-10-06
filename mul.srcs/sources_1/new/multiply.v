`timescale 1ns / 1ps

module multiply(
    input clk,
    input mult_begin,
    input signed [31:0] mult_op1,
    input signed [31:0] mult_op2,
    output signed [63:0] product,
    output mult_end
    );
    reg signed [32:0] op2;
    reg signed [31:0] op1;
   
    reg signed [63:0] temp;
    reg [5:0] count;
    reg s_end;
    reg s_ign;
    reg s_rgn;
        
    always @(posedge clk) begin
    
        if (~mult_begin) begin
            temp <= 0;
            count <= 0;
            s_end <= 0;
            s_ign <= 0;
            s_rgn <= 0;
        end
    
        if (mult_begin & ~s_rgn) begin
            op2 <= { mult_op2 , 1'b0};
            op1 <= mult_op1;
            s_rgn <= 1;
        end    
        
        case(op2[1:0])
            2'b00:begin
                if (mult_begin & ~s_ign & s_rgn) begin
                    s_ign <= 1;
                end   
            end
            2'b01:begin
                if (mult_begin & ~s_ign & s_rgn) begin
                    temp <= temp + {op1,{32{1'b0}}};
                    s_ign <= 1;
                end
            end
            2'b11:begin
                if (mult_begin & ~s_ign & s_rgn) begin
                    s_ign <= 1;
                end   
            end
            2'b10:begin
                if (mult_begin & ~s_ign & s_rgn) begin
                    temp <= temp + {-op1,{32{1'b0}}}; 
                    s_ign <= 1;
                end          
            end
        endcase
        
        if (mult_begin & ~s_end & s_ign & s_rgn) begin
            temp <= temp >>> 1;
            op2 <= op2 >>> 1;
            count <= count + 1;
            s_ign <= 0;
        end
        
        if (count[5]) begin
            s_end <= 1;
            count <= 6'd0;
        end
        
    end
        
    assign product = s_end? temp:0;
    assign mult_end = s_end;
endmodule
