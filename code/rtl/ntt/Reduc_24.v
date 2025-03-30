`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 15:38:48
// Design Name: 
// Module Name: Reduc1
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


module Reduc_24_sample( 
    input clk,
    input rst,en,
    input [48:0] Din,
    output reg [23:0] Dout,
    output reg Dout_flag
    );
    
    
reg [26:0]  r1;
reg [26-18:0] r2;
reg [18: 0] r3;
wire [23:0] r_two = Din[48]?24'hf7efc1:0;
always@(posedge clk) begin
    if(rst) 
        r1 <= 0;
     else 
        r1 <= Din[23:0] - Din[47:24] + r_two ;
end

always@(posedge clk ) begin
    if(rst) 
        r2 <= 0;
     else 
        r2 <=(Din[47:42] +Din[41:36] + Din[35:30]+ Din[29:24]);
end

always@(posedge clk ) begin
    if(rst) 
        r3 <= 0;
     else 
        r3 <= Din[47:42] + Din[47:36]+ Din[47:30];
end
// stage 2
reg [26:0] r4;
wire [6:0] r_one = r2[8:6]+r2[5:0];
always@(posedge clk ) begin
    if(rst) 
        r4 <= 0;
     else 
        r4 <=  (r1 + {r_one,18'b0}) - (r3+r2[8:6]);
end
 
//stage 3

reg [25:0] cor;
always@(*) begin
    if(r4[26]) cor <= 16515073;
    else if(r4>{2*16515073}) cor <= -2*16515073;
    else if(r4>16515073) cor <= -16515073;
    else cor <= 0;
end

always@(posedge clk) begin
        Dout <= r4 + cor;
end

// flag
reg [1:0]Signal_OutFlag;
always@(posedge clk ) begin
    if(rst) begin
        Signal_OutFlag <= 0;  
        Dout_flag <= 0;
    end 
    else  begin
        Signal_OutFlag <= {Signal_OutFlag,en};
        Dout_flag <= Signal_OutFlag[1];
    end 
end

endmodule
