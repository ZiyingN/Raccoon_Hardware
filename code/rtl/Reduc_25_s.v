`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 11:43:08
// Design Name: 
// Module Name: Reduc_25
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// To reduce the multi production of Q_25 = 33292289, Input 50-bit, Output 25-bit, 2 cycles
// Dependencies: 
// A7-3 CLK:3.3 WNS: 0.297 - noraml strategy LUT 113 FF 63  // 3 cycles
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reduc_25_s(
    input clk, rst, en,
    input [49:0] Din,
    
    output reg [24:0]Dout,
    output reg Dout_flag
    );
parameter q_25 = 25'd33292289;   
//stage 1
reg [27:0] r2;
reg [27-18:0] r1;
reg [18:0] r3;
always@(posedge clk) begin
    if(rst) begin
        r1 <= 0;
        r2 <= 0;
        r3 <= 0;
    end    
    else if(en) begin
        r1 <= (Din[49:46] + Din[45:39] + Din[38:32] + Din[31:25]);
        r2 <= (Din[24:0]-Din[49:25]);
        r3 <= (Din[49:32] + Din[49:39] + Din[49:46]);
    end
    else  begin
        r1 <= 0;
        r2 <= 0;
        r3 <= 0;
    end  
end

// stage 2
reg [27:0] r4;
wire [7:0] r_one = r1[9:7]+r1[6:0];
reg [3:0]Signal_OutFlag;
always@(posedge clk) begin
    if(rst) 
        r4 <= 0;
     else 
        r4 <= Signal_OutFlag[0]?r2 + {r_one,18'b0} - (r3+r1[9:7]):0;
end

//stage 3

reg [26: 0] rd_25_1;
always@(posedge clk ) begin
    if(rst) 
        rd_25_1 <= 0;   
    else  
        rd_25_1 <= Signal_OutFlag[1]?r4 + ({27{r4[27]}} & q_25):0;
end

wire [26: 0] rd_25_p1 = rd_25_1 - q_25;
reg [26: 0] rd_25_2;
always@(posedge clk ) begin
    if(rst) 
        rd_25_2 <= 0;   
    else  
        rd_25_2 <= Signal_OutFlag[2]?rd_25_p1 + ({26{rd_25_p1[26]}} & q_25):0;
end

wire [26: 0] rd_25_p2 = rd_25_2 - q_25;
always@(posedge clk ) begin
    if(rst) 
        Dout <= 0;   
    else  
        Dout <= Signal_OutFlag[3]?rd_25_p2 + ({26{rd_25_p2[26]}} & q_25):0;
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
