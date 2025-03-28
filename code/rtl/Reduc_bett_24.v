`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/21 19:42:09
// Design Name: 
// Module Name: Reduc_bett_24
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


module Reduc_bett_24(
    input clk, rst, en,
    input [48:0] Din_1,
    
    output reg [23:0]Dout,
    output reg Dout_flag
    );
    
   
    // stage1
    reg [25:0] p1;
    always@(posedge clk) begin
        p1 <= Din_1[48:24] + Din_1[48:30] + Din_1[48:36] + Din_1[48:42] ;
    end
    reg [49:0] Din_2;
    always@(posedge clk) Din_2 <= Din_1;
    // stage2
    reg [26:0]r1;
    always@(posedge clk) begin
        r1 <= Din_2 - ({p1,24'd0} - {p1,18'd0} + p1);
    end
    //stage 3
reg [26:0] cor;
always@(*) begin
    if(r1[26]) cor <= 16515073;
    else if(r1>={3*16515073}) cor <= -3*16515073;
    else if(r1>={2*16515073}) cor <= -2*16515073;
    else if(r1>=16515073) cor <= -16515073;
    else cor <= 0;
end

always@(posedge clk or negedge rst) begin
    if(~rst) 
        Dout <= 0;   
    else  
        Dout <= r1 + cor;
end

// flag
reg [1:0]Signal_OutFlag;
always@(posedge clk or negedge rst) begin
    if(rst) begin
        Signal_OutFlag <= 0;  
        Dout_flag <= 0;
    end 
    else  begin
        Signal_OutFlag <= {Signal_OutFlag[0],en};
        Dout_flag <= Signal_OutFlag[1];
    end 
end   
//#### test
wire [24:0] res = (Din_1)%16515073;
reg [24:0] res_1,res_2;
always@(posedge clk) begin
    res_1 <= res;
    res_2 <= res_1;
end
wire eq = res_2 == Dout;
   
endmodule
