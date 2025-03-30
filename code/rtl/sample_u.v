`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/18 13:53:26
// Design Name: 
// Module Name: sample_u
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


module sample_u(
    input clk,
    input rst,
    input [5:0]u,
    input u_mod,
    input [47:0]Din,
    input Din_flag,
    
    output reg [24:0] Dout_3_24,Dout_4_24,
    output reg Dout_flag_24,Dout_flag_25
    );
    parameter q1 = 24'd16515073;
    //parameter q2 = 25'd33292289;
    parameter q = 49'h1f41002f80001;
    // stage 1

    reg [40:0] mask ;
    reg [40:0] mid ;
    always@(posedge clk) mask <= (1'b1<<u) - 1;
    always@(posedge clk) mid <= 1'b1<<(u-1);
    reg [7:0] Dout_3_d,Dout_4_d;
    always@(posedge clk)begin
        if(rst) begin
            Dout_3_d <=0 ;
            Dout_4_d <=0 ;
        end
        else if(~u_mod & Din_flag) begin
            Dout_4_d <= ((Din[7:0] & (mask[7:0])) ^ mid[7:0]) - mid[7:0] ;
            Dout_3_d <= ((Din[15:8] & (mask[7:0])) ^ mid[7:0]) - mid[7:0] ;
        end  
        else begin
            Dout_3_d <=0 ;
            Dout_4_d <=0 ;
        end   
    end
    reg [48:0] Dout_1_d;
    wire [40:0] Din_little = {Din[7:0],Din[15:8],Din[23:16],Din[31:24],Din[39:32],Din[47:40]};
    always@(posedge clk )begin
        if(rst) 
            Dout_1_d <=0 ;
        else if(u_mod & Din_flag) 
            Dout_1_d <= ((Din_little[40:0] & (mask[40:0])) ^ mid[40:0]) - mid[40:0] ;  
        else  
            Dout_1_d <=0 ;
    end
    

    reg Din_flag_d,Din_flag_d1;
    always@(posedge clk) Din_flag_d <= Din_flag;
    always@(posedge clk) Din_flag_d1 <= Din_flag_d;
    // satge 2
    always@(posedge clk)begin
        if(rst) begin
            Dout_3_24 <=0 ;
            Dout_4_24 <=0 ;
        end
        else if(Din_flag_d & ~u_mod) begin
			Dout_3_24 <= {{16{Dout_3_d[7]}},Dout_3_d} + ({24{Dout_3_d[7]}} & q1);
			Dout_4_24 <= {{16{Dout_4_d[7]}},Dout_4_d} + ({24{Dout_4_d[7]}} & q1);
        end
        else if(Din_flag_d & u_mod) begin
            {Dout_3_24[23:0],Dout_4_24} <= Dout_1_d + ({49{Dout_1_d[41]}} & q) ;
        end 
        else begin
            Dout_3_24 <=0 ;
            Dout_4_24 <=0 ;
        end       
    end 
         
    always@(posedge clk )begin
        if(rst) begin
            Dout_flag_24 <= 0;
        end
        else if(Din_flag_d)   Dout_flag_24 <= Din_flag_d;  
        else Dout_flag_24 <= 0; 
    end
    
    always@(posedge clk)begin
        if(rst) begin
            Dout_flag_25 <= 0;
        end
        else if(Din_flag_d1)   Dout_flag_25 <= Dout_flag_24;  
        else Dout_flag_25 <= 0; 
    end
endmodule
