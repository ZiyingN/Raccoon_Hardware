`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 15:38:48
// Design Name: 
// Module Name: Reduc_24_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  A7-3 CLK:3.3 WNS: 0.625 - noraml strategy LUT 101  FF 105  // 3 cycles
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reduc_24_s( 
    input clk,
    input rst,en,
    input [48:0] Din,
    output reg [23:0] Dout,
    output reg Dout_flag
    );
    
 parameter q_24 = 24'd16515073;      
reg [26:0]  r1;
reg [26-18:0] r2;
reg [18: 0] r3;
wire [23:0] r_two = Din[48]?24'hf7efc1:0;
reg [3:0]Signal_OutFlag;
always@(posedge clk) begin
    if(rst) 
        r1 <= 0;
     else 
        r1 <= en? Din[23:0] - Din[47:24] + r_two :0;
end

always@(posedge clk ) begin
    if(rst) 
        r2 <= 0;
     else 
        r2 <=en?(Din[47:42] +Din[41:36] + Din[35:30]+ Din[29:24]):0;
end

always@(posedge clk ) begin
    if(rst) 
        r3 <= 0;
     else 
        r3 <= en? (Din[47:42] + Din[47:36]+ Din[47:30]):0;
end
// stage 2
reg [26:0] r4;
wire [6:0] r_one = r2[8:6]+r2[5:0];
always@(posedge clk ) begin
    if(rst) 
        r4 <= 0;
     else 
        r4 <= Signal_OutFlag[0]? ((r1 + {r_one,18'b0}) - (r3+r2[8:6])) :0;
end
 
//stage 3

 
reg [25: 0] rd_24_1;
always@(posedge clk ) begin
    if(rst) 
        rd_24_1 <= 0;   
    else  
        rd_24_1 <= Signal_OutFlag[1]? (r4 + ({26{r4[26]}} & q_24)):0;
end

wire [25: 0] rd_24_p1 = rd_24_1 - q_24;
reg [25: 0] rd_24_2;
always@(posedge clk ) begin
    if(rst) 
        rd_24_2 <= 0;   
    else  
        rd_24_2 <= Signal_OutFlag[2]? (rd_24_p1 + ({25{rd_24_p1[25]}} & q_24)):0;
end

wire [25: 0] rd_24_p2 = rd_24_2 - q_24;
always@(posedge clk ) begin
    if(rst) 
        Dout <= 0;   
    else  
        Dout <= Signal_OutFlag[3]?rd_24_p2 + ({25{rd_24_p2[25]}} & q_24):0;
end
// flag

always@(posedge clk) begin
    if(rst) begin
        Signal_OutFlag <= 0;  
        Dout_flag <= 0;
    end 
    else  begin
        Signal_OutFlag <= {Signal_OutFlag[2:0],en};
        Dout_flag <= Signal_OutFlag[3];
    end 
end

endmodule
