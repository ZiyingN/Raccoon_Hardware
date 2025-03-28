`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/13 20:00:40
// Design Name: 
// Module Name: BF_in
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


module BF_in(
     input     [24 : 0] dina, dinb,
     input              in_valid, 
     input      mod, // mod - 1 Reduc_24 // mod - 0 Reduc_25 
     input     [24: 0] q,
     input              clk,rst, 
     output reg [24 : 0] doutc,doutd,
     output reg          o_valid
 );
	
	
	reg  [25 : 0] dout_tmp0,dout_tmp1;
	wire [24 : 0] doutc_tmp, doutd_tmp;
	reg o_valid_d;
    always @(posedge clk) begin
        if(rst) o_valid_d <= 0;   
        else o_valid_d <= in_valid;
    end
    always @(posedge clk ) begin
        if(rst) o_valid <= 0;   
        else o_valid <= o_valid_d;
    end
 
	wire [24:0] dina_temp,dinb_temp;
	assign dina_temp = mod?dinb:dina;
	assign dinb_temp = mod?dina:dinb;
	
	//// first stage /////////
	
	wire [25: 0] BF_add_P = dina + dinb - q;
	wire [25: 0] BF_sub_P = dina_temp - dinb_temp;
	
	always @(posedge clk )begin
	    if(rst)begin dout_tmp0 <= 0; dout_tmp1 <= 0;end
		else begin dout_tmp0 <= BF_add_P; dout_tmp1 <= BF_sub_P; end
	end
	
	//// second stage /////////
	always @(posedge clk )begin
	    if(rst)begin doutc <= 0; doutd <= 0;end
		else begin doutc <= dout_tmp0  + ({25{dout_tmp0[25]}} & q)    ; doutd <= dout_tmp1 + ({25{dout_tmp1[25]}} & q); end
	end	
endmodule

 
    
