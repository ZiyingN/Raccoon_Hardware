`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/11 18:00:18
// Design Name: 
// Module Name: Chash_poly2
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


module Chash_poly1(
    input clk, rst, in_flag,
    input [15:0] Chash_addr,
    input [3:0] ell,
    input [47:0]Din_24,
    input [49:0]Din_25,
    
    output reg [10:0] addr_o,
    output reg [47:0] Dout_24,
    output reg [49:0] Dout_25,
    output reg Dout_flag
    );

    reg [9:0] addr_oP;
    reg [47:0] Dout_24P;
    reg [49:0] Dout_25P;
    reg Dout_flagP;
    reg flag1,flag2;
    always@(posedge clk) begin
        if(rst) begin flag1 <= 0; flag2 <= 0; end
        else  begin flag1 <= (Din_24[23:0] == 0) & (Din_25[24:0] == 0);
                    flag2 <= (Din_24[47:24] == 0) & (Din_25[49:25] == 0); end
    end 
    
    always@(posedge clk) begin
        if(rst) addr_oP <= 0;
        else if(flag2 & ~Chash_addr[1]) addr_oP <= {2'b11,Chash_addr[9:2]};
        else if(flag1 & Chash_addr[1])  addr_oP <= {2'b11,Chash_addr[9:2]};
        else  addr_oP <= 0;
    end
    
    always@(posedge clk) begin
        if(rst) begin Dout_24P <= 0; Dout_25P <= 0;end
        else if(flag2 & ~Chash_addr[1])begin
             if(Chash_addr[0]) begin Dout_24P <= {24'hfbefc0,Din_24[23:0]}; Dout_25P <= {25'h1dfbf8, Din_25[24:0]};end
             else  begin Dout_24P <= {24'h1041,Din_24[23:0]}; Dout_25P <= {25'h1de0409, Din_25[24:0]};end
            end
        else if(flag1 & Chash_addr[1])  begin
             if(Chash_addr[0]) begin Dout_24P <= {Din_24[47:24],24'hfbefc0}; Dout_25P <= {Din_25[49:25], 25'h1dfbf8};end
             else  begin Dout_24P <= {Din_24[47:24],24'h1041}; Dout_25P <= {Din_25[49:25],25'h1de0409};end
            end
        else  begin Dout_24P <= 0; Dout_25P <= 0;end
    end
    
 
    reg Dout_flagP_d;
    always@(posedge clk) begin
         Dout_flagP <= in_flag;
         Dout_flagP_d <= Dout_flagP;
    end
    always@(posedge clk) begin
        if(rst) begin
            addr_o <= 0;
            Dout_24 <= 0;
            Dout_25 <= 0;
            Dout_flag <=0;
         end
        else begin
            addr_o <= addr_oP;
            Dout_24 <= Dout_24P;
            Dout_25 <= Dout_25P;
            Dout_flag <=(flag2 & ~Chash_addr[1] | flag1 & Chash_addr[1])?Dout_flagP_d:0;
         end
    end
    
    
endmodule
