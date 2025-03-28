`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 21:36:02
// Design Name: 
// Module Name: LUT5_3
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


module LUT5_3(
    input clk,
    input [4:0] address,
    (* ram_style = "distributed" *)output reg [48:0] Dout
    );
    always@(posedge clk) begin
        case(address)
			5'd0: Dout  <= 49'd0              ;
			5'd1: Dout <=  49'd244589139065832;
			5'd2: Dout <=  49'd489178278131664;
			5'd3: Dout <=  49'd183942834025399;
			5'd4: Dout  <= 49'd428531973091231;
			5'd5: Dout <=  49'd123296528984966;
			5'd6: Dout <=  49'd367885668050798;
			5'd7: Dout <=  49'd62650223944533 ;
			5'd8: Dout  <= 49'd307239363010365;
			5'd9: Dout <=  49'd2003918904100  ;
			5'd10:Dout <=  49'd246593057969932;
			5'd11:Dout <=  49'd491182197035764;
			5'd12:Dout <=  49'd185946752929499;
			5'd13:Dout <=  49'd430535891995331;
			5'd14:Dout <=  49'd125300447889066;
			5'd15:Dout <=  49'd369889586954898;
			5'd16:Dout  <= 49'd64654142848633 ;
			5'd17:Dout <=  49'd309243281914465;
			5'd18:Dout <=  49'd4007837808200  ;
			5'd19:Dout <=  49'd248596976874032;
			5'd20:Dout  <= 49'd493186115939864;
			5'd21:Dout <=  49'd187950671833599;
			5'd22:Dout <=  49'd432539810899431;
			5'd23:Dout <=  49'd127304366793166;
			5'd24:Dout  <= 49'd371893505858998;
			5'd25:Dout <=  49'd66658061752733 ;
			5'd26:Dout <=  49'd311247200818565;
			5'd27:Dout <=  49'd6011756712300  ;
			5'd28:Dout <=  49'd250600895778132;
			5'd29:Dout <=  49'd495190034843964;
			5'd30:Dout <=  49'd189954590737699;
			5'd31:Dout <=  49'd434543729803531;
        endcase
    end
endmodule
