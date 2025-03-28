`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/11 10:29:09
// Design Name: 
// Module Name: Div2
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


module Div2(
    input clk,
    input [24:0] din, 
    input mod, // mod - 1 Reduc_24 // mod - 0 Reduc_25 
    
    output reg [24:0]dout
);
    
 
    always@(posedge  clk) begin
        dout <= din[24:1] + ({24{din[0]}} & (mod?24'd8257537:24'd16646145));
    end  
    
endmodule

