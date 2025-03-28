`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/22 19:56:43
// Design Name: 
// Module Name: Poly_add_24
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


module Poly_add_24(
    input clk,rst,in_flag,
    input [47:0] din1,din2,
    output reg [47:0] dout,
    output reg out_flag,
    output  out_rst
    );
    parameter q_24 = 24'd16515073;

    reg [24:0] dout_1,dout_2; reg in_flag_d;

    always@(posedge clk) begin
        if(in_flag) begin
              dout_1 <=  din1[47:24] + din2[47:24] - q_24;
              dout_2 <=  din1[23:0] + din2[23:0] - q_24;
              in_flag_d <= in_flag;
        end
        else  begin
            dout_1 <= 0;
            dout_2 <= 0;
            in_flag_d <= 0;
        end
    end
    

    always@(posedge clk) begin
        if(in_flag_d) begin
            out_flag <= in_flag_d;
            dout[47:24] <= dout_1 + ({25{dout_1[24]}} & q_24) ;
            dout[23:0] <=  dout_2 + ({25{dout_2[24]}} & q_24) ;
        end
        else  begin
            dout <= 0;
            out_flag <= 0;
        end
    end   
    assign out_rst = out_flag & ~in_flag_d;
    
endmodule
