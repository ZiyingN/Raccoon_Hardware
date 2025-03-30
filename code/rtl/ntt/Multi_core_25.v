`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 12:05:51
// Design Name: 
// Module Name: Multi_core_25
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Multi_core_25(
    input clk, rst, en,
    input [24:0] Din_1,Din_2,
    
    output reg [49:0]Dout,
    output reg Dout_flag
    );
    
    wire [36 : 0] P1, P2;
    reg [24:0]Din_2_d;
    always@(posedge clk) begin
            Din_2_d <= Din_1[24]?Din_2:0;
    end
    
    
    always@(posedge clk ) begin
        if(rst) 
            Dout <= 0;
        else 
            Dout <= {P1,12'b0} + P2 + {Din_2_d, 24'b0} ; // 
    end
    
    reg Signal_OutFlag;

    always@(posedge clk ) begin
        if(rst) begin
            Signal_OutFlag <= 0;  
            Dout_flag <= 0;
        end 
        else  begin
            Signal_OutFlag <= en;
            Dout_flag <= Signal_OutFlag;
        end 
    end
    mult_gen_0 multi1 (.CLK(clk), .A(Din_2[24:12]),.B(Din_1[23:0]),.P(P1)); // 
    mult_gen_0 multi2 ( .CLK(clk),.A({1'b0, Din_2[11:0]}), .B(Din_1[23:0]),.P(P2)); //.CLK(clk),

    
 
endmodule
