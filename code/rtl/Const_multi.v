`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/05 11:38:22
// Design Name: 
// Module Name: Const_multi
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


module Const_multi(
    input clk, 
    input [23:0] a_24,
    input [24:0] a_25,
    input din_flag,
    
    output reg  [43:0] d_25,
    output reg  [47:0] d_24,
    output reg dout_flag
    );
    reg dout_flag_d;
    always@(posedge clk) begin
        dout_flag_d <= din_flag;
        dout_flag <= dout_flag_d;
    end
    wire [35:0] p_24_1,p_24_2;
    reg [31:0] p_25_1;
    reg [31:0] p_25_2;
    always@(posedge clk) begin
        p_25_2 <= a_25 + {a_25,6'd0}; 
        p_25_1 <= {a_25,7'd0} - 3*a_25;
    end
 
    always@(posedge clk) begin
        d_24 <= {p_24_1,12'b0} + p_24_2;
        d_25 <= {p_25_1,12'b0} + p_25_2; 
    end
    
    mult_gen_24_1 multi24_1 (.CLK(clk),.A(a_24),.P(p_24_1));
    mult_gen_24_2 multi24_2 (.CLK(clk),.A(a_24),.P(p_24_2));
 
endmodule
