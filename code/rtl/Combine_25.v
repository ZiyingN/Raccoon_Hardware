`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/08 12:08:14
// Design Name: 
// Module Name: Conbine_24
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


module Combine_25(
    input clk, rst,
    input din_flag,
    input [24:0] din,
    output reg [49:0] dout//,
    //output reg dout_flag
    );
    reg cnt;
    always@(posedge clk) begin
        if(rst) 
            cnt <= 0;
        else if(din_flag)
            cnt <= cnt + 1;
    end 
    
    always@(posedge clk ) begin
        if(rst) 
            dout <= 0;
        else if(din_flag)
            dout <= {dout, din};
    end 
    
     
endmodule
