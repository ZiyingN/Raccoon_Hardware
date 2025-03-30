`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/10 17:30:21
// Design Name: 
// Module Name: Modul_Multi
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


module Modul_Multi(
	input clk, rst, en,
	input [24:0] Din_1,Din_2,
	input mod, // mod - 1 Reduc_24 // mod - 0 Reduc_25 
	input [1:0]mod1,
	output [24:0] Dout,
	output [48:0] Dout_mod1,
	output Dout_flag
    );

	
	wire [49:0]mul_dout;
	wire mul_outflag;
	wire [24:0] Redc25_dout;
	wire Redc25_outflag;
	wire [23:0] Redc24_dout;
	wire Redc24_outflag;
	
	reg [4:0] mod_delay;
	always@(posedge clk ) begin
		if(rst) mod_delay <= 0;
		else mod_delay <= {mod_delay[3:0],mod};
	end
	
		
	assign Dout = mod_delay[4]?Redc24_dout:Redc25_dout;
	assign Dout_flag = mod1==3?mul_outflag:mod_delay[4]?Redc24_outflag:Redc25_outflag;
	
	assign Dout_mod1 = mul_dout;
	
	Multi_core_25 Multi25(
		.clk(clk),.rst(rst),.en(en), .Din_1(Din_1),.Din_2(Din_2),
		.Dout(mul_dout),.Dout_flag(mul_outflag)
    );	
	
	Reduc_25 Redc25(
    .clk(clk),.rst(rst),.en(mod_delay[1]?0:mod1==3?0:mul_outflag), .Din(mul_dout),
    .Dout(Redc25_dout), .Dout_flag(Redc25_outflag)
    );
	
	Reduc_24_sample Redc24(
    .clk(clk),.rst(rst),.en(mod_delay[1]?mod1==3?0:mul_outflag:0), .Din(mul_dout),
    .Dout(Redc24_dout), .Dout_flag(Redc24_outflag)
    );	
endmodule
