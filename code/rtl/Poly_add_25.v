`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/22 22:06:57
// Design Name: 
// Module Name: Poly_add_25
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


module Poly_add_25(
    input clk,rst,in_flag,  q_mod,
    input [49:0] din1,din2,
    output reg [49:0] dout,
    output reg out_flag,
    output  out_rst
    );
    parameter q_25 = 25'd33292289;
    parameter q_24 = 24'd16515073;
    
    reg [25:0] dout_1,dout_2; reg in_flag_d;

    always@(posedge clk) begin
        if(in_flag) begin
              dout_1 <=  din1[49:25] + din2[49:25]  - q_25;
              dout_2 <=  din1[24:0] + din2[24:0] - q_25;
              in_flag_d <= in_flag;
        end
        else  begin
            dout_1 <= 0;
            dout_2 <= 0;
            in_flag_d <= 0;
        end
    end
    always@(posedge clk) begin
        if(  in_flag_d) begin
            out_flag <= in_flag_d;
            dout[49:25] <= dout_1 + ({25{dout_1[25]}} & q_25) ;
            dout[24:0] <=  dout_2 + ({25{dout_2[25]}} & q_25) ;
        end
 
        
        else begin
            dout <= 0;
            out_flag <= 0;
        end
    end
    assign out_rst = out_flag & ~in_flag_d;
    
    
endmodule

