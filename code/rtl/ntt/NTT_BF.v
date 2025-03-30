`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/11 10:37:20
// Design Name: 
// Module Name: NTT_BU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// // mod[2] - 1 Reduc_24 // mod - 0 Reduc_25 
//   mod[1:0] - 00  ntt
//   mod[1:0] - 01  intt
//   mod[1:0] - 10  pwm
//   mod[1:0] - 11  restruct
// This module includes 2 bf modules.  
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module NTT_BU( // 
	input clk, rst,Add_sub,
	input [2:0]mod, 
	input [24:0] ntt_in1,ntt_in2,ntt_in3,ntt_in4,
	input [24:0] zeta1, zeta2,
	input en,
	output reg [24:0] ntt_out1, ntt_out2,ntt_out3, ntt_out4,
	output reg ntt_out_flag
    );
	// mul
	reg mul1_en, mul2_en;
	reg [24:0] mul1_din_1, mul1_din_2, mul2_din_1, mul2_din_2;
	reg [1:0]mul_mod;
	wire [24:0] mul1_dout, mul2_dout;
	wire mul1_dout_flag, mul2_dout_flag;
	wire [48:0] mul1_dout_mod1, mul1_dout_mod2;
	// bf
	reg [24:0] bf1_dina, bf1_dinb, bf2_dina, bf2_dinb;
	reg bf_in_flag, bf_mod;
	reg [24:0]BF_q;
	wire [24:0] bf1_doutc, bf1_doutd, bf2_doutc, bf2_doutd;
	wire bf1_dout_flag, bf2_dout_flag;
	// div
	reg [24:0] div1_din, div2_din, div3_din, div4_din;
	reg div2_mod;
	wire [24:0]div1_dout, div2_dout, div3_dout, div4_dout;
	// shift
	reg [24:0] shift1_in, shift2_in;
	wire [24:0] shift1_out, shift2_out, zeta1_out, zeta2_out;
	reg [24:0] shift1_out_d,shift2_out_d;
	reg [24:0] shift1_out_d1,shift2_out_d1;
	reg mul1_dout_flag_d;
	always@(posedge clk) mul1_dout_flag_d <= mul1_dout_flag;
	// set in/out bits
	always@(posedge clk ) begin
	   if(rst) begin
	       mul_mod <= 0;
	       bf_mod <= 0;
	       div2_mod <= 0;
	   end
	   else begin
	       mul_mod <= mod[2];
	       bf_mod <= mod[0];
	       div2_mod <= mod[2];
	   end
	end
	// BF_q
	always@(posedge clk ) begin
	   if(rst) begin
	   end
	   else begin
	       BF_q <= mod[2]?25'hfc0001:25'h1fc0001;
	   end
	end
	// set connection of modules
	// bf
	always@(posedge clk ) begin
	   if(rst) begin
	       bf1_dina <= 0; bf1_dinb <= 0;
	       bf2_dina <= 0; bf2_dinb <= 0;	       
	       bf_in_flag <= 0;
	   end
	   else case(mod[1:0])
	       2'b00,2'b10:if(mul1_dout_flag) begin // ntt mm and shift
	               bf1_dina <= shift1_out_d1; bf1_dinb <= mul1_dout;//ntt_in1
	               bf2_dina <= shift2_out_d1; bf2_dinb <= mul2_dout;//ntt_in3	  
	               bf_in_flag <= mul1_dout_flag;
                   end
               else begin
	        	   bf1_dina <= 0; bf1_dinb <= 0;
	               bf2_dina <= 0; bf2_dinb <= 0;	       
	               bf_in_flag <= 0;
                   end
	       2'b01:if(en) begin // intt from outside
	               bf1_dina <= ntt_in1; bf1_dinb <= ntt_in2;
	               bf2_dina <= ntt_in3; bf2_dinb <= ntt_in4;	  
	               bf_in_flag <= en;
                   end
               else begin
	        	   bf1_dina <= 0; bf1_dinb <= 0;
	               bf2_dina <= 0; bf2_dinb <= 0;	       
	               bf_in_flag <= 0;
                   end
           2'b11:if(mul1_dout_flag) begin // restruct from 2 mm
	               bf1_dina <= mul2_dout; bf1_dinb <= mul1_dout;
	               bf2_dina <= 0; bf2_dinb <= 0;	
	               bf_in_flag <= mul1_dout_flag;  
                   end
               else begin
	        	   bf1_dina <= 0; bf1_dinb <= 0;
	               bf2_dina <= 0; bf2_dinb <= 0;	       
	               bf_in_flag <= 0;
                   end
	   endcase
	end
	// mm
    always@(posedge clk  ) begin
        if(rst) begin
            mul1_din_1 <= 0; mul1_din_2 <= 0;
            mul2_din_1 <= 0; mul2_din_2 <= 0;
            mul1_en <= 0;
        end
        else case(mod[1:0])
            2'b00,2'b10:if(en) begin // ntt pwm restruct
                    mul1_din_1 <= ntt_in2; mul1_din_2 <= zeta1;
                    mul2_din_1 <= ntt_in4; mul2_din_2 <= zeta2;            
                    mul1_en <= en;
                    end
                else begin
                    mul1_din_1 <= 0; mul1_din_2 <= 0;
                    mul2_din_1 <= 0; mul2_din_2 <= 0;            
                    mul1_en <= 0;  
                    end
            2'b01:if(bf1_dout_flag) begin //intt
                    mul1_din_1 <= bf1_doutd; mul1_din_2 <= zeta1_out; // zeta1 
                    mul2_din_1 <= bf2_doutd; mul2_din_2 <= zeta2_out; // zeta2           
                    mul1_en <= bf1_dout_flag;
                    end
                else begin
                    mul1_din_1 <= 0; mul1_din_2 <= 0;
                    mul2_din_1 <= 0; mul2_din_2 <= 0;            
                    mul1_en <= 0;  
                    end
             2'b11:if(en) begin // ntt pwm restruct
                    mul1_din_1 <= ntt_in1; mul1_din_2 <= ntt_in2;
                    mul2_din_1 <= ntt_in3; mul2_din_2 <= ntt_in4;            
                    mul1_en <= en;
                    end
                  else begin
                    mul1_din_1 <= 0; mul1_din_2 <= 0;
                    mul2_din_1 <= 0; mul2_din_2 <= 0;            
                    mul1_en <= 0;  
                    end  
        endcase
    end
	// shift
	
	always@(posedge clk) begin
	   shift1_out_d <= shift1_out;
	   shift2_out_d <= shift2_out;
	   shift1_out_d1 <= shift1_out_d;
	   shift2_out_d1 <= shift2_out_d;
	end
	
	always@(posedge clk ) begin
	   if(rst) begin
	       shift1_in <= 0; shift2_in <= 0;
	   end
	   else if(mod[1:0] == 0 | mod[1:0] == 2) begin
	       shift1_in <= ntt_in1; shift2_in <= ntt_in3;
	   end
	   else if(mod[1:0] == 1) begin
	       shift1_in <= bf1_doutc; shift2_in <= bf2_doutc;
	   end
	end
	// Dvi2
	always@(posedge clk )begin
	   if(rst) begin
	       div1_din <= 0; div2_din <= 0; div3_din <= 0; div4_din <= 0;
	   end
	   else if(mod[1:0] == 1)begin
	       div1_din <= shift1_out; div2_din <= shift2_out;  
	   end
	end
	// --------------------          output      -------------------------------//
	reg [24:0] div1_dout_d,div2_dout_d;
	always@(posedge clk )begin
	   div1_dout_d <= div1_dout;
	   div2_dout_d <= div2_dout;
	end
	always@(posedge clk )begin
	   if(rst) begin
	       ntt_out1 <= 0; ntt_out2 <= 0;
	       ntt_out3 <= 0; ntt_out4 <= 0; ntt_out_flag <= 0;
	   end
	   else case(mod[1:0])
	       2'b00:if(bf1_dout_flag) begin
	       	       ntt_out1 <= bf1_doutc; ntt_out2 <= bf1_doutd;
	               ntt_out3 <= bf2_doutc; ntt_out4 <= bf2_doutd; ntt_out_flag <= bf1_dout_flag;
	             end
	             else begin
	               ntt_out1 <= 0; ntt_out2 <= 0;
	               ntt_out3 <= 0; ntt_out4 <= 0; ntt_out_flag <= 0;
	             end
	       2'b01:if(mul1_dout_flag_d) begin
	       	       ntt_out1 <= div1_dout_d; ntt_out2 <= div3_dout;
	               ntt_out3 <= div2_dout_d; ntt_out4 <= div4_dout; ntt_out_flag <= mul1_dout_flag_d;
	             end
	             else begin
	               ntt_out1 <= 0; ntt_out2 <= 0;
	               ntt_out3 <= 0; ntt_out4 <= 0; ntt_out_flag <= 0;
	             end
	       2'b10:if(bf1_dout_flag) begin
	       	       ntt_out1 <= ~Add_sub?bf1_doutc:bf1_doutd; ntt_out2 <= 0;
	               ntt_out3 <= ~Add_sub?bf2_doutc:bf2_doutd; ntt_out4 <= 0; ntt_out_flag <= bf1_dout_flag;
	             end
	             else begin
	               ntt_out1 <= 0; ntt_out2 <= 0;
	               ntt_out3 <= 0; ntt_out4 <= 0; ntt_out_flag <= 0;
	             end
	       2'b11:if(mul2_dout_flag) begin
	       	       ntt_out1 <= mul1_dout_mod1[48:25]; ntt_out2 <= mul1_dout_mod1[24:0];
	               ntt_out3 <=  mul1_dout_mod2[48:25]; ntt_out4 <=  mul1_dout_mod2[24:0]; ntt_out_flag <= mul1_dout_flag;
	             end
	             else begin
	               ntt_out1 <= 0; ntt_out2 <= 0;
	               ntt_out3 <= 0; ntt_out4 <= 0; ntt_out_flag <= 0;
	             end
	   endcase     
	end
	
	// --------------------         modules      -------------------------------//
	Modul_Multi MUL1(.clk(clk), .rst(rst), .en(mul1_en), .Din_1(mul1_din_1), .Din_2(mul1_din_2),
	.mod(mul_mod), .Dout(mul1_dout), .Dout_flag(mul1_dout_flag),.mod1(mod[1:0]),.Dout_mod1(mul1_dout_mod1));
	Modul_Multi MUL2(.clk(clk), .rst(rst), .en(mul1_en), .Din_1(mul2_din_1), .Din_2(mul2_din_2),
	.mod(mul_mod), .Dout(mul2_dout), .Dout_flag(mul2_dout_flag),.mod1(mod[1:0]),.Dout_mod1(mul1_dout_mod2));
	
	BF_in BF1 (.dina(bf1_dina), .dinb(bf1_dinb),.in_valid(bf_in_flag), .mod(bf_mod), .clk(clk), .rst(rst),.q(BF_q),
    .doutc(bf1_doutc), .doutd(bf1_doutd), .o_valid(bf1_dout_flag));
	BF_in BF2 (.dina(bf2_dina), .dinb(bf2_dinb),.in_valid(bf_in_flag), .mod(bf_mod), .clk(clk), .rst(rst),.q(BF_q),
	 .doutc(bf2_doutc), .doutd(bf2_doutd), .o_valid(bf2_dout_flag));	
	
	Div2 div2_1(.clk(clk),.din(div1_din), .mod(div2_mod), .dout(div1_dout));
	Div2 div2_2(.clk(clk),.din(div2_din), .mod(div2_mod), .dout(div2_dout));	
	Div2 div2_3(.clk(clk),.din(mul1_dout), .mod(div2_mod), .dout(div3_dout));
	Div2 div2_4(.clk(clk),.din(mul2_dout), .mod(div2_mod), .dout(div4_dout));	
	    
    c_shift_ram_0 shift1 (.D(shift1_in),.CLK(clk),.Q(shift1_out));
    c_shift_ram_0 shift2 (.D(shift2_in),.CLK(clk),.Q(shift2_out));
    c_shift_ram_zetai shift3 (.D(zeta1),.CLK(clk),.Q(zeta1_out));
    c_shift_ram_zetai shift4 (.D(zeta2),.CLK(clk),.Q(zeta2_out));
endmodule
