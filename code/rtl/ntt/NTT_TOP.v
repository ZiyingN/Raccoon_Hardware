`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/12 14:04:15
// Design Name: 
// Module Name: NTT_TOP
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


module NTT_TOP(
    input clk, rst,
    input [2:0] mod,
    input in_flag,intt_start,Add_sub, 
    input [24:0] ntt_in1,ntt_in2,ntt_in3,ntt_in4,ntt_add1,ntt_add2,
    
    output reg [24:0] ntt_out1,ntt_out2,ntt_out3,ntt_out4, 
    output reg ntt_out_flag,
    output reg input_done,
    output reg output_rst
    
    );
    // bu
    reg [24:0] BU_in1, BU_in2, BU_in3, BU_in4;
    reg [24:0] BU_zeta1, BU_zeta2;
    reg BU_en;
    wire [24:0] BU_out1, BU_out2, BU_out3, BU_out4;
    wire BU_out_flag;
    // rom
    reg [8:0] rom_cnt;
    wire [47 : 0] rom_dout_24;
    wire [49 : 0] rom_dout_25;
    // fifo
    reg [49:0] fifo1_din, fifo2_din, fifo3_din;
    reg  fifo1_wr, fifo2_wr, fifo3_wr, fifo1_rd, fifo2_rd, fifo3_rd;
    wire [49:0] fifo1_dout, fifo2_dout, fifo3_dout;
    wire fifo1_full,fifo1_empty, fifo1_almost_empty;
    wire fifo2_full,fifo2_empty, fifo2_almost_empty;
    wire fifo3_full,fifo3_empty, fifo3_almost_empty;
    reg fifo3_rd_d, fifo3_rd_d1;
    
    reg [3:0] state_o;
    // -------------------------- process  ----------------------------//
    // overall
    reg [3:0] state;
    reg start_flag;
    reg [6:0]system_cnt;
    always@(posedge clk) begin
        if(rst) state <= 0;
        else if(system_cnt == 126) state <= state + 1;
    end

    always@(posedge clk ) 
        if(rst) start_flag <= 0;
        else if(in_flag) start_flag <= 1;
        
    always@(posedge clk ) begin
        if(rst) system_cnt <= 0;
        else if(start_flag) system_cnt <= system_cnt + 1;
    end
//    reg  in_flag_d;
//    always@(posedge clk) begin
//        in_flag_d <= in_flag;
//    end
    /////////////////////////////////////////////  BF  //////////////////////////////////////////////////////////////////
    //   mod[1:0] - 00  ntt
    //   mod[1:0] - 01  intt
    //   mod[1:0] - 10  pwm
    //   mod[1:0] - 11  restruct
    always@(posedge clk ) begin
        if(rst) begin
            BU_in1 <= 0; BU_in2 <= 0;
            BU_in3 <= 0; BU_in4 <= 0;
            BU_en <= 0;
        end
        else case(mod[1:0])
            2'b00:begin
                case(state)
                    4'b0000:if(in_flag) begin 
                            BU_in1 <= ntt_in1; BU_in2 <= ntt_in2;
                            BU_in3 <= ntt_in3; BU_in4 <= ntt_in4;
                            BU_en <= in_flag;
                            end
                            else begin
                            BU_in1 <= 0; BU_in2 <= 0;
                            BU_in3 <= 0; BU_in4 <= 0;
                            BU_en <= 0;    
                            end
                    4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111:if(fifo3_rd_d) begin 
                            BU_in1 <= fifo1_dout[49:25]; BU_in2 <= fifo3_dout[49:25];
                            BU_in3 <= fifo1_dout[24:0]; BU_in4 <= fifo3_dout[24:0];
                            BU_en <= 1;
                            end
                            else begin
                            BU_in1 <= fifo2_dout[49:25]; BU_in2 <= fifo1_dout[49:25] ;
                            BU_in3 <= fifo2_dout[24:0]; BU_in4 <= fifo1_dout[24:0];
                            BU_en <= 1;    
                            end 
                    4'b1000:begin
                            BU_in1 <= fifo1_dout[49:25]; BU_in2 <= fifo2_dout[49:25];
                            BU_in3 <= fifo1_dout[24:0]; BU_in4 <= fifo2_dout[24:0];
                            BU_en <= 1;    
                            end
                    4'b1001:BU_en <= 0;            
                endcase
            end
            2'b01:case(state)
                4'b0000:if(in_flag) begin 
                            BU_in1 <= ntt_in1; BU_in2 <= ntt_in2;
                            BU_in3 <= ntt_in3; BU_in4 <= ntt_in4;
                            BU_en <= in_flag;
                            end
                            else begin
                            BU_in1 <= 0; BU_in2 <= 0;
                            BU_in3 <= 0; BU_in4 <= 0;
                            BU_en <= 0;    
                            end
                4'b0001:begin 
                            BU_in1 <= fifo1_dout[49:25]; BU_in2 <= fifo2_dout[49:25] ;
                            BU_in3 <= fifo1_dout[24:0]; BU_in4 <= fifo2_dout[24:0];
                            BU_en <= 1;
                            end
                4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000:if(fifo3_rd_d) begin 
                            BU_in1 <= fifo1_dout[49:25]; BU_in2 <= fifo3_dout[49:25];
                            BU_in3 <= fifo1_dout[24:0]; BU_in4 <= fifo3_dout[24:0];
                            BU_en <= 1;
                            end
                            else begin
                            BU_in1 <= fifo2_dout[49:25]; BU_in2 <= fifo1_dout[49:25] ;
                            BU_in3 <= fifo2_dout[24:0]; BU_in4 <= fifo1_dout[24:0];
                            BU_en <= 1;    
                            end 
                 4'b1001:BU_en <= 0;    
                  endcase
            
            
            2'b10:if(in_flag) begin // restruct/pwm 2,4,zeta1/2
                    BU_in1 <= ntt_add1;
                    BU_in2 <= ntt_in2;
                    BU_in3 <= ntt_add2;
                    BU_in4 <= ntt_in4;
                    BU_en <= in_flag;
                end
                else begin
                    BU_in2 <= 0;
                    BU_in4 <= 0;
                    BU_en <= 0;
                end
           2'b11:if(in_flag) begin // restruct/pwm 2,4,zeta1/2
                    BU_in1 <= ntt_in1; // 24
                    BU_in2 <= ntt_in2;
                    BU_in3 <= ntt_in3; // 25
                    BU_in4 <= ntt_in4;
                    BU_en <= in_flag;
                end
                else begin
                    BU_in2 <= 0;
                    BU_in4 <= 0;
                    BU_en <= 0;
                end
        endcase
    end
    //---------------------------   zeta  -------------------------//
    
    reg zeta_i_flag;
    wire [6:0] ron_cnt_offset;
 

    always@(posedge clk ) begin
        if(rst) rom_cnt <= mod[1:0]==1?255:0;
        else if(intt_start & mod[1:0] == 1) rom_cnt <= 255;
        else if(mod[1:0] == 0) begin case(state)
            4'b0000,4'b0001: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
            4'b0010: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt == 61) rom_cnt <= rom_cnt + 1;  
            4'b0011: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt[4:0] == 29) rom_cnt <= rom_cnt + 1;  
            4'b0100: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt[3:0] == 13) rom_cnt <= rom_cnt + 1;  
            4'b0101: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt[2:0] == 5) rom_cnt <= rom_cnt + 1;         
            4'b0110: if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt[1:0] == 1) rom_cnt <= rom_cnt + 1;                          
            4'b0111: if(system_cnt == 125 | system_cnt == 126) rom_cnt <= rom_cnt + 1;  
                      else if(system_cnt[0] == 1) rom_cnt <= rom_cnt + 1;   
            4'b1000:if(system_cnt == 125) rom_cnt <= rom_cnt + 1;  else rom_cnt <= rom_cnt + 1;                                                                      
            endcase    
        end
        else if(mod[1:0] == 1) begin case(state_o)
            4'b0000:  rom_cnt <= rom_cnt - 1;      
            4'b0001: if(system_cnt[0] == 1) rom_cnt <= rom_cnt - 1;   
            4'b0010: if(system_cnt[1:0] == 1) rom_cnt <= rom_cnt - 1;   
            4'b0011: if(system_cnt[2:0] == 5) rom_cnt <= rom_cnt - 1;    
            4'b0100: if(system_cnt[3:0] == 13) rom_cnt <= rom_cnt - 1;      
            4'b0101: if(system_cnt[4:0] == 29) rom_cnt <= rom_cnt - 1;  
            4'b0110: if(system_cnt[5:0] == 61) rom_cnt <= rom_cnt - 1; 
            4'b0111,4'b1000: if(system_cnt[6:0] == 125) rom_cnt <= rom_cnt - 1;
            endcase
        end
    end
    reg zeta_i_flag_d;
    always@(posedge clk)  zeta_i_flag_d <= ~zeta_i_flag;
 
    always@(posedge clk ) begin
        if(rst) begin BU_zeta1 <= 0;  BU_zeta2 <= 0; end
        else case(mod[1:0]) 
            2'b00:begin 
                case(state)
                    4'b0000: begin BU_zeta1 <= mod[2]? rom_dout_24[23:0] : rom_dout_25[24:0];  BU_zeta2 <= mod[2]?rom_dout_24[23:0]: rom_dout_25[24:0];  end
                    4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111: 
                        begin BU_zeta1 <= fifo3_rd_d?(mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25]):(mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0]);  
                              BU_zeta2 <= fifo3_rd_d?(mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25]):(mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0]);  end //,4'b0010
                    4'b1000:begin BU_zeta1 <= mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25];  BU_zeta2 <= mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0];  end
                endcase
              end
           2'b01:begin 
                case(state)
                    4'b0000: begin BU_zeta1 <= mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0];  BU_zeta2 <= mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25];  end
                    4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111: begin BU_zeta1 <= zeta_i_flag_d?(mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25]):(mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0]);  
                            BU_zeta2 <= zeta_i_flag_d?(mod[2]?rom_dout_24[47:24]:rom_dout_25[49:25]):(mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0]); end
                    4'b1000: begin BU_zeta1 <= mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0];  BU_zeta2 <= mod[2]?rom_dout_24[23:0]:rom_dout_25[24:0];  end
                endcase
              end
          2'b10: begin BU_zeta1 <= ntt_in1;  BU_zeta2 <= ntt_in3; end
          2'b11: begin BU_zeta1 <= 0;  BU_zeta2 <= 0; end //begin BU_zeta1 <= 25'd16257024;  BU_zeta2 <= 25'hfff002; end
        endcase
    end

    //    ------------------------ state_Q FIFO_IN  ---------------------------  //
    wire [3:0] state_Q_x,state_Q;
    reg [3:0] state_x_d;
    always@(posedge clk) state_x_d <= state > 0?state_Q_x:0;
    //wire state_Q_x1 = state>0?state_Q_x:0;
    assign state_Q = mod[0]?state_x_d:(state>0?state_Q_x:0);
    reg fifoIn_flag;

    always@(posedge clk ) begin
        if(rst) fifoIn_flag <= 0;
        else if(mod[1:0] == 2'b00) case(state_Q)
            4'b0000:if(system_cnt == 73) fifoIn_flag <= fifoIn_flag + 1;
                   else if(system_cnt == 9) fifoIn_flag <= fifoIn_flag + 1;
            4'b0001:if(system_cnt[4:0] == 9) fifoIn_flag <= fifoIn_flag + 1;
            4'b0010:if(system_cnt[3:0] == 9) fifoIn_flag <= fifoIn_flag + 1;
            4'b0011:if(system_cnt[2:0] == 1) fifoIn_flag <= fifoIn_flag + 1;
            4'b0100:if(system_cnt[1:0] == 1) fifoIn_flag <= fifoIn_flag + 1;
            4'b0101:if(system_cnt[0] == 1) fifoIn_flag <= fifoIn_flag + 1;
            4'b0110:fifoIn_flag <= fifoIn_flag + 1;
        endcase
        else if(mod[1:0] == 2'b01) case(state_Q)
            4'b0000:if(start_flag) fifoIn_flag <= fifoIn_flag + 1;
            4'b0001: fifoIn_flag <= fifoIn_flag + 1;
            4'b0010 : if(system_cnt[0] == 0) fifoIn_flag <= fifoIn_flag + 1;
            4'b0011 : if(system_cnt[1:0] == 2) fifoIn_flag <= fifoIn_flag + 1;
            4'b0100 : if(system_cnt[2:0] == 2) fifoIn_flag <= fifoIn_flag + 1;
            4'b0101 : if(system_cnt[3:0] ==10) fifoIn_flag <= fifoIn_flag + 1;
            4'b0110 : if(system_cnt[4:0] ==10) fifoIn_flag <= fifoIn_flag + 1;
            4'b0111 : if(system_cnt ==74) fifoIn_flag <= fifoIn_flag + 1;
        endcase
    end
    always@(posedge clk ) begin
        if(rst) begin fifo1_din <= 0; fifo2_din <= 0;  fifo3_din <= 0; fifo1_wr <= 0; fifo2_wr <= 0; fifo3_wr <= 0; end
        else if(mod[1:0] == 2'b00 & BU_out_flag) case(state_Q)
            4'b0000,4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110:if(fifoIn_flag) begin fifo1_din <= {BU_out1,BU_out3}; fifo2_din <= {BU_out2,BU_out4};  fifo3_din <= 0; fifo1_wr <= 1; fifo2_wr <= 1; fifo3_wr <= 0; end
                else begin fifo1_din <= {BU_out2,BU_out4}; fifo2_din <= 0;  fifo3_din <= {BU_out1,BU_out3}; fifo1_wr <= 1; fifo2_wr <= 0; fifo3_wr <= 1; end
            4'b0111:begin fifo1_din <= {BU_out1,BU_out2}; fifo2_din <= {BU_out3,BU_out4};fifo1_wr <= 1;  fifo2_wr <= 1; fifo3_wr <= 0; fifo3_din <= 0;end    
            default:begin fifo1_din <= 0; fifo2_din <= 0;  fifo3_din <= 0; fifo1_wr <= 0; fifo2_wr <= 0; fifo3_wr <= 0; end
        endcase
        else if(mod[1:0] == 2'b01 & BU_out_flag) case(state_Q)
            4'b0000:begin fifo1_din <= {BU_out1,BU_out2}; fifo2_din <= {BU_out3,BU_out4};fifo1_wr <= 1;  fifo2_wr <= 1; fifo3_wr <= 0; fifo3_din <= 0;end    
            4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111:if(fifoIn_flag) begin fifo1_din <= {BU_out1,BU_out3}; fifo2_din <= {BU_out2,BU_out4};  fifo3_din <= 0; fifo1_wr <= 1; fifo2_wr <= 1; fifo3_wr <= 0; end
                else begin fifo1_din <= {BU_out2,BU_out4}; fifo2_din <= 0;  fifo3_din <= {BU_out1,BU_out3}; fifo1_wr <= 1; fifo2_wr <= 0; fifo3_wr <= 1; end
            default:begin fifo1_din <= 0; fifo2_din <= 0;  fifo3_din <= 0; fifo1_wr <= 0; fifo2_wr <= 0; fifo3_wr <= 0; end
        endcase
    end
    //    ------------------------ state_Q FIFO_OUT  ---------------------------  //
    
    always@(posedge clk ) begin
        if(rst) state_o <= 0;
        else if(system_cnt == 124 & ~mod[0]) state_o <= state_o + 1; // 29 = 31- read - state
        else if(system_cnt == 124 & mod[0]) state_o <= state_o + 1;
    end
    reg fifoOut_flag; 
    always@(posedge clk) begin
        if(rst) zeta_i_flag <= 0;
        else if(mod[1:0] == 2'b01) case(state_o)
            4'b0001:  zeta_i_flag <= zeta_i_flag + 1;
            4'b0010:  if(system_cnt[0] == 1)zeta_i_flag <= zeta_i_flag + 1;
            4'b0011:  if(system_cnt[1:0] == 1)zeta_i_flag <= zeta_i_flag + 1;
            4'b0100:  if(system_cnt[2:0] == 5)zeta_i_flag <= zeta_i_flag + 1;
            4'b0101:  if(system_cnt[3:0] == 13)zeta_i_flag <= zeta_i_flag + 1;
            4'b0110:  if(system_cnt[4:0] == 29)zeta_i_flag <= zeta_i_flag + 1;
            4'b0111:  if(system_cnt[5:0] == 61)zeta_i_flag <= zeta_i_flag + 1;
        endcase
    end
    always@(posedge clk ) begin
        if(rst) fifoOut_flag <= 0;
 
        else if(mod[1:0] == 2'b00) case(state_o)
            4'b0001:if(system_cnt == 60) fifoOut_flag <= fifoOut_flag + 1;
                    else if(system_cnt == 124) fifoOut_flag <= fifoOut_flag + 1;
            4'b0010:if(system_cnt[4:0] == 28) fifoOut_flag <= fifoOut_flag + 1;
            4'b0011:if(system_cnt[3:0] == 12) fifoOut_flag <= fifoOut_flag + 1;
            4'b0100:if(system_cnt[2:0] == 4) fifoOut_flag <= fifoOut_flag + 1;
            4'b0101:if(system_cnt[1:0] == 0) fifoOut_flag <= fifoOut_flag + 1;
            4'b0110:if(system_cnt[0] == 0) fifoOut_flag <= fifoOut_flag + 1;
            4'b0111:  fifoOut_flag <= fifoOut_flag + 1;
        endcase
        else if(mod[1:0] == 2'b01) case(state_o)
//            4'b0000:  if(system_cnt == 124) fifoOut_flag <= fifoOut_flag + 1;
            4'b0010:  fifoOut_flag <= fifoOut_flag + 1;
            4'b0011:if(system_cnt[0] == 0) fifoOut_flag <= fifoOut_flag + 1;
            4'b0100:if(system_cnt[1:0] == 0)  fifoOut_flag <= fifoOut_flag + 1;
            4'b0101:if(system_cnt[2:0] == 4)  fifoOut_flag <= fifoOut_flag + 1;
            4'b0110:if(system_cnt[3:0] == 12) fifoOut_flag <= fifoOut_flag + 1;
            4'b0111:if(system_cnt[4:0] == 28) fifoOut_flag <= fifoOut_flag + 1;
            4'b1000:if(system_cnt[5:0] == 60) fifoOut_flag <= fifoOut_flag + 1;
        endcase
    end
    always@(posedge clk ) begin
        if(rst) begin fifo1_rd <= 0; fifo2_rd <= 0; fifo3_rd <= 0; end
        else if(mod[1:0] == 2'b00) case(state_o)
        4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111:if(~fifoOut_flag) begin fifo1_rd <= 1; fifo2_rd <= 0; fifo3_rd <= 1; end//,4'b0010
              else begin fifo1_rd <= 1; fifo2_rd <= 1; fifo3_rd <= 0; end
        4'b1000:begin fifo1_rd <= 1; fifo2_rd <= 1; fifo3_rd <= 0; end
        endcase
        else if(mod[1:0] == 2'b01) case(state_o)
            4'b0001:begin fifo1_rd <= 1; fifo2_rd <= 1; fifo3_rd <= 0; end
            4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111,4'b1000:if(~fifoOut_flag) begin fifo1_rd <= 1; fifo2_rd <= 0; fifo3_rd <= 1; end//,4'b0010
              else begin fifo1_rd <= 1; fifo2_rd <= 1; fifo3_rd <= 0; end
        endcase
    end
    always@(posedge clk) fifo3_rd_d <= fifo3_rd;
    // ---------------------------- out)test  -------------------------------//
    always@(posedge clk ) begin
        if(rst) begin
            ntt_out1 <= 0; ntt_out2 <= 0; ntt_out3 <= 0; ntt_out4<=0;
            ntt_out_flag <= 0;
        end
        else case(mod[1:0])
            2'b00,2'b01:if(BU_out_flag & (state_Q == 8)) begin
            ntt_out1 <= BU_out1; ntt_out2 <= BU_out2; ntt_out3 <= BU_out3; ntt_out4<=BU_out4;
            ntt_out_flag <= BU_out_flag;
            end
            else begin
            ntt_out1 <= 0; ntt_out2 <= 0; ntt_out3 <= 0; ntt_out4<=0;
            ntt_out_flag <= 0;
            end       
            2'b10,2'b11:if(BU_out_flag) begin
            ntt_out1 <= BU_out1; ntt_out2 <= BU_out2; ntt_out3 <= BU_out3; ntt_out4<=BU_out4;
            ntt_out_flag <= BU_out_flag;
            end
            else begin
            ntt_out1 <= 0; ntt_out2 <= 0; ntt_out3 <= 0; ntt_out4<=0;
            ntt_out_flag <= 0;
        end
        endcase
    end
    always@(posedge clk )  
        if(rst)  
            input_done <= 0;
        else case(mod[1:0])
            2'b00,2'b01: if(state == 1 & system_cnt == 127) 
            input_done <= 1;
            else input_done <= 0;
            default: input_done <= 0;
        endcase
         
    always@(posedge clk)  
        if(rst)  
            output_rst <= 0;
        else  case(mod[1:0])
             2'b00:if(state_Q == 8 & system_cnt == 9)     
                        output_rst <= 1;
                        else  output_rst <= 0;
             2'b01:if(state_Q == 8 & system_cnt == 10)     
                        output_rst <= 1;
                        else  output_rst <= 0;
             2'b10:if(~BU_out_flag & ntt_out_flag)     
                        output_rst <= 1;
                        else  output_rst <= 0;
             2'b11:if(~BU_out_flag & ntt_out_flag)     
                        output_rst <= 1;
                        else  output_rst <= 0;
        endcase
    assign output_fw_rst = BU_out_flag;
    //---------------------------   modules  -------------------------//
    NTT_BU BU(.clk(clk), .rst(rst),.mod(mod),.ntt_in1(BU_in1), .ntt_in2(BU_in2), .ntt_in3(BU_in3), .ntt_in4(BU_in4),.zeta1(BU_zeta1), .zeta2(BU_zeta2),
	.en(BU_en),.ntt_out1(BU_out1), .ntt_out2(BU_out2), .ntt_out3(BU_out3), .ntt_out4(BU_out4),.ntt_out_flag(BU_out_flag),.Add_sub(Add_sub));
	
	dist_mem_gen_ntt_24 ROM24 (.a(rom_cnt),.clk(clk), .qspo(rom_dout_24));
	dist_mem_gen_ntt_25 ROM25 (.a(rom_cnt),.clk(clk), .qspo(rom_dout_25));
	
    fifo_generator_ntt_1 FIFO1 (.clk(clk),.srst(rst),.din(fifo1_din),.wr_en(fifo1_wr), .rd_en(fifo1_rd),.dout(fifo1_dout),    // output wire [49 : 0] dout
        .full(fifo1_full),.empty(fifo1_empty),.almost_empty(fifo1_almost_empty));
    fifo_generator_ntt_1 FIFO2 (.clk(clk),.srst(rst),.din(fifo2_din),.wr_en(fifo2_wr), .rd_en(fifo2_rd),.dout(fifo2_dout),    // output wire [49 : 0] dout
        .full(fifo2_full),.empty(fifo2_empty),.almost_empty(fifo2_almost_empty));	
    fifo_generator_ntt_2 FIFO3 (.clk(clk),.srst(rst),.din(fifo3_din),.wr_en(fifo3_wr), .rd_en(fifo3_rd),.dout(fifo3_dout),    // output wire [49 : 0] dout
        .full(fifo3_full),.empty(fifo3_empty),.almost_empty(fifo3_almost_empty));
    c_shift_ram_stateQ state_shift (.D(state),.CLK(clk),.Q(state_Q_x));
    
    
endmodule
