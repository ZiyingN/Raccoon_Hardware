`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/29 10:15:36
// Design Name: 
// Module Name: Temp_A
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


module Temp_A(
    input clk,rst,
	input t_wr_flag,
	input t_wr_half,
 
	input [47:0] din_24,
	input [49:0] din_25,
	
	input t_rd_flag,
	input t_choose,
	
	output [24:0 ]dout_1,dout_2,dout_3,dout_4
    );
    
	
	wire fifo_48_wr_1, fifo_48_wr_2, fifo_50_wr_1, fifo_50_wr_2;
	wire fifo_48_rd_1, fifo_48_rd_2, fifo_50_rd_1, fifo_50_rd_2;
	
	wire [47:0] dout_24_1,dout_24_2;
	wire [49:0] dout_25_1,dout_25_2;
	wire fifo_48_full_1, fifo_48_full_2, fifo_50_full_1, fifo_50_full_2;
	wire fifo_48_empty_1, fifo_48_empty_2, fifo_50_empty_1, fifo_50_empty_2;
	
	
	assign fifo_48_wr_1 = t_wr_flag & ~ t_wr_half;
	assign fifo_50_wr_1 = t_wr_flag & ~ t_wr_half;
	assign fifo_48_wr_2 = t_wr_flag &   t_wr_half;
	assign fifo_50_wr_2 = t_wr_flag &   t_wr_half;
	
	assign fifo_48_rd_1 = t_rd_flag & ~ t_choose;
	assign fifo_48_rd_2 = t_rd_flag & ~ t_choose;
	assign fifo_50_rd_1 = t_rd_flag &   t_choose;
	assign fifo_50_rd_2 = t_rd_flag &   t_choose;	
	
    assign dout_1 = t_choose?dout_25_1[49:25]:dout_24_1[47:24];
    assign dout_2 = t_choose?dout_25_2[49:25]:dout_24_2[47:24];
    assign dout_3 = t_choose?dout_25_1[24:0]:dout_24_1[23:0];
    assign dout_4 = t_choose?dout_25_2[24:0]:dout_24_2[23:0];    
	
	fifo_generator_t_48 t_48_1 (.clk(clk),.srst(rst),.din(din_24),.wr_en(fifo_48_wr_1),.rd_en(fifo_48_rd_1),.dout(dout_24_1),.full(fifo_48_full_1),.empty(fifo_48_empty_1));
	fifo_generator_t_48 t_48_2 (.clk(clk),.srst(rst),.din(din_24),.wr_en(fifo_48_wr_2),.rd_en(fifo_48_rd_2),.dout(dout_24_2),.full(fifo_48_full_2),.empty(fifo_48_empty_2));
	fifo_generator_t_50 t_50_1 (.clk(clk),.srst(rst),.din(din_25),.wr_en(fifo_50_wr_1),.rd_en(fifo_50_rd_1),.dout(dout_25_1),.full(fifo_50_full_1),.empty(fifo_50_empty_1));
	fifo_generator_t_50 t_50_2 (.clk(clk),.srst(rst),.din(din_25),.wr_en(fifo_50_wr_2),.rd_en(fifo_50_rd_2),.dout(dout_25_2),.full(fifo_50_full_2),.empty(fifo_50_empty_2));

endmodule
