`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/08 23:02:35
// Design Name: 
// Module Name: Check_bounds_h
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


module Check_bounds_h(
    input clk, rst, in_flag,
    input [55:0] Check_h_in,
    
    output reg [1:0] hoo,
    output  [14:0] Accu_out
    );

    ///  check bounds
    reg [5:0] Accu_in;
    wire [1:0] h1 = Check_h_in[6]?(Check_h_in[4]? 5'd0 -  Check_h_in[5:0] : Check_h_in[5:0] + 5'd31): (Check_h_in[4]? (5'd31 - Check_h_in[5:0]):Check_h_in[1:0]);
    wire [1:0] h2 = Check_h_in[13]?(Check_h_in[11]?5'd0 -  Check_h_in[12:7] :Check_h_in[12:7]+ 5'd31 ): (Check_h_in[11]?(5'd31 - Check_h_in[12:7]):  Check_h_in[8:7]);
    wire [1:0] h3 = Check_h_in[20]?(Check_h_in[18]? 5'd0 -  Check_h_in[18:14]:  Check_h_in[18:14] + 5'd31):(Check_h_in[18]?(5'd31 - Check_h_in[19:14]):  Check_h_in[15:14]);
    wire [1:0] h4 =  Check_h_in[27]?( Check_h_in[25]? 5'd0 -  Check_h_in[26:21] :Check_h_in[26:21] + 5'd31):( Check_h_in[25]?(5'd31 - Check_h_in[26:21]):  Check_h_in[22:21]);
    
    wire [1:0] h5 = Check_h_in[34]?(Check_h_in[32]?5'd0 -  Check_h_in[33:28] :  Check_h_in[33:28] + 5'd31): (Check_h_in[32]?(5'd31 - Check_h_in[33:28]):  Check_h_in[29:28]);
    wire [1:0] h6 = Check_h_in[41]?(Check_h_in[39]?5'd0 -  Check_h_in[40:35] : Check_h_in[40:35] + 5'd31): (Check_h_in[39]?(5'd31 - Check_h_in[40:35]):  Check_h_in[36:35]);
    wire [1:0] h7 = Check_h_in[48]?(Check_h_in[46]?5'd0 -  Check_h_in[47:42] :  Check_h_in[47:42] + 5'd31): (Check_h_in[46]?(5'd31 - Check_h_in[47:42]):  Check_h_in[43:42]);
    wire [1:0] h8 = Check_h_in[55]?(Check_h_in[53]? 5'd0 -  Check_h_in[54:49] : Check_h_in[54:49] + 5'd31): (Check_h_in[53]?(5'd31 - Check_h_in[54:49]):  Check_h_in[50:49]);  
    
    wire [5:0] test1 = Check_h_in[5:0];
    wire [5:0] test2 = Check_h_in[12:7];
    wire [5:0] test3 = Check_h_in[19:14];
    wire [5:0] test4 = Check_h_in[26:21];
    wire [5:0] test5 = Check_h_in[33:28];
    wire [5:0] test6 = Check_h_in[40:35];
    wire [5:0] test7 = Check_h_in[47:42];
    wire [5:0] test8 = Check_h_in[54:49];
    always@(posedge clk) begin
        if(rst) Accu_in <= 0;
        else if (in_flag)  Accu_in <= h1*h1 + h2*h2 + h3*h3 + h4*h4 + h5*h5 + h6*h6 + h7*h7 + h8*h8;
        else Accu_in <= 0;
    end
    wire [1:0] hoo1 = h1 > h2 ? h1:h2;
    wire [1:0] hoo2 = h3 > h4 ? h3:h4;
    wire [1:0] hoo3 = h5 > h6 ? h5:h6;
    wire [1:0] hoo4 = h7 > h8 ? h7:h8;    
    
    wire [1:0] hoo5 = hoo1 > hoo2 ? hoo1:hoo2;
    wire [1:0] hoo6 = hoo3 > hoo4 ? hoo3:hoo4;     
    
    wire [1:0] hoo7 = hoo5 > hoo6 ? hoo5:hoo6; 
    always@(posedge clk) begin
        if(rst) hoo <= 0;
        else if (in_flag)  hoo <= (hoo > hoo7)? hoo:hoo7;
    end
    c_accum_0 h22_accu (.B(Accu_in),.SCLR(rst),.CLK(clk), .Q(Accu_out));
endmodule
