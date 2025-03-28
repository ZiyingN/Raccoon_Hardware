`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/04 14:52:41
// Design Name: 
// Module Name: Poly_shift
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


module Poly_shift(
    input clk,din_flag,add_mod,[6:0]add_din,
    input [48:0] Dsp_24,
    input [47:0] multi_24,
    input [48:0] Dsp_25,
    input [43:0] multi_25,
    input Shift_mod,
    output [7:0] Dout,
    output Dout_flag,Poly_shift_rst,
    output [48:0] Dout_sign_z,
    output Dout_sign_z_flag
    );
    reg [49:0] Dsp_res;
    reg [49:0] multi_res;
    always@(posedge clk) begin
        Dsp_res <= Dsp_24 + Dsp_25;
        multi_res <= {multi_24,1'b0} + multi_25;
    end
    reg [48:0] redc_in_reg;
    reg [23:0] product;
    always@(posedge clk) begin
        redc_in_reg <= multi_res + Dsp_res[49:24];
        product <= Dsp_res[23:0];
    end
    reg [5:0]dout_flag_d;
    reg [5:0] sub_mod_d;
    always@(posedge clk) begin
        dout_flag_d <= {dout_flag_d[5:0],din_flag};
    end
 
    wire [73:0] Redc_din = {redc_in_reg, product};
    //wire [7:0] Redc_dout;
    wire [7:0] Redc_dout;
    wire [48:0] Dout_full;
    assign Poly_shift_rst = ~dout_flag_d[5] & Dout_flag;
    Reduc_49 Reduc49(.clk(clk),.din_flag(dout_flag_d[1]),.Din(Redc_din),.Dout(Redc_dout),.Dout_flag(Dout_flag),.Shift_mod(Shift_mod),.Dout_full(Dout_full));

    wire [6:0] Dout_d = Shift_mod?(Redc_dout[7:1] >= 31? Redc_dout[7:1] - 31:Redc_dout[7:1]):(Redc_dout[7:1] >= 125? Redc_dout[7:1] - 125:Redc_dout[7:1]);
    assign Dout = add_mod?(add_din - Dout_d):(Dout_d);
    assign Dout_sign_z = Dout_full;
    assign Dout_sign_z_flag = Dout_flag;
endmodule
