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


module Change64To48(
	input clk,
	input rst,
	input inflag,
	input [63:0]Din,
	output reg [47:0]Dout,
	output reg D_flag
);
	reg [1:0] cnt;
	reg [47:0] temp;
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
				Dout <= Din[63:16];
				temp <= Din[15:0];
			end	
			if(cnt == 1) begin
				D_flag <= 1; 
				Dout <= {temp[15:0],Din[63:32]};
				temp <= Din[31:0];
			end	
			if(cnt == 2) begin
				D_flag <= 1; 
				Dout <= {temp[31:0],Din[63:48]};
				temp <= Din[47:0];
			end	
			if(cnt == 3) begin
				D_flag <= 1; 
				Dout <= temp[47:0];
				temp <= 0;
			end	
			
		end
		else begin
			D_flag <= 0; 
			Dout <= 0;
		end
	end
endmodule
