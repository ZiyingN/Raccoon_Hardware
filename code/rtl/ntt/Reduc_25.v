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
// To reduce the multi production of Q_25 = 33292289, Input 50-bit, Output 25-bit, 3 cycles
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reduc_25(
    input clk, rst, en,
    input [49:0] Din,
    
    output reg [24:0]Dout,
    output reg Dout_flag
    );
    
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
end

// stage 2
reg [27:0] r4;
wire [7:0] r_one = r1[9:7]+r1[6:0];
always@(posedge clk) begin
    if(rst) 
        r4 <= 0;
     else 
        r4 <= r2 + {r_one,18'b0} - (r3+r1[9:7]);
end

//stage 3

reg [27:0] cor;
always@(*) begin
    if(r4[27]) cor <= 33292289;
    else if(r4>{2*33292289}) cor <= -2*33292289;
    else if(r4>33292289) cor <= -33292289;
    else cor <= 0;
end

always@(posedge clk ) begin
    if(rst) 
        Dout <= 0;   
    else  
        Dout <= r4 + cor;
end

 

// flag
reg [1:0]Signal_OutFlag;
always@(posedge clk) begin
    if(rst) begin
        Signal_OutFlag <= 0;  
        Dout_flag <= 0;
    end 
    else  begin
        Signal_OutFlag <= {Signal_OutFlag[0],en};
        Dout_flag <= Signal_OutFlag[1];
    end 
end



endmodule
