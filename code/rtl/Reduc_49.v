`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 22:03:58
// Design Name: 
// Module Name: Reduc_49
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


module Reduc_49(
    input clk,din_flag,Shift_mod,
    input [73:0] Din,
    output [7:0] Dout,
    output  [48:0] Dout_full,
    output Dout_flag
    );
    wire [48:0] LUT24_Dout1, LUT24_Dout2, LUT24_Dout3,LUT24_Dout4,LUT24_Dout5;
    
    reg [50:0] stage1_prodc1, stage1_prodc2;
    reg [48:0] prodcDin;
    always@(posedge clk) begin
        stage1_prodc1 <= LUT24_Dout1 + LUT24_Dout2 + LUT24_Dout3;
        stage1_prodc2 <= LUT24_Dout5 + LUT24_Dout4 + prodcDin;
        prodcDin <= Din[48:0];
    end
    //stage 2 reduc
    reg [51:0] stage2_prodc1;
    always@(posedge clk) begin
        stage2_prodc1 <= stage1_prodc1 + stage1_prodc2;
    end
    // stage3 select reducetion number
    reg [51:0] redc_prime, stage2_prodc1_d;
    always@(posedge clk) begin
        stage2_prodc1_d <= stage2_prodc1;
    end
    always@(posedge clk) begin
         if(stage2_prodc1 >= 52'h9c4500ed80005 )  redc_prime <= 52'h9c4500ed80005;
        else if(stage2_prodc1 >= 52'h7d0400be00004 )  redc_prime <= 52'h7d0400be00004; 
        else if(stage2_prodc1 >= 52'h5dc3008e80003 )  redc_prime <= 52'h5dc3008e80003; 
        else if(stage2_prodc1 >= 52'h3e82005f00002 )  redc_prime <= 52'h3e82005f00002; 
        else if(stage2_prodc1 >= 52'h1f41002f80001 )  redc_prime <= 52'h1f41002f80001; 
        else  redc_prime <= 52'h0; 
    end
     
    // stage 4 final
     reg [48:0] d_final;
    always@(posedge clk) begin
        d_final <= stage2_prodc1_d - redc_prime;
    end
    assign Dout = Shift_mod? (d_final[48:43] + 1):(d_final[48:41] + 1);
    
    reg [4:0]dout_flag_d;
    always@(posedge clk) begin
        dout_flag_d <= {dout_flag_d[3:0],din_flag};
    end
    assign Dout_full = d_final;
    assign Dout_flag = dout_flag_d[4];
    LUT5_1 LUT24_1(.clk(clk),.address(Din[53:49]),.Dout(LUT24_Dout1));
    LUT5_2 LUT24_2(.clk(clk),.address(Din[58:54]),.Dout(LUT24_Dout2));
    LUT5_3 LUT24_3(.clk(clk),.address(Din[63:59]),.Dout(LUT24_Dout3));
    LUT5_4 LUT24_4(.clk(clk),.address(Din[68:64]),.Dout(LUT24_Dout4));
    LUT5_5 LUT24_5(.clk(clk),.address(Din[73:69]),.Dout(LUT24_Dout5)); 
endmodule
