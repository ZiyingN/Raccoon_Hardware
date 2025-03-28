`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2022 11:43:03
// Design Name: 
// Module Name: Change64To48_rej
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


module Change64To56(
	input clk,
	input rst,
	input inflag,
	input [63:0]Din,
	output reg [55:0]Dout,
	output reg D_flag
);
	reg [2:0] cnt;
	reg [55:0] temp;
	always@(posedge clk) begin
		if(rst) cnt<=0;
		else if(inflag)  cnt <= cnt + 1;
	end
	
	always@(posedge clk) begin
		if(rst) begin
			Dout <= 0;
			D_flag <= 0;
			temp <= 0;
		end
		else if(inflag) begin
			if(cnt == 0) begin
				D_flag <= 1; 
				Dout <= Din[63:8];
				temp <= Din[7:0];
			end	
			if(cnt == 1) begin
				D_flag <= 1; 
				Dout <= {temp[7:0],Din[63:16]};
				temp <= Din[15:0];
			end	
			if(cnt == 2) begin
				D_flag <= 1; 
				Dout <= {temp[15:0],Din[63:24]};
				temp <= Din[23:0];
			end	
			if(cnt == 3) begin
				D_flag <= 1; 
				Dout <= {temp[23:0],Din[63:32]};
				temp <= Din[31:0];
			end	
			if(cnt == 4) begin
				D_flag <= 1; 
				Dout <= {temp[31:0],Din[63:40]};
				temp <= Din[39:0];
			end				
			if(cnt == 5) begin
				D_flag <= 1; 
				Dout <= {temp[39:0],Din[63:48]};
				temp <= Din[47:0];
			end				
			if(cnt == 6) begin
				D_flag <= 1; 
				Dout <= {temp[47:0],Din[63:56]};
				temp <= Din[55:0];
			end				
		    if(cnt == 7) begin
			D_flag <= 1; 
			Dout <= temp [55:0];
			temp <= 0;
			end
		end
		else begin
			D_flag <= 0; 
			Dout <= 0;
		end
	end
endmodule
