`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/18 15:16:30
// Design Name: 
// Module Name: sample_a
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


module sample_a(
    input clk, rst, Din_flag,
    input [55:0] Din,
    
    output  [48: 0] Dout,
    output  Dout_flag
    );
 
	reg reduc_inflag;
	wire [24:0] Redc25_dout;
	wire Redc25_outflag;
	wire [23:0] Redc24_dout;
	wire Redc24_outflag;
    
    reg [48:0]Din_buffer;
    always@(posedge clk) begin
        if(rst) begin
            Din_buffer <= 0;
            reduc_inflag <= 0;
        end
        else if(Din_flag) begin
            Din_buffer <= {Din[0],Din[15:8],Din[23:16],Din[31:24],Din[39:32],Din[47:40],Din[55:48]};
            reduc_inflag <= Din_flag;
        end
        else begin
            Din_buffer <= 0;
            reduc_inflag <= 0;
        end
    end
    wire compareflag = Din_buffer <= 49'h1f41002f80001;
    assign  Dout_flag = compareflag & reduc_inflag;
    assign  Dout      = Dout_flag?Din_buffer:0; 
	
endmodule
