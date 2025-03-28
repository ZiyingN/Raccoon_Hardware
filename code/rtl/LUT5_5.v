`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 21:36:02
// Design Name: 
// Module Name: LUT5_5
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


module LUT5_5(
    input clk,
    input [4:0] address,
    (* ram_style = "distributed" *)output reg [48:0] Dout
    );
    always@(posedge clk) begin
        case(address)
			5'd0: Dout  <= 49'd0               ;
			5'd1: Dout <=  49'd289093060107833 ;
			5'd2: Dout <=  49'd28361537043569  ;
			5'd3: Dout <=  49'd317454597151402 ;
			5'd4: Dout  <= 49'd56723074087138  ;
			5'd5: Dout <=  49'd345816134194971 ;
			5'd6: Dout <=  49'd85084611130707  ;
			5'd7: Dout <=  49'd374177671238540 ;
			5'd8: Dout  <= 49'd113446148174276 ;
			5'd9: Dout <=  49'd402539208282109 ;
			5'd10:Dout <=  49'd141807685217845 ;
			5'd11:Dout <=  49'd430900745325678 ;
			5'd12:Dout <=  49'd170169222261414 ;
			5'd13:Dout <=  49'd459262282369247 ;
			5'd14:Dout <=  49'd198530759304983 ;
			5'd15:Dout <=  49'd487623819412816 ;
			5'd16:Dout  <= 49'd226892296348552 ;
			5'd17:Dout <=  49'd515985356456385 ;
			5'd18:Dout <=  49'd255253833392121 ;
			5'd19:Dout <=  49'd544346893499954 ;
			5'd20:Dout  <= 49'd283615370435690 ;
			5'd21:Dout <=  49'd22883847371426  ;
			5'd22:Dout <=  49'd311976907479259 ;
			5'd23:Dout <=  49'd51245384414995  ;
			5'd24:Dout  <= 49'd340338444522828 ;
			5'd25:Dout <=  49'd79606921458564  ;
			5'd26:Dout <=  49'd368699981566397 ;
			5'd27:Dout <=  49'd107968458502133 ;
			5'd28:Dout <=  49'd397061518609966 ;
			5'd29:Dout <=  49'd136329995545702 ;
			5'd30:Dout <=  49'd425423055653535 ;
			5'd31:Dout <=  49'd164691532589271 ;
        endcase
    end
endmodule
