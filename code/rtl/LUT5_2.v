`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/13 12:35:39
// Design Name: 
// Module Name: LUT5_2
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

module LUT5_2(
    input clk,
    input [4:0] address,
    (* ram_style = "distributed" *)output reg [48:0] Dout
    );
    always@(posedge clk) begin
        case(address)
			5'd0: Dout  <= 49'd0                ;
			5'd1: Dout <=  49'd420011847974880  ;
			5'd2: Dout <=  49'd290199112777663  ;
			5'd3: Dout <=  49'd160386377580446  ;
			5'd4: Dout  <= 49'd30573642383229   ;
			5'd5: Dout <=  49'd450585490358109  ;
			5'd6: Dout <=  49'd320772755160892  ;
			5'd7: Dout <=  49'd190960019963675  ;
			5'd8: Dout  <= 49'd61147284766458   ;
			5'd9: Dout <=  49'd481159132741338  ;
			5'd10:Dout <=  49'd351346397544121  ;
			5'd11:Dout <=  49'd221533662346904  ;
			5'd12:Dout <=  49'd91720927149687   ;
			5'd13:Dout <=  49'd511732775124567  ;
			5'd14:Dout <=  49'd381920039927350  ;
			5'd15:Dout <=  49'd252107304730133  ;
			5'd16:Dout  <= 49'd122294569532916  ;
			5'd17:Dout <=  49'd542306417507796  ;
			5'd18:Dout <=  49'd412493682310579  ;
			5'd19:Dout <=  49'd282680947113362  ;
			5'd20:Dout  <= 49'd152868211916145  ;
			5'd21:Dout <=  49'd23055476718928   ;
			5'd22:Dout <=  49'd443067324693808  ;
			5'd23:Dout <=  49'd313254589496591  ;
			5'd24:Dout  <= 49'd183441854299374  ;
			5'd25:Dout <=  49'd53629119102157   ;
			5'd26:Dout <=  49'd473640967077037  ;
			5'd27:Dout <=  49'd343828231879820  ;
			5'd28:Dout <=  49'd214015496682603  ;
			5'd29:Dout <=  49'd84202761485386   ;
			5'd30:Dout <=  49'd504214609460266  ;
			5'd31:Dout <=  49'd374401874263049  ;


        endcase
    end
endmodule

