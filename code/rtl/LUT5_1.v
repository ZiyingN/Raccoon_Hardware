`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 21:36:02
// Design Name: 
// Module Name: LUT5_1
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


module LUT5_1(
    input clk,
    input [4:0] address,
    (* ram_style = "distributed" *) output reg [48:0] Dout
    );
    always@(posedge clk) begin
        case(address)
			5'd0: Dout  <= 49'd0               ;
			5'd1: Dout <=  49'd13125370249215  ;
			5'd2: Dout <=  49'd26250740498430  ;
			5'd3: Dout <=  49'd39376110747645  ;
			5'd4: Dout  <= 49'd52501480996860  ;
			5'd5: Dout <=  49'd65626851246075  ;
			5'd6: Dout <=  49'd78752221495290  ;
			5'd7: Dout <=  49'd91877591744505  ;
			5'd8: Dout  <= 49'd105002961993720 ;
			5'd9: Dout <=  49'd118128332242935 ;
			5'd10:Dout <=  49'd131253702492150 ;
			5'd11:Dout <=  49'd144379072741365 ;
			5'd12:Dout <=  49'd157504442990580 ;
			5'd13:Dout <=  49'd170629813239795 ;
			5'd14:Dout <=  49'd183755183489010 ;
			5'd15:Dout <=  49'd196880553738225 ;
			5'd16:Dout  <= 49'd210005923987440 ;
			5'd17:Dout <=  49'd223131294236655 ;
			5'd18:Dout <=  49'd236256664485870 ;
			5'd19:Dout <=  49'd249382034735085 ;
			5'd20:Dout  <= 49'd262507404984300 ;
			5'd21:Dout <=  49'd275632775233515 ;
			5'd22:Dout <=  49'd288758145482730 ;
			5'd23:Dout <=  49'd301883515731945 ;
			5'd24:Dout  <= 49'd315008885981160 ;
			5'd25:Dout <=  49'd328134256230375 ;
			5'd26:Dout <=  49'd341259626479590 ;
			5'd27:Dout <=  49'd354384996728805 ;
			5'd28:Dout <=  49'd367510366978020 ;
			5'd29:Dout <=  49'd380635737227235 ;
			5'd30:Dout <=  49'd393761107476450 ;
			5'd31:Dout <=  49'd406886477725665 ;
        endcase
    end
endmodule
