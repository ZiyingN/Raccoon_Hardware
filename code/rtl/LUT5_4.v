`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 21:36:02
// Design Name: 
// Module Name: LUT5_4
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


module LUT5_4(
    input clk,
    input [4:0] address,
    (* ram_style = "distributed" *)output reg [48:0] Dout
    );
    always@(posedge clk) begin
        case(address)
			5'd0: Dout  <= 49'd0                ;
			5'd1: Dout <=  49'd129308285697266  ;
			5'd2: Dout <=  49'd258616571394532  ;
			5'd3: Dout <=  49'd387924857091798  ;
			5'd4: Dout  <= 49'd517233142789064  ;
			5'd5: Dout <=  49'd96716845314233   ;
			5'd6: Dout <=  49'd226025131011499  ;
			5'd7: Dout <=  49'd355333416708765  ;
			5'd8: Dout  <= 49'd484641702406031  ;
			5'd9: Dout <=  49'd64125404931200   ;
			5'd10:Dout <=  49'd193433690628466  ;
			5'd11:Dout <=  49'd322741976325732  ;
			5'd12:Dout <=  49'd452050262022998  ;
			5'd13:Dout <=  49'd31533964548167   ;
			5'd14:Dout <=  49'd160842250245433  ;
			5'd15:Dout <=  49'd290150535942699  ;
			5'd16:Dout  <= 49'd419458821639965  ;
			5'd17:Dout <=  49'd548767107337231  ;
			5'd18:Dout <=  49'd128250809862400  ;
			5'd19:Dout <=  49'd257559095559666  ;
			5'd20:Dout  <= 49'd386867381256932  ;
			5'd21:Dout <=  49'd516175666954198  ;
			5'd22:Dout <=  49'd95659369479367   ;
			5'd23:Dout <=  49'd224967655176633  ;
			5'd24:Dout  <= 49'd354275940873899  ;
			5'd25:Dout <=  49'd483584226571165  ;
			5'd26:Dout <=  49'd63067929096334   ;
			5'd27:Dout <=  49'd192376214793600  ;
			5'd28:Dout <=  49'd321684500490866  ;
			5'd29:Dout <=  49'd450992786188132  ;
			5'd30:Dout <=  49'd30476488713301   ;
			5'd31:Dout <=  49'd159784774410567  ;


        endcase
    end
endmodule
