`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/22 13:33:09
// Design Name: 
// Module Name: LFSR
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


module LFSR_rng_64(
    input clk, rst,en,
    input [127:0] din,
    output [63:0] dout,
    output reg rng_flag 
    );
    reg [63:0] state,state1;
    wire [63:0] next1,next2;
    always@(posedge clk) begin
        if(rst) begin state <= 0; 
                      state1 <= 0;
        end
        else begin
                state <= next1;
                state1 <= next2;
            end
    end
    
    always@(posedge clk ) begin
        if(rst) rng_flag <= 0;
        else if(en) 
            rng_flag <= 1;
    end

    assign next1 = en?((din[127:64] << 1)|(din[127:64] >> 63)) ^ (din[127:64] >> 62):((rng_flag)?((state1 << 1)|(state >> 63)) ^ (state1 >> 62):0); 
    assign next2 = en?((next1 ^ din[63:  0] ) & 64'h7FFFFFFFFFFFFFFF):(rng_flag?(next1 ^ state ) & 64'h7FFFFFFFFFFFFFFF:0); 
     
    assign dout = state;
endmodule
