`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/17 15:05:47
// Design Name: 
// Module Name: Raccoon_top
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


module Raccoon_top(
    input clk,rst,start,
    input [1:0]sec_level,
    input [1:0] d,

    // test
//    output reg [63:0] test1,
//    output reg test_flag,
    
    output reg [63:0] Server_out,
    output reg vk_flag, sign_h_flag, sign_z_flag,Check_true
    );
    reg [3:0]test_cnt;
//  clk_wiz_0 clk2
//   (
//    // Clock out ports
//    .clk_out1(clk),     // output clk_out1
//    // Status and control signals

//   // Clock in ports
//    .clk_in1(clk1));      // input clk_in1
    //---------------------------

    reg [3:0] rep;
    always@(posedge clk) begin
        if(rst) rep <= 0;
        else if(d == 1) rep <= 8;
        else if(d == 2) rep <= 4;
    end
    
    parameter q_24 =  24'd16515073;
    parameter q_25 = 25'd33292289;
    parameter NULL1 = 10'd7;
    parameter StageS2A = 10'd8;
    parameter NULL = 10'd9;
    parameter Control = 10'd10; 
    parameter Rng_1 = 10'd11;
    parameter Rng_2 = 10'd12;
    parameter Rng_3 = 10'd13;
    parameter Rng_4 = 10'd14;
    parameter Rng_5 = 10'd15;
    parameter Rng_6 = 10'd16;
    parameter Rng_7 = 10'd17;
    parameter Rng_8 = 10'd18;
    parameter Rng_9 = 10'd18;
    parameter Rng_10= 10'd20;
    
    parameter Expand_A_1 = 10'd21; 
    parameter Expand_A_2 = 10'd22;
    parameter Expand_A_3 = 10'd23;
    parameter Expand_A_4 = 10'd24;
    parameter Expand_A_5 = 10'd25;
    parameter Expand_A_E1 = 10'd26;
    parameter Expand_A_E2 = 10'd27;
    parameter Expand_A_6 = 10'd28;
    parameter Expand_A_7 = 10'd29;
    parameter Expand_A_8 = 10'd30;
    
    parameter Expand_A_9  = 10'd31;
    parameter Expand_A_10 = 10'd32;
    parameter Expand_A_11 = 10'd33;
    parameter Expand_A_12 = 10'd34;
    parameter Expand_A_13 = 10'd35;
    parameter Expand_A_14 = 10'd36;    
    parameter Expand_A_15 = 10'd37;
    parameter Expand_A_16 = 10'd38;
    parameter Expand_A_17 = 10'd39;
    
    parameter Expand_A_X1 = 10'd40;
    parameter Expand_A_X2 = 10'd41;
    parameter Expand_A_X3 = 10'd42;
    parameter Expand_A_X4 = 10'd43;
    parameter Expand_A_M1 = 10'd44;
    parameter Expand_A_M2 = 10'd45;
    
    parameter Expand_A_Y1 = 10'd102;
    parameter Expand_A_Y2 = 10'd103;    
    parameter Expand_A_Y3 = 10'd104;
    parameter Expand_A_Y4 = 10'd105;       
    
    parameter KEY2SIGN = 10'd46; 
    
    parameter C_hash_1  = 10'd48;
	parameter C_hash_2  = 10'd49;
	parameter C_hash_3  = 10'd50;
	parameter C_hash_4  = 10'd51;
	parameter C_hash_5  = 10'd52;
	parameter C_hash_6  = 10'd53;
	parameter C_hash_7  = 10'd54;
	parameter C_hash_8  = 10'd55;
	parameter C_hash_9  = 10'd56;
	parameter C_hash_10 = 10'd57;
	parameter C_hash_11 = 10'd58;
	parameter C_hash_12 = 10'd59;
	parameter C_hash_13 = 10'd60;
	parameter C_hash_14 = 10'd61;
	parameter C_hash_15 = 10'd62;
	parameter C_hash_16 = 10'd63;
	parameter C_hash_17 = 10'd64;
	parameter C_hash_18 = 10'd65;
	parameter C_hash_19 = 10'd66;
	parameter C_hash_20 = 10'd67;
	parameter C_hash_21 = 10'd68;
	parameter C_hash_22 = 10'd69;
	parameter C_hash_23 = 10'd70;
	parameter C_hash_24 = 10'd71;
	parameter C_hash_25 = 10'd72;
	parameter C_hash_26 = 10'd73;
	parameter C_hash_27 = 10'd74;
	parameter C_hash_28 = 10'd75;
	parameter C_hash_29 = 10'd76;
	parameter C_hash_30 = 10'd77;
	parameter C_hash_31 = 10'd78;
    
    parameter C_poly_1 = 10'd81;
    parameter C_poly_2 = 10'd82;
    parameter C_poly_3 = 10'd83;
    parameter C_poly_4 = 10'd84;
    parameter C_poly_5 = 10'd85;
    parameter C_poly_6 = 10'd86;
    parameter C_poly_7 = 10'd87;
    parameter C_poly_8 = 10'd88;
    parameter C_poly_9 = 10'd89;
    parameter C_poly_10= 10'd90;
    parameter C_poly_11= 10'd91;
    parameter C_poly_12= 10'd92;
    parameter C_poly_13= 10'd93;
    parameter C_poly_14= 10'd94;
    parameter C_poly_15= 10'd95;
    parameter C_poly_16= 10'd96;
    parameter C_poly_17= 10'd97;
    parameter C_poly_18= 10'd98;
    parameter C_poly_19= 10'd99;
    parameter C_poly_20= 10'd100;
    parameter C_poly_21= 10'd101;
    
    reg [48:0] midq = 48'd274912291586048;
    reg [1:0] Boo_h ;
    reg [48:0] Boo ;
    reg [35:0] B22 ;
    reg [3:0]ell,k;
    reg [7:0]w,w_d;
    reg [7:0]w_cnt,w_cnt_d;
    reg [5:0] C_hash_times;
    reg [5:0] C_hash_cnt;
    reg [3:0] C_hash_final;
    reg Chash_flag_d;
    reg [3:0] chash_len;reg [4:0] Hash_len;
    always @(posedge clk) begin
	   if(rst) begin 
		  Boo_h <= 0; Boo <= 0; B22 <= 0;  ell <= 0; k <= 0;  w <= 0; C_hash_times <= 0; C_hash_final <= 0; chash_len <= 0; end
	   else if(sec_level == 1) begin 
		  Boo_h <= 2; Boo <= 49'd41954689765971; B22 <= 36'd14656575897; ell <= 4; k <= 5; w <= 19; w_d <= 23; C_hash_times <= 19; C_hash_final <= 2; chash_len <= 4; end
	   else if(sec_level == 2) begin                                     
          Boo_h <= 3; Boo <= 49'd47419426657048; B22 <= 36'd24964497408; ell <= 5; k <= 7; w <= 31; w_d <= 37; C_hash_times <= 26; C_hash_final <= 13;chash_len <= 6; end
	   else if(sec_level == 3) begin                                     
          Boo_h <= 3; Boo <= 49'd50958538642039; B22 <= 36'd38439957299; ell <= 7; k <= 9; w <= 44; w_d <= 54; C_hash_times <= 34; C_hash_final <= 7; chash_len <= 8;end          
    end
    
    wire [10:0] Chash2_addr_o,Chash1_addr_o;
    wire [47:0] Chash2_Dout_24,Chash1_Dout_24;
    wire [49:0] Chash2_Dout_25,Chash1_Dout_25;
    wire Chash2_Dout_flag,Chash1_Dout_flag;
    wire [63:0] hash_in_chang,hash_out_chang;
    // Keccak1600
    reg hash_init,hash_go,hash_squeeze,hash_absorb,hash_extend,hash_rst;
    reg [63:0]hash_in;
    wire [63:0]hash_result;
    wire hash_done;wire shake_out_flag;
    //seed
    reg [255:0] vk_seed,s_seed;
    reg [511:0] mu, sign_seed;
    // counters
    reg [6:0]keccak_cnt, keccakOut_cnt;
    reg [9:0] state, next_state;
    reg [5:0] d_cnt;
    reg [4:0] rep_cnt;
    reg [3:0] ells_cnt,ells_cnt1;
    reg [5:0] Hash_cnt;
    reg [2:0] sample_cnt;  
    reg [3:0] kA_cnt,ellA_cnt,ell_cnt;
    reg [3:0] lane_cnt;
    //bram_state
    reg [6:0] bram_state,bram_next_state;
    // rng
    reg [3:0]krng_cnt;
    reg rng_refresh_flag;
    reg rng_flag,rng_done;
    reg [8:0] rng_cnt;
    reg rng_en;
    reg [127:0] rng_din;
    wire [63:0] rng_dout;
    wire rng_in_flag;
    // sample
	reg sample_din_flag;
	reg [1:0] sample_mod;
	reg [63:0] sample_din;
	reg [5:0] sample_u;
	wire [23: 0] sample_D_24_1,sample_D_24_2;
	wire [24: 0] sample_D_25_1,sample_D_25_2;
	wire sampleA_flag, sampleU_flag, sampleC_flag,sample_rst_o;
	reg sampleU_flag_d1,sampleU_flag_d;
	reg [23:0] sample_D_24_1_d, sample_D_24_1_d1;
	reg [23:0] sample_D_24_2_d, sample_D_24_2_d1;
	reg sample_sign1, sample_sign2, sample_sign1_d,sample_sign2_d;
    // poly_add
	reg add_24_flag_i, add_24_sign_i;
	reg [47:0] add_24_din1, add_24_din2;
	wire [47:0] add_24_dout;
	wire add_24_flag_o, add_24_sign_o,add_24_out_rst_o;
	reg sub_24_flag_i;
	reg [49:0] sub_24_din1, sub_24_din2;
	wire [49:0] sub_24_dout;
	wire sub_24_flag_o;
	reg add_25_flag_i,add_25_mod;
	reg [49:0] add_25_din1, add_25_din2;
	wire [49:0] add_25_dout;
	wire add_25_flag_o,add_25_out_rst_o;
	
	reg sub_25_flag_i;
	reg [49:0] sub_25_din1, sub_25_din2;
	wire [49:0] sub_25_dout;
	wire sub_25_flag_o;
    // ntt
    reg [2:0] ntt_mod;
    reg ntt_inflag;
    reg [24:0]ntt_in1,ntt_in2,ntt_in3,ntt_in4,ntt_add1,ntt_add2;
    wire [24:0]ntt_out1,ntt_out2,ntt_out3,ntt_out4;
    wire ntt_out_flag, ntt_input_done,ntt_output_rst;
    reg ntt_rst,ntt_in_flag;     // ntt_state
    reg [6:0]ntt_state,next_ntt_state;
    reg [9:0] ntt_cnt;
    reg intt_start;
    // bram_S
    reg bram_s_24_ena,bram_s_24_wra,bram_s_24_enb,bram_s_24_wrb;
    reg [11:0] bram_s_24_addra,bram_s_24_addrb;
    reg [49:0] bram_s_24_dina,bram_s_24_dinb;
    wire [49:0] bram_s_24_douta,bram_s_24_doutb;
    
    reg bram_s_25_ena,bram_s_25_wra,bram_s_25_enb,bram_s_25_wrb;
    reg [11:0] bram_s_25_addra,bram_s_25_addrb;
    reg [49:0] bram_s_25_dina,bram_s_25_dinb;
    wire [49:0] bram_s_25_douta,bram_s_25_doutb;
    // bram_r
    reg bram_r_24_ena,bram_r_24_wra,bram_r_24_enb,bram_r_24_wrb;
    reg [11:0] bram_r_24_addra,bram_r_24_addrb;
    reg [49:0] bram_r_24_dina,bram_r_24_dinb;
    wire [49:0] bram_r_24_douta,bram_r_24_doutb;
    
    reg bram_r_25_ena,bram_r_25_wra,bram_r_25_enb,bram_r_25_wrb;
    reg [11:0] bram_r_25_addra,bram_r_25_addrb;
    reg [49:0] bram_r_25_dina,bram_r_25_dinb;
    wire [49:0] bram_r_25_douta,bram_r_25_doutb;
    // bram_a
    reg bram_a_24_ena,bram_a_24_wra,bram_a_24_enb,bram_a_24_wrb;
    reg [9:0] bram_a_24_addra,bram_a_24_addrb;
    reg [49:0] bram_a_24_dina,bram_a_24_dinb;
    wire [49:0] bram_a_24_douta,bram_a_24_doutb;
    reg bram_a_25_ena,bram_a_25_wra,bram_a_25_enb,bram_a_25_wrb;
    reg [9:0] bram_a_25_addra,bram_a_25_addrb;
    reg [49:0] bram_a_25_dina,bram_a_25_dinb;
    wire [49:0] bram_a_25_douta,bram_a_25_doutb;
//    // bram_ts
	reg bram_ts_ena,bram_ts_wra,bram_ts_enb,bram_ts_wrb;
    reg [10:0] bram_ts_addra,bram_ts_addrb;
    reg [55:0] bram_ts_dina,bram_ts_dinb;
    wire [55:0] bram_ts_douta,bram_ts_doutb;
    // Cob
    reg Cob_inflag,ColA_rst;
    reg [23:0] Cob_in_24;
    reg [24:0] Cob_in_25;
    wire [47:0] Cob_out_24;
    wire [49:0] Cob_out_25;
    wire Cob_outflag;
	// poly_shift
    wire [43:0] ConMulti_25;
    wire [47:0] ConMulti_24;
    wire ConMulti_flag_o;
    wire [23:0]Shift_in1;
    wire [24:0]Shift_in2;
    wire Shift_flag;
    wire [6:0] Shift_dout;
    wire Shift_dout_flag;reg ConMulti_flag_o_d,ConMulti_flag_o_d1,ConMulti_flag_o_d2,ConMulti_flag_o_d3;
    reg Poly_shift_rst_d;reg ntt_cnt_d, ntt_cnt_d1;
    reg shift_mod;
    // signal delay
    reg rng_in_flag_d,rng_in_flag_d1,ntt_in_flag_d,ntt_in_flag_d1;wire masking_order_Q;
    reg masking_order_d;reg [47:0] rng_d; reg [49:0] rng_d1;
    reg sample_rst_o_d,sample_rst_o_d1,sample_rst_o_d2,sample_rst_o_d3,ntt_output_rst_d4;
    reg sample_rst_o_d4,sample_rst_o_d5,sample_rst_o_d6,sample_rst_o_d7;
    reg Cob_outflag_d,Cob_outflag_d1,Cob_outflag_d2;
    reg [47:0] Cob_out_24_d,Cob_out_24_d2,Cob_out_24_d1;
    reg [49:0] Cob_out_25_d,Cob_out_25_d1,Cob_out_25_d2;
    reg Chash_addr_flag_d, Chash_addr_flag_d1,add_24_out_rst_o_d;
    // check
    reg [48:0] check_z;
    reg check_z_flag;
    reg finial_lane_flag;
    // flags
    wire masking_flag;
    reg Hash_A_flag, Single_s_flag,Single_A_flag,Expand_A_wait;
    reg KEYGEN_SIGN;
    reg [19:0]Control_reg1;
    reg [4:0]stage; 
    reg ntt_output_rst_d,ntt_output_rst_d1,ntt_output_rst_d2,ntt_output_rst_d3;
    reg stage2_f;reg lane_flag;reg keyGen_flag,sample_bram_start;reg Chash_flag;
    reg z_flag, finial_A_flag;
    wire sk_ek_flag = stage == 0;
    always @(posedge clk ) begin
	   if(rst)
		  state <= 10'h0;
	   else
		  state <= next_state;
    end
    assign masking_flag = d != 1; // ==1 masking!
    always@(*)begin
        case(state)
            10'd0:      if(start)               next_state = 10'd1; else next_state = state;
            10'd1:      if(~masking_flag)       next_state = Control;
                            else                next_state = Rng_1;
            Rng_1:      next_state = Rng_2;
            Rng_2:      next_state = add_24_out_rst_o?Rng_3:state;
            Rng_3:      next_state = Rng_4;
            Rng_4:      next_state = Rng_5;
            Rng_5:      next_state = add_25_out_rst_o?Rng_6:state;
            Rng_6:      next_state = Control;
            //
            Expand_A_1 : next_state =  Expand_A_2;
            Expand_A_2 : next_state =  Expand_A_3;
            Expand_A_3 : next_state =  Expand_A_4;
            Expand_A_4 : next_state =  Expand_A_5;
            Expand_A_5 : if(sec_level == 3) next_state = (Hash_A_flag)? (Expand_A_E1):(~sk_ek_flag?Expand_A_Y1:Expand_A_X1);
                           else if(sec_level == 2) next_state = (Hash_A_flag)? Expand_A_E2:(~sk_ek_flag?Expand_A_Y2:Expand_A_X2);
                           else next_state = (Hash_A_flag)?Expand_A_6:(~sk_ek_flag?Expand_A_Y3:Expand_A_X3);
            Expand_A_E1: next_state =  Expand_A_E2;
            Expand_A_E2: next_state =  Expand_A_6;              
            Expand_A_6 : next_state =  Expand_A_7;
            Expand_A_7 : next_state =  Expand_A_8;
            Expand_A_X1: next_state =  Expand_A_X2;
            Expand_A_X2: next_state =  Expand_A_X3;
            Expand_A_X3: next_state =  Expand_A_X4;
            Expand_A_X4: next_state =  Expand_A_8;
            
            Expand_A_Y1: next_state =  Expand_A_Y2;
            Expand_A_Y2: next_state =  Expand_A_Y3;
            Expand_A_Y3: next_state =  Expand_A_Y4;
            Expand_A_Y4: next_state =  Expand_A_8;
            
            Expand_A_8 : next_state =  Expand_A_9;
            Expand_A_9 : next_state = keccak_cnt == 15?Expand_A_10:state; 
            Expand_A_10: next_state =  Expand_A_11;
            Expand_A_11: next_state = keccak_cnt == 24?Expand_A_12:state;
            Expand_A_12: next_state = hash_done?Expand_A_13:state;
            Expand_A_13: next_state = Expand_A_14;
            Expand_A_14: if(Hash_cnt < Hash_len)next_state = keccakOut_cnt==23?Expand_A_15:state;
                          else next_state = keccakOut_cnt==23?(Expand_A_M1):state;
            Expand_A_15: next_state = Expand_A_12;
            Expand_A_M1: next_state = Expand_A_M2; 
            Expand_A_M2: next_state = Expand_A_16; 
            Expand_A_16: if(~sample_mod[0])begin   
                                if(sample_rst_o & (sample_cnt[0] != 1)) next_state = Expand_A_1;
                                else if(sample_rst_o) next_state = Expand_A_17;
                                else next_state = state;
                                end
                         else if(sample_mod == 1)  next_state = Control;  
                         else      next_state = state;  
            Expand_A_17:if(~KEYGEN_SIGN) next_state = add_24_out_rst_o?Control:state;
                        else if(KEYGEN_SIGN) next_state = (add_24_out_rst_o&sample_rst_o_d7)?Control:state;
                        else next_state = state;
            Control:begin 
                              if(stage == 0||stage == 2) case(Control_reg1[1:0])
                                    2'b00:if(~masking_flag)next_state = state; else next_state = Rng_1;
                                    2'b01:next_state = Expand_A_1;                      /// 
                                    2'b10:next_state = NULL;
                                    default: next_state = state;
                                endcase
                                else if(stage == 1 | stage == 8 )  begin
                                    if(lane_cnt < ell) next_state = Expand_A_wait?Expand_A_1:state;  
                                    else next_state = state;
                                end
                                else if(stage == 3) begin
                                     next_state = (masking_flag)?Rng_1:NULL1;
                                end
                                else if(stage == 4) begin
                                     next_state = NULL1;
                                end
                                // for test
                                 else if(bram_state == 82) begin
                                     next_state = 10'd160;
                                end
                                else next_state = state;
                    end 
            NULL:if(ells_cnt1 < ell - 1) next_state = Single_s_flag?10'd1:state; 
                 else if(ells_cnt1 == ell - 1) next_state = StageS2A; else  next_state = state;
            StageS2A:next_state =   Expand_A_3;
            NULL1:if(kA_cnt == k) next_state = lane_flag?KEY2SIGN:state;
                         else next_state = Expand_A_wait?Expand_A_1:state;//  
            KEY2SIGN:if(~KEYGEN_SIGN) next_state = 10'd1; else next_state = C_hash_1; 
            // c hash
            C_hash_1  : next_state = C_hash_2;
            C_hash_2  : next_state = C_hash_3;
            C_hash_3  : next_state = C_hash_4;
            C_hash_4  : next_state = C_hash_5;
            C_hash_5  : if(sec_level == 3) next_state = C_hash_6;
                           else if(sec_level == 2) next_state = C_hash_8;
                           else next_state = C_hash_10;
            C_hash_6  : next_state = C_hash_7;
            C_hash_7  : next_state = C_hash_8;
            C_hash_8  : next_state = C_hash_9;
            C_hash_9  : next_state = C_hash_10;
            C_hash_10 : next_state = C_hash_11;
            C_hash_11 : next_state = C_hash_12;
            C_hash_12 : next_state = C_hash_13;
            C_hash_13 : next_state = C_hash_14;
            C_hash_14 : next_state = keccak_cnt == 16 ? C_hash_15: state;   
			C_hash_15 : next_state = keccak_cnt == 24 ? C_hash_16: state;
            C_hash_16 : next_state = hash_done?C_hash_17:state;
            C_hash_17 : next_state = C_hash_18;
            C_hash_18 : if(keccak_cnt == 16) next_state = C_hash_19;  else next_state = state;
            C_hash_19 : if(keccak_cnt == 24) next_state = C_hash_20; else next_state = state;
            C_hash_20 : next_state = hash_done?C_hash_21:state;            
            C_hash_21 : if(C_hash_cnt < C_hash_times - 1) next_state = C_hash_18;
                         else next_state = C_hash_22;
            C_hash_22: if(keccak_cnt == C_hash_final - 1) next_state = C_hash_23; else  next_state = state;
            C_hash_23 : next_state = C_hash_24; 
            C_hash_24 :next_state = keccak_cnt == 15?C_hash_25:state;
            C_hash_25 :next_state = C_hash_26;
            C_hash_26 :next_state = keccak_cnt == 24?C_hash_27:state;
            C_hash_27 :next_state = hash_done?C_hash_28:state;
            C_hash_28: next_state = C_hash_29;
            C_hash_29: next_state = keccakOut_cnt==(chash_len-2)?(C_poly_1):state;
            //
            C_poly_1      :next_state = C_poly_2;
            C_poly_2      :next_state = C_poly_3;
            C_poly_3      :next_state = C_poly_4;
            C_poly_4      :next_state = C_poly_5;
            C_poly_5      :if(sec_level == 3) next_state = C_poly_6;
                           else if(sec_level == 2) next_state = C_poly_8;
                           else next_state = C_poly_10;
            C_poly_6      :next_state = C_poly_7;  
            C_poly_7      :next_state = C_poly_8;  
            C_poly_8      :next_state = C_poly_9;  
            C_poly_9      :next_state = C_poly_10; 
            C_poly_10     :next_state = C_poly_11; 
            C_poly_11     :next_state = C_poly_12;
            C_poly_12     :next_state = C_poly_13;  
            C_poly_13     :next_state = C_poly_14; 
            C_poly_14     :next_state = C_poly_15;  
            C_poly_15     :next_state = keccak_cnt == 15?C_poly_16:state;
            C_poly_16     :next_state = C_poly_17;
            C_poly_17     :next_state = keccak_cnt == 24?C_poly_18:state;
            C_poly_18     :next_state = hash_done?C_poly_19:state;
            C_poly_19     :next_state = C_poly_20;
            C_poly_20     :next_state = keccakOut_cnt==16?C_poly_21:state;
            //
            C_poly_21  :  next_state = finial_A_flag?Expand_A_1:state;
			10'd160:     next_state = (test_cnt == 7)?10'd161:state;
            
            default:next_state = state;
        endcase
    end
    
    always @(posedge clk ) begin
	   if(rst)
		  stage <= 0;
		else case(stage)
		      5'd0:stage <= (state == StageS2A)? stage + 1 : stage;
		      5'd1:stage <= (stage2_f)? stage + 1 : stage;
		      5'd2:stage <= (state ==  Expand_A_17)? (~masking_flag?(sample_cnt == 0?4:2):3) : stage;                //
		      5'd3:stage <= (state ==  Rng_1)? ((sample_cnt != 0)?2:stage + 1) : stage; 
		      5'd4:if(kA_cnt == k) stage <= (lane_flag)? stage + 1 : stage; 
		           else stage <= (lane_flag)? 5'd1 : stage; 
		      5'd5:if(~KEYGEN_SIGN)  stage <= keyGen_flag?5'd0:stage; else stage <=  stage + 1 ;
		      5'd6:stage <= (state ==  C_poly_1)? stage + 1 : stage; 
		      5'd7:stage <= finial_A_flag? stage + 1 : stage; 
		      5'd8:stage <= bram_state == 74? stage + 1 : stage; 
		      default:stage <= stage;
		endcase
    end
    always @(posedge clk ) begin
	   if(rst|keyGen_flag|lane_flag) 
	       Control_reg1 <=  20'b00_10_00_01_00_01_00_01_00_01;   // 00 rng / 01 sample / 10 null  
	   else if((stage == 0||stage == 2||stage == 3) & state == Control) 
	       Control_reg1 <= {Control_reg1[1:0],Control_reg1[19:2]};
	   else if(Single_s_flag)   
	       Control_reg1 <= {Control_reg1[1:0],Control_reg1[19:2]};  
    end
    // hash C_hash_cnt
    always @(posedge clk) begin
	   if(rst)
		  C_hash_cnt <= 0;
	   else case(state)
		  C_hash_17,C_hash_21:  C_hash_cnt <= C_hash_cnt + 1;
	   endcase
    end
    ///hash
   // hash_rst
    always @(posedge clk ) begin
	   if(rst)
		  hash_rst <= 0;
	   else case(state)
		  Expand_A_1,C_hash_1,C_poly_1,Expand_A_M1:  hash_rst<=1;
          Expand_A_2,C_hash_2,C_poly_2,Expand_A_M2:  hash_rst<=0;
	   endcase
    end
    // hash_init
    always @(posedge clk ) begin
	   if(rst)
		  hash_init <= 0;
	   else case(state)
		  Expand_A_2,C_hash_2,C_poly_2,Expand_A_M2:  hash_init<=1;
		  Expand_A_3,C_hash_3,C_poly_3,Expand_A_16:  hash_init<=0;
	   endcase
    end  
    //  hash_go
    always @(posedge clk ) begin
	   if(rst)
		  hash_go <= 0;
	   else case(state)
		  Expand_A_12,Expand_A_15,C_hash_16,C_hash_20,C_hash_27:if(hash_done) hash_go <= 0;else hash_go <= 1;
		  C_poly_18: hash_go <= 1;
		  C_poly_19: hash_go <= 0;
	   endcase
    end 
    // hash_absorb
    always @(posedge clk ) begin
	   if(rst)
		  hash_absorb <= 0;
	   else case(state)
		  C_hash_18,C_hash_22:  hash_absorb <= 1;
		  C_hash_20,C_hash_27 : hash_absorb <= 0;
	   endcase
    end 
    always @(posedge clk ) begin
	   if(rst)
		  hash_squeeze <= 0;
	   else case(state)
		  C_poly_5,Expand_A_5, C_hash_5,C_hash_18,C_hash_22:  hash_squeeze <= 1;
		  C_poly_18,Expand_A_12 ,C_hash_16,C_hash_20 ,C_hash_27: hash_squeeze <= 0;
	   endcase
    end
    // hash_extend
    always @(posedge clk ) begin
	   if(rst)
		  hash_extend <= 0;
	   else case(state)
		  C_poly_19,Expand_A_13,C_hash_28 :  hash_extend <= 1;
		  C_poly_21,Expand_A_12, Expand_A_15, Expand_A_M1,C_poly_1:  hash_extend <= 0;  /////
	   endcase
    end 
    
    reg [255:0] e_seed;
    // hash_in
    wire [3:0] len_v = (stage == 2)?kA_cnt - 1:ells_cnt;
    always @(posedge clk ) begin
	   if(rst)
		  hash_in <= 0;
	   else case(state)
	      Expand_A_5:  hash_in <=  Hash_A_flag?{8'h41,{4'd0,kA_cnt},{4'b0,ellA_cnt},40'h000000000000}:{8'h75,{3'b0,rep_cnt},{4'b0,len_v},{2'b0,d_cnt},32'h000000000000};
	      Expand_A_E1: hash_in <=  vk_seed[255:192];
	      Expand_A_E2: hash_in <=  vk_seed[191:128];
	      Expand_A_6:  hash_in <=  vk_seed[127:64];
	      Expand_A_7:  hash_in <=  vk_seed[63:0];
	      Expand_A_X1: hash_in <=  s_seed[255:192] ;
	      Expand_A_X2: hash_in <=  s_seed[191:128] ;
	      Expand_A_X3: hash_in <=  s_seed[127:64] ;
	      Expand_A_X4: hash_in <=  s_seed[63:0] ;
	      
	      Expand_A_Y1:hash_in <=e_seed[255:192];
	      Expand_A_Y2:hash_in <=e_seed[191:128];
	      Expand_A_Y3:hash_in <=e_seed[127:64];
	      Expand_A_Y4:hash_in <=e_seed[63:0];
	      
	      
	      Expand_A_8:  hash_in <=  64'h1f00000000000000;
	      Expand_A_9:  hash_in <=  0;
	      Expand_A_10: hash_in <=  64'h0000000000000080;
	      Expand_A_11: hash_in <=  0;
	      
	      C_hash_5:  hash_in <=  {8'h68,{4'd0,k},48'h000000000000};
	      C_hash_6:  hash_in <=  mu[511:448];
	      C_hash_7:  hash_in <=  mu[447:384];
	      C_hash_8:  hash_in <=  mu[383:320];
	      C_hash_9:  hash_in <=  mu[319:256];
	      C_hash_10: hash_in <=  mu[255:192];
	      C_hash_11: hash_in <=  mu[191:128];
	      C_hash_12: hash_in <=  mu[127: 64];
	      C_hash_13: hash_in <=  mu[63:0];
	      C_hash_14,C_hash_18,C_hash_22: hash_in <=  {1'b0,bram_ts_douta[55:49],1'b0, bram_ts_douta[48:42],1'b0,bram_ts_douta[41:35],1'b0, bram_ts_douta[34:28], 1'b0,bram_ts_douta[27:21],1'b0, bram_ts_douta[20:14],1'b0, bram_ts_douta[13:7],1'b0, bram_ts_douta[6:0] };
	      C_hash_23:  hash_in <=  64'h1f00000000000000;
	      C_hash_15,C_hash_19,C_hash_24:  hash_in <=  0;
	      C_hash_25: hash_in <=  64'h0000000000000080;
	      C_hash_26: hash_in <=  0;
	      //
	      C_poly_5:  hash_in <=  {8'h63,w,48'h000000000000};
	      C_poly_6:  hash_in <=  sign_seed[511:448];
	      C_poly_7:  hash_in <=  sign_seed[447:384];
	      C_poly_8:  hash_in <=  sign_seed[383:320];
	      C_poly_9:  hash_in <=  sign_seed[319:256];
	      C_poly_10: hash_in <=  sign_seed[255:192];
	      C_poly_11: hash_in <=  sign_seed[191:128];
	      C_poly_12: hash_in <=  sign_seed[127: 64];
	      C_poly_13: hash_in <=  sign_seed[63:  0];	      
	      C_poly_14: hash_in <=  64'h1f00000000000000;
	      C_poly_15: hash_in <=  0;
	      C_poly_16: hash_in <=  64'h0000000000000080;
	      C_poly_17: hash_in <=  0;
	   endcase
    end
    always@(posedge clk ) begin
        if(rst) keccak_cnt<=0;
        else case(state)
               Expand_A_3, Expand_A_1,C_hash_17,C_hash_21,C_hash_1,C_poly_1:keccak_cnt<=0;
                C_poly_5, C_poly_6, C_poly_7, C_poly_8, C_poly_9, C_poly_10, C_poly_11, C_poly_12, C_poly_13, C_poly_14, C_poly_15, C_poly_16, C_poly_17:keccak_cnt <= keccak_cnt + 1;  
                Expand_A_5, Expand_A_6, Expand_A_7, Expand_A_8, Expand_A_9, Expand_A_10, Expand_A_11,Expand_A_E1,Expand_A_E2,Expand_A_X1,Expand_A_X2,Expand_A_X3,Expand_A_X4,Expand_A_Y1,Expand_A_Y2,Expand_A_Y3,Expand_A_Y4:keccak_cnt <= keccak_cnt + 1; 
                C_hash_5, C_hash_6, C_hash_7, C_hash_8, C_hash_9,  C_hash_10, C_hash_11, C_hash_12, C_hash_13, C_hash_14, C_hash_15 , C_hash_18, C_hash_19:keccak_cnt <= keccak_cnt + 1;  
                C_hash_22,C_hash_23,C_hash_24,C_hash_25,C_hash_26:keccak_cnt <= keccak_cnt + 1; 
            endcase
    end 
    always@(posedge clk ) begin
        if(rst) keccakOut_cnt<=0;
        else case(state)
                C_poly_19, C_poly_20,Expand_A_14,C_hash_29:keccakOut_cnt <= keccakOut_cnt + 1;   
                Expand_A_3,Expand_A_1,Expand_A_13,C_hash_28,C_poly_18 : keccakOut_cnt<=0;
            endcase
    end 
    //seed
    always @(posedge clk ) begin
	   if(rst)
		  vk_seed <=  0;
	   else case(state)
		  //8'd0 : vk_seed <= 256'h061550234d158c5ec95595fe04ef7a25;	//SECUIRTY LEVEL 1
		  //8'd0 : vk_seed <= 256'h061550234D158C5EC95595FE04EF7A25767F2E24CC2BC479;// SECUIRTY LEVEL 3
		  8'd0 : vk_seed <= 256'h061550234d158c5ec95595fe04ef7a25767f2e24cc2bc479d09d86dc9abcfde7; // SECUIRTY LEVEL 5
		  default : vk_seed <= vk_seed;
	   endcase
    end
    ///
    reg shake_out_flag_d;
    always @(posedge clk )shake_out_flag_d <= shake_out_flag;
    wire seed_refresh = ~sample_din_flag & shake_out_flag_d;
    //
    always @(posedge clk ) begin
	   if(rst)
		  s_seed <= 0;
	   else case(state)
		  //8'd0 : s_seed <= 256'h7bada89bf0e1852e7998951ea7268f7f;	  // SECUIRTY LEVEL 1
		  //8'd0 : s_seed <= 256'h1a9fbcbc8da36dff2abe203296170fdb97c3297f67fcb679;  // SECUIRTY LEVEL 3
		  8'd0 : s_seed <= 256'h1a9fbcbc8da36dff2abe203296170fdb97c3297f67fcb679ac719c9fd00253b0;  // SECUIRTY LEVEL 5
		  default : s_seed <= s_seed;
	   endcase
    end
    // e_seed
    always @(posedge clk ) begin
	   if(rst)
		  e_seed <= 0;
	   else case(state)
		  //8'd0 : e_seed <= 256'h7bada89bf0e1852e7998951ea7268f7f;	  // SECUIRTY LEVEL 1
		  //8'd0 : e_seed <= 256'h1a9fbcbc8da36dff2abe203296170fdb97c3297f67fcb679;  // SECUIRTY LEVEL 3
		  8'd0 : e_seed <= 256'h1a9fbcbc8da36dff2abe203296170fdb97c3297f67fcb679ac719c9fd00253b0;  // SECUIRTY LEVEL 5
		  default : e_seed <= e_seed;
	   endcase
    end
    always@(posedge clk ) begin
        if(rst) mu <= 0;
        else case(state)
            //8'd0 : mu <= 512'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;	 //  SECUIRTY LEVEL 1
            //8'd0 : mu <= 512'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f;	 //  SECUIRTY LEVEL 2
            8'd0 : mu <= 512'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f;//  SECUIRTY LEVEL 5
		  default : mu <= mu;
        endcase
    end
    always@(posedge clk ) begin
        if(rst) sign_seed <= 0;
        else case(state)
            C_hash_29,C_poly_1 : sign_seed <= {sign_seed[511-64:0],hash_out_chang};	
		  default : sign_seed <= sign_seed;
        endcase
    end
    
    // cnts
    always @(posedge clk ) begin
	   if(rst)
		  sample_cnt <= 0;
	   else if(~sample_mod[0] & state == Expand_A_16 & sample_rst_o)
	      sample_cnt <= sample_cnt + 1;
    end
    // krng_cnt
    always @(posedge clk ) begin
	   if(rst|keyGen_flag)
		  krng_cnt <= 0;
	   else if(lane_flag)
	      krng_cnt <= krng_cnt + 1;
    end
    // d_cnt;
    reg [4:0]rep_cnt_d,rep_cnt_d1,rep_cnt_d2,rep_cnt_d3,rep_cnt_d4;
    always@(posedge clk) begin rep_cnt_d <= rep_cnt; rep_cnt_d1 <= rep_cnt_d; rep_cnt_d2 <= rep_cnt_d1; rep_cnt_d3 <= rep_cnt_d2; rep_cnt_d4 <= rep_cnt_d3;end
    always@(posedge clk) begin
        if(rst)
            d_cnt <= 0;
        else if( state == Expand_A_16 & sample_rst_o)
            //d_cnt <= (rep_cnt_d == rep - 1)? (d_cnt == d - 1)?0:d_cnt + 1: d_cnt;
            d_cnt <= (d_cnt == d - 1)?0: d_cnt + 1;
    end 
    always@(posedge clk) begin
        if(rst)
            rep_cnt <= 0;
        else if( state == Expand_A_16 & sample_rst_o)
             rep_cnt <= (d_cnt == d - 1)?(rep_cnt == rep - 1)?0: rep_cnt + 1: rep_cnt;
    end 
    always@(posedge clk ) begin
        if(rst)
            ells_cnt <= 0;
        else if(keyGen_flag) ells_cnt <= 0;
        else if(Single_s_flag & (stage == 1|stage == 0))
             ells_cnt <= ells_cnt + 1;    
        else if(stage2_f|z_flag)
             ells_cnt <= (ells_cnt == ell)?0:ells_cnt + 1;           
    end
    always@(posedge clk ) begin
        if(rst)
            ells_cnt1 <= 0;
        else if(keyGen_flag) ells_cnt1 <= 0;
        else if(Single_s_flag & (stage == 1|stage == 0))
             ells_cnt1 <= ells_cnt1 + 1;    
        else if(stage2_f|z_flag)
             ells_cnt1 <= (ells_cnt1 == ell)?0:ells_cnt1 + 1;           
    end 
     // Hash_cnt
    always@(posedge clk ) begin
        if(rst)
            Hash_cnt <= 0;
        else if(state == Expand_A_13)
            Hash_cnt <= Hash_cnt + 1;
        else if(state == Expand_A_3)
            Hash_cnt <= 0;
    end // lane_cnt
    always@(posedge clk ) begin
        if(rst)
            lane_cnt <= 0;
        else if(lane_flag )
            lane_cnt <= 0;
        else if(Expand_A_wait)
            lane_cnt <= lane_cnt + 1;

    end 
    // a
    always@(posedge clk ) begin
        if(rst)
            kA_cnt <= 0;
        else if(Expand_A_wait)
            kA_cnt <= (ellA_cnt == ell - 1)?kA_cnt + 1:kA_cnt;
        else if(keyGen_flag)
            kA_cnt <= 0;
    end 
    always@(posedge clk) begin
        if(rst)
            ellA_cnt <= 0; 
        else if(Expand_A_wait)
             ellA_cnt <= (ellA_cnt == ell - 1)?0: ellA_cnt + 1;            
    end  
    always@(posedge clk ) begin
        if(rst)
            ell_cnt <= 0;  
    else if(Single_A_flag|finial_lane_flag  )
            ell_cnt <= ell_cnt + 1;
    else if(stage2_f| (stage == 8 & lane_flag))
           ell_cnt <= 0;    
    end  
     /// --------------------------------------   flags
    always @(posedge clk) begin
	   if(rst)
		  KEYGEN_SIGN <= 0; // KEYGEN_SIGN = 0 : keygen
	   else if(keyGen_flag)
	      KEYGEN_SIGN <= 1;
    end  // Hash_len
    always @(posedge clk ) begin
	   if(rst)
		  Hash_len <= 0; 
	   else 
	      Hash_len <=  Hash_A_flag?28:(KEYGEN_SIGN?23:4);
    end
    always @(posedge clk ) begin
	   if(rst)
		  Hash_A_flag <= 0; // Hash_A_flag = 0 : for s/e
	   else if(state == StageS2A | lane_flag | finial_A_flag)
	     Hash_A_flag <= 1;  
	   else if(stage2_f| keyGen_flag)  
	     Hash_A_flag <= 0; 
    end
    /// -------------------------------------- sample
    // shake out flag
    
    assign shake_out_flag = hash_extend & (keccakOut_cnt <= 16);
    reg sample_rst;
    
    reg [8:0] sample_in_cnt;
    reg sampleU_in_flag;//    sample_mod
    
    always@(posedge clk ) begin
        if(rst) sample_mod <= 0;
        else if(stage == 0)  sample_mod <= KEYGEN_SIGN?2:0;
        else if(stage == 1) sample_mod <= 1;
        else if(stage == 2) sample_mod <=  KEYGEN_SIGN?2:0;
        else if(stage == 7) sample_mod <=  3;
        else if(stage == 8) sample_mod <=  1;
        else sample_mod <= sample_mod;
    end
    always@(posedge clk) begin
        if(rst) sample_u <= 0;
        else if(~KEYGEN_SIGN)  sample_u <= (sec_level == 2)?7:6;
        else if(KEYGEN_SIGN)   sample_u <= 41;  /// need to revised when sign() u = 41
        else sample_u <= sample_u;
    end
    always@(posedge clk ) begin
        if(rst| state == Expand_A_3) sample_in_cnt <= 0;
        else if(sample_mod == 0 & shake_out_flag & sample_in_cnt <= 63) sample_in_cnt <= sample_in_cnt + 1;
        else if(sample_mod == 2 &shake_out_flag & sample_in_cnt <= 384)
            sample_in_cnt <= sample_in_cnt + 1;
    end
    always @(posedge clk ) begin
	   if(rst)
		  sample_rst <= 0;
	   else if(KEYGEN_SIGN & sample_rst_o_d6)  sample_rst <= 1;
	   else if(finial_A_flag) sample_rst <= 1;
	   else case(state)
		  C_poly_1 :  sample_rst <= 1;
		  C_poly_2:  sample_rst <= 0;
		  default: sample_rst <= 0;
	   endcase
    end 
    always@(posedge clk ) begin
        if(rst)begin
             sample_din <= 0;
             sample_din_flag <= 0;
             end
        else if(sample_mod == 1 & shake_out_flag) begin
             sample_din <=  hash_out_chang;          
             sample_din_flag <= shake_out_flag;
        end
        else if(sample_mod == 0)begin
            if(shake_out_flag & sample_in_cnt <= 63) begin
                sample_din <=  hash_out_chang;   //
                sample_din_flag <= 1;
             end
             else begin
                sample_din <= 0;     
                sample_din_flag <= 0;
             end
        end
        else if(sample_mod == 2)begin
            if(shake_out_flag & sample_in_cnt <= 383) begin
                sample_din <= hash_out_chang;
                sample_din_flag <= 1;
             end
             else begin
                sample_din <= 0;     
                sample_din_flag <= 0;
             end
        end
        else if(sample_mod == 3 & shake_out_flag) begin
             sample_din <= hash_out_chang;
             sample_din_flag <= shake_out_flag;
        end
        else begin
             sample_din <= 0;
             sample_din_flag <= 0;
             end
    end
    /// --------------------------------------   rng control
    always@(posedge clk) begin
        if(rst|rng_done) rng_cnt <= 0;
        else if(rng_flag)
            rng_cnt <= rng_cnt + 1;
    end
    always@(posedge clk ) begin
        if(rst|rng_done) rng_flag <= 0;
        else if(rng_en)
            rng_flag <= 1;
        else if(rng_cnt == 254)
            rng_flag <= 0;
    end 
    always@(posedge clk) begin
        if(rst) rng_done <= 0;
        else if(rng_cnt == 254  & rng_in_flag)
            rng_done <= 1;
        else 
            rng_done <= 0;
    end 

    always@(posedge clk ) begin
        if(rst)  
            rng_refresh_flag <= 0;
        else if(ntt_state == 8)
            rng_refresh_flag <= 1;
        else if(ntt_state == 12)
            rng_refresh_flag <= 0;
    end  
    always@(posedge clk ) begin
        if(rst)  
            rng_din <= 128'hf1e2d3c4b5a69788796a5b4c3d2e1f0; // 
//        else if(change_rng_seed)
//            rng_din <= {rng_din[63:0],rng_dout};
        else if(state == Rng_1)
            rng_din <= {rng_din[126:0],rng_din[127]};
        else if(rng_done)
            rng_din <= {rng_din[126:0],rng_din[127]};
    end  
    always@(posedge clk) begin
        if(rst)  
            rng_en <= 0;
        else if(stage == 7)case(bram_state)
                7'd48:if(ntt_output_rst_d)  rng_en <= 1; else  rng_en <= 0;
                7'd49:if(add_24_out_rst_o)  rng_en <= 1; else  rng_en <= 0;
            default:  rng_en <= 0;
        endcase
        else if(rng_refresh_flag & masking_flag) case(ntt_state) // & krng_cnt == k - 1
                7'd9,7'd10:if(ntt_output_rst_d)  rng_en <= 1; else  rng_en <= 0;
            default:  rng_en <= 0;
        endcase
        else case(state)
            Rng_1,Rng_4: rng_en <=1;
            Rng_2,Rng_5: rng_en <=0;
            //
            default: rng_en <= 0;
        endcase
    end  
    /// --------------------------------------   bram state
    wire [24:0] Poly_shift_1 = (ntt_state == 0)?0:ntt_cnt_d1?bram_a_24_douta[23:0]:bram_a_24_douta[47:24];
    wire [24:0] Poly_shift_2 = (ntt_state == 0)?0:ntt_cnt_d1?bram_a_25_douta[24:0]:bram_a_25_douta[49:25];
    always@(posedge clk ) begin
        if(rst) 
            bram_state <= 0;
        else 
            bram_state <= bram_next_state;
    end
    always@(*)begin
        case(bram_state)//
            7'd0 :if(masking_flag) bram_next_state = (start)?7'd1:bram_state;
                  else bram_next_state = (start)?7'd3:bram_state;
            7'd3:if(~KEYGEN_SIGN) bram_next_state = ((add_24_out_rst_o| add_25_out_rst_o))? (~masking_flag & stage == 4? 7'd36:7'd4): bram_state;
                  else if(KEYGEN_SIGN) bram_next_state = ((add_24_out_rst_o| add_25_out_rst_o) &sample_rst_o_d7)? (~masking_flag & stage == 4? 7'd36:7'd4): bram_state;
            7'd31:if(~KEYGEN_SIGN) bram_next_state = ((add_24_out_rst_o| add_25_out_rst_o))? 7'd32: bram_state;
                  else if(KEYGEN_SIGN) bram_next_state = ((add_24_out_rst_o| add_25_out_rst_o) &sample_rst_o_d7 )? 7'd32: bram_state;
			7'd1:if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = 7'd2;
                  else bram_next_state = bram_state;
			7'd2 :if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = 7'd3;
                  else bram_next_state = bram_state;
			7'd5 :if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = 7'd6;
                  else bram_next_state = bram_state;
			7'd34:if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = 7'd35;
                  else bram_next_state = bram_state;
			7'd35:if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = 7'd36;
                  else bram_next_state = bram_state;
            7'd4,7'd32:if(sample_cnt[0] == 0)  bram_next_state = ~masking_flag?(sample_cnt == 0?7'd7:7'd3):7'd5; // d==0
                 else bram_next_state = 7'd3; 
			7'd7 :bram_next_state =  ntt_input_done?7'd8:bram_state;    
			7'd9 :bram_next_state =  ntt_input_done?7'd10:bram_state;  
			7'd11:bram_next_state =  ntt_input_done?7'd12:bram_state;  
			7'd13:bram_next_state =  ntt_input_done?7'd14:bram_state;  
			7'd8 :bram_next_state =  ntt_rst?7'd9:bram_state;
			7'd12:bram_next_state =  ntt_rst?7'd13:bram_state;
			7'd14:bram_next_state =  ntt_rst?7'd15:bram_state;	
            7'd10:bram_next_state =  ntt_rst?(~masking_flag?7'd15:7'd11):bram_state;
            7'd15: if(ells_cnt1 < ell) bram_next_state = 7'd0; else bram_next_state = 7'd16;
            //stage 2
			7'd16:bram_next_state =  ntt_rst?7'd17:bram_state;
			7'd17:bram_next_state =  ntt_rst?7'd18:bram_state;
			7'd18:bram_next_state =  ntt_rst?7'd19:bram_state;
			7'd20:bram_next_state =  ntt_rst?7'd21:bram_state;
			7'd21:bram_next_state =  ntt_rst?7'd22:bram_state;
            7'd19:bram_next_state =  ntt_rst?(~masking_flag?7'd22:7'd20):bram_state;
            7'd22:if(ell_cnt < ell - 1) bram_next_state =  7'd16;
                  else bram_next_state = 7'd23;
			7'd23:bram_next_state =  ntt_input_done?7'd24:bram_state;  
			7'd25:bram_next_state =  ntt_input_done?7'd26:bram_state; 
			7'd27:bram_next_state =  ntt_input_done?7'd28:bram_state; 	
			7'd29:bram_next_state =  ntt_input_done?7'd30:bram_state; 	  
			7'd24:bram_next_state =  ntt_rst?7'd25:bram_state;
			7'd26:bram_next_state =  ntt_rst?(~masking_flag?7'd31:7'd27):bram_state;
			7'd28:bram_next_state =  ntt_rst?7'd29:bram_state;
			7'd30:bram_next_state =  ntt_rst?7'd31:bram_state;
            7'd6 :if(add_24_out_rst_o| add_25_out_rst_o) bram_next_state = (sample_cnt!=0)?7'd3:((stage == 4)?7'd34:7'd7); else bram_next_state = bram_state;
            7'd36: bram_next_state =  7'd37;
            7'd37: bram_next_state = Poly_shift_rst_d?7'd38:bram_state;
            7'd38:if(kA_cnt < k) bram_next_state = lane_flag?7'd16:bram_state;
                  else bram_next_state = lane_flag? 7'd39:bram_state;
            7'd39:if(~KEYGEN_SIGN) bram_next_state = keyGen_flag?7'd0:bram_state; else  bram_next_state = keyGen_flag?7'd40:bram_state; 
            7'd40:bram_next_state = Chash_flag_d?7'd41:bram_state;
            7'd41:bram_next_state =  ntt_input_done?7'd42:bram_state;  
            7'd42:bram_next_state =  ntt_rst?7'd43:bram_state;
            7'd43:bram_next_state =  ntt_input_done?7'd44:bram_state;  
            7'd44:bram_next_state =  ntt_rst?7'd45:bram_state;
            7'd45:bram_next_state =  ntt_rst?7'd46:bram_state;
            7'd46:bram_next_state =  ntt_rst?(~masking_flag?7'd53:7'd47):bram_state; // d==1?
            7'd47:bram_next_state =  ntt_rst?7'd48:bram_state;
            7'd48:bram_next_state =  ntt_rst?7'd49:bram_state;     
            7'd49:bram_next_state =  add_24_out_rst_o?7'd50:bram_state;   
            7'd50:bram_next_state =  add_25_out_rst_o?7'd51:bram_state; 
            7'd51:bram_next_state =  add_24_out_rst_o?7'd52:bram_state; 
            7'd52:bram_next_state =  add_25_out_rst_o?7'd53:bram_state; 
            7'd53:if(ells_cnt1 < ell - 1)  bram_next_state = z_flag?7'd45:bram_state;     else  bram_next_state = z_flag?7'd54:bram_state;   
            7'd54:bram_next_state =  ntt_input_done?7'd55:bram_state;  
            7'd55:bram_next_state =  ntt_rst?7'd56:bram_state;
            7'd56:bram_next_state =  ntt_input_done?7'd57:bram_state;  
            7'd57:bram_next_state =  ntt_rst?7'd58:bram_state;    
            7'd58:bram_next_state =  ntt_rst?7'd59:bram_state; 
            7'd59:bram_next_state =  ntt_rst?7'd60:bram_state; 
            7'd60:bram_next_state =  ntt_rst?7'd61:bram_state; 
            7'd61:bram_next_state =  ntt_rst?7'd62:bram_state; 
            7'd62:if(ell_cnt < ell - 1) bram_next_state =  7'd58; else bram_next_state = 7'd63;
            7'd63:bram_next_state =  ntt_rst?7'd64:bram_state; 
            7'd64:bram_next_state =  ntt_rst?7'd65:bram_state;   
            7'd65:bram_next_state =  ntt_rst?7'd66:bram_state; 
            7'd66:bram_next_state =  ntt_rst?7'd67:bram_state;             
            7'd67:bram_next_state =  ntt_input_done?7'd68:bram_state;  
            7'd68:bram_next_state =  ntt_rst?7'd69:bram_state;   
            7'd69:bram_next_state =  ntt_input_done?7'd70:bram_state;  
            7'd70:bram_next_state =  ntt_rst?7'd71:bram_state;  
            7'd71:bram_next_state =  7'd72;
            7'd72:bram_next_state =  Poly_shift_rst_d?7'd73:bram_state;  
            7'd73:if(kA_cnt < k) bram_next_state =  7'd58; else bram_next_state = 7'd74;      
            7'd74:bram_next_state =  ntt_input_done?7'd75:bram_state;  
            7'd75:bram_next_state =  ntt_rst?7'd76:bram_state;  
            7'd76:bram_next_state =  ntt_input_done?7'd77:bram_state;  
            7'd77:bram_next_state =  ntt_rst?7'd78:bram_state; 
            7'd78:bram_next_state =  7'd79;
            7'd79:bram_next_state =  Poly_shift_rst_d?7'd80:bram_state;   
            7'd80:bram_next_state =  ntt_rst?7'd81:bram_state;  
            7'd81:if(ell_cnt < ell - 1) bram_next_state =  7'd74; else bram_next_state = 7'd82;                    
            default: bram_next_state = bram_state;
        endcase
    end
    /// Cob
    always@(posedge clk) begin
        if(rst)  Cob_inflag <= 0;
        else if(sampleA_flag)  Cob_inflag <= 1;
        else if(sampleU_flag & KEYGEN_SIGN) Cob_inflag <= 1;   // sign
        else Cob_inflag <= 0;
    end
    always@(posedge clk ) begin
        if(rst)  Cob_in_25 <= 0;
        else if(sampleA_flag)  Cob_in_25 <= sample_D_25_1;
        else if(sampleU_flag & KEYGEN_SIGN)  Cob_in_25 <= sample_D_25_1;   // sign
        else  Cob_in_25 <= 0;
    end
    always@(posedge clk ) begin
        if(rst)  Cob_in_24 <= 0;
        else if(sampleA_flag)  Cob_in_24 <= sample_D_24_1;
         else if(sampleU_flag & KEYGEN_SIGN)  Cob_in_24 <= sample_D_24_1;   // sign
        else  Cob_in_24 <= 0;
    end
    always@(posedge clk ) begin
        if(rst)  ColA_rst <= 0;
        else if(bram_state == 4) ColA_rst <= 1;
        else if(Expand_A_wait| finial_A_flag) ColA_rst <= 1;
        else if(sample_bram_start & KEYGEN_SIGN) ColA_rst <= 1;
        else  ColA_rst <= 0;
    end 
    // -------------------  storage poly shift  -------------------------//
    reg [2:0] shift_cnt;
    always@(posedge clk ) begin
        if(rst) shift_cnt <= 0;
        else if(Shift_dout_flag) shift_cnt <= shift_cnt + 1;
    end
    reg [55:0] shift_reg;
    always@(posedge clk) begin
        if(rst) shift_reg <= 0;
        //else if(singleA_finished) shift_reg <= 0;
        else if(Shift_dout_flag) shift_reg <= {shift_reg[48:0],Shift_dout};
    end
    reg shift_storage_flag;
    always@(posedge clk ) begin
        if(rst) shift_storage_flag <= 0;
        else if(shift_cnt == 7) shift_storage_flag <= 1;
        else  shift_storage_flag <= 0;
    end
//    // ---------------------------  bram ts  ------------------------------//

	reg [4:0] kA_cnt_d;
    reg [1:0]ts_cnt;
    reg [2:0] ts_cnt_o;
    reg [6:0] ts_h;
    wire [15:0] ts_out_1 = (ts_cnt == 1)?{bram_ts_douta[55:49],1'b0,bram_ts_douta[48:42]}:(ts_cnt == 2)?({bram_ts_douta[41:35],1'b0,bram_ts_douta[34:28]}):ts_cnt == 3?{bram_ts_douta[27:21],1'b0,bram_ts_douta[20:14]} :{bram_ts_douta[13:7],1'b0,bram_ts_douta[6:0]};
    wire [15:0] ts_out_2 = (ts_cnt == 1)?{bram_ts_doutb[55:49],1'b0,bram_ts_doutb[48:42]}:(ts_cnt == 2)?({bram_ts_doutb[41:35],1'b0,bram_ts_doutb[34:28]}):ts_cnt == 3?{bram_ts_doutb[27:21],1'b0,bram_ts_doutb[20:14]} :{bram_ts_doutb[13:7],1'b0,bram_ts_doutb[6:0]};
    always@(posedge clk) begin
        if(rst) begin ts_cnt <= 0; end
        else case(bram_state)
            7'd63,7'd64:if(bram_ts_ena) begin ts_cnt <= ts_cnt + 1; end
            default: ts_cnt <= 0; 
        endcase
    end
    always@(*) begin
        if(rst) begin ts_h <= 0; end
        else case(ts_cnt_o)
            3'd1:ts_h <= bram_ts_douta[55:49]; 3'd2:ts_h <= bram_ts_douta[48:42];
            3'd3:ts_h <= bram_ts_douta[41:35]; 3'd4:ts_h <= bram_ts_douta[34:28];
			3'd5:ts_h <= bram_ts_douta[27:21]; 3'd6:ts_h <= bram_ts_douta[20:14];
			3'd7:ts_h <= bram_ts_douta[13:7];  3'd0:ts_h <= bram_ts_douta[6:0]; 
        endcase
    end
    always@(posedge clk ) begin
        if(rst) begin ts_cnt_o <= 0; end
        else case(bram_state)
            7'd72:if(bram_ts_ena) begin ts_cnt_o <= ts_cnt_o + 1; end
            default: ts_cnt_o <= 0; 
        endcase
    end 
    wire [4:0] kA_cnt_ts = kA_cnt -1 + k ;
    always@(posedge clk) begin
		if(rst) kA_cnt_d <= 0;
		else if(KEYGEN_SIGN) kA_cnt_d <= (stage == 8)?kA_cnt - 1:kA_cnt - 1 + k;
		else kA_cnt_d <= kA_cnt - 1;
	end
    always@(posedge clk ) begin
        if(rst) begin bram_ts_ena <= 0; bram_ts_wra <= 0; end
        else case(bram_state)
            7'd37:begin bram_ts_ena <= shift_storage_flag; bram_ts_wra <= 1; end
            7'd63,7'd64:begin bram_ts_ena <= ntt_in_flag; bram_ts_wra <= 0; end
            7'd72:begin bram_ts_ena <= ConMulti_flag_o_d3; bram_ts_wra <= 0; end
            7'd40:begin bram_ts_wra <= 0;
                        case(state)
                            C_hash_12,C_hash_13: bram_ts_ena <= 1; 
                            C_hash_14: if(keccak_cnt > 14) bram_ts_ena <= 0; 
                            C_hash_16,C_hash_20: if(hash_done) bram_ts_ena <= 1;
                            C_hash_18: if(keccak_cnt > 14) bram_ts_ena <= 0; 
                            C_hash_22: if(keccak_cnt >= C_hash_final - 2) bram_ts_ena <= 0; 
                            default: bram_ts_ena <= bram_ts_ena; 
                        endcase
                end
            default: begin bram_ts_ena <= 0; bram_ts_wra <= 0; end
        endcase
    end
	reg [10:0] ts_addra_gap,ts_addra_offset;
    always@(posedge clk) begin
        if(rst) ts_addra_offset <= 0;
        else case(bram_state)
            7'd37:ts_addra_offset <= {kA_cnt_d,6'd0};   
            7'd40:ts_addra_offset <= {k,6'd0};
            7'd63,7'd64:ts_addra_offset <= {kA_cnt_d,6'd0};  
            7'd72:ts_addra_offset <= {kA_cnt_ts,6'd0}; 
			default:ts_addra_offset <= 0;		
        endcase
    end

    always@(posedge clk) begin
        if(rst) ts_addra_gap <= 0;
        else case(bram_state)
			7'd37:if(bram_ts_ena) ts_addra_gap <= ts_addra_gap + 1;
			7'd36:ts_addra_gap <= 0;
			7'd40:if(bram_ts_ena) ts_addra_gap <= ts_addra_gap + 1;// else ts_addra_gap <= 1;
			7'd62:ts_addra_gap <= 0;
			7'd63,7'd64:if(bram_ts_ena & ts_cnt == 2) ts_addra_gap <= ts_addra_gap + 1;else if(ntt_input_done) ts_addra_gap <= 0;
			7'd71:ts_addra_gap <= 0;
			7'd72:if(bram_ts_ena & ts_cnt_o == 6) ts_addra_gap <= ts_addra_gap + 1; 
			default:ts_addra_gap <= 1;
        endcase 
    end
  
    always@(posedge clk) begin
        if(rst)  bram_ts_addra <= 0;
        else case(bram_state)
			7'd37:if(shift_storage_flag)  bram_ts_addra <= ts_addra_gap + ts_addra_offset;
			7'd63,7'd64,7'd72:if(bram_ts_ena)  bram_ts_addra <= ts_addra_gap + ts_addra_offset; else bram_ts_addra <= ts_addra_offset;
			7'd40: case(state)
			                C_hash_12: bram_ts_addra <= {k,6'd0}; 
                            C_hash_13 ,C_hash_17,C_hash_21:if(bram_ts_ena)  bram_ts_addra <= ts_addra_gap + ts_addra_offset; else bram_ts_addra <= ts_addra_offset; 
                            C_hash_14, C_hash_18,C_hash_22:if(bram_ts_ena)  bram_ts_addra <= ts_addra_gap + ts_addra_offset;
                            default: bram_ts_addra <= bram_ts_addra;
                        endcase
            default:bram_ts_addra <= ts_addra_offset;   
        endcase
    end
  
    always@(posedge clk) begin
        if(rst)    bram_ts_dina <= 0;   
        else case(bram_state)
				7'd37:bram_ts_dina <= shift_reg;  
            default:bram_ts_dina <= 0;   
        endcase    
    end 
    // ------------------  ts b
    always@(posedge clk) begin
        if(rst) begin bram_ts_enb <= 0; bram_ts_wrb <= 0; end
        else case(bram_state)
            7'd63,7'd64:begin bram_ts_enb <= ntt_in_flag; bram_ts_wrb <= 0; end
            default:begin bram_ts_enb <= 0; bram_ts_wrb <= 0; end
        endcase
    end
	reg [10:0] ts_addrb_gap,ts_addrb_offset;
    always@(posedge clk) begin
        if(rst) ts_addrb_offset <= 0;
        else case(bram_state)
            7'd62:ts_addrb_offset <= 0;
            7'd63,7'd64:ts_addrb_offset <= {kA_cnt_d,6'd32};      
        endcase
    end
    always@(posedge clk) begin
        if(rst) ts_addrb_gap <= 0;
        else case(bram_state)
			7'd63,7'd64:if(bram_ts_enb & ts_cnt == 2) ts_addrb_gap <= ts_addrb_gap + 1;  else if(ntt_input_done) ts_addrb_gap <= 0;
        endcase 
    end
    always@(posedge clk ) begin
        if(rst)  bram_ts_addrb <= 0;
        else case(bram_state)
			7'd63,7'd64:if(bram_ts_enb)  bram_ts_addrb <= ts_addrb_gap + ts_addrb_offset; else bram_ts_addrb <= ts_addrb_offset; 
            default:bram_ts_addrb <= ts_addrb_offset;   
        endcase
    end
    always@(posedge clk ) begin
        if(rst)  bram_ts_dinb <= 0;
        else case(bram_state)
            default:bram_ts_dinb <= 0;   
        endcase  
    end  
    
    
    // ----------------------------------------  fifo  ---------------------------------------------------------
    reg FIFO_end;reg [8:0] A_cnt;
    reg SampleA_half;
    reg [11:0] a_addra_offset_24;
    reg [11:0] a_addra_gap_24;
    wire only_a = sample_mod == 1;
    always@(posedge clk) begin
        if(rst) FIFO_end <= 0;
        else if(A_cnt == 255 & Cob_outflag & only_a)  FIFO_end <= 1;
        else if(Expand_A_wait| keyGen_flag ) FIFO_end <= 0; //| lane_finished
    end
    always@(posedge clk ) begin
        if(rst) SampleA_half <= 0;
        else if(A_cnt == 127 & Cob_outflag & only_a)  SampleA_half <= 1;
        else if(Expand_A_wait| keyGen_flag) SampleA_half <= 0;// | lane_finished
    end
    always@(posedge clk ) begin
        if(rst) A_cnt <= 0;
        else if(Cob_outflag & ~FIFO_end & only_a ) A_cnt <= A_cnt + 1;
        else if(FIFO_end) A_cnt <= 0;
    end
    
	wire Temp_A_wr_flag,Temp_A_wr_half;
	reg Temp_A_rd_flag,Temp_A_choose;
	
	wire [24:0] Temp_A_1, Temp_A_2, Temp_A_3, Temp_A_4;
    
    assign Temp_A_wr_flag =  Cob_outflag &  ~FIFO_end & only_a;
    assign Temp_A_wr_half =  Cob_outflag &  SampleA_half &  ~FIFO_end & only_a;
    
    always@(posedge clk) begin
        if(rst) Temp_A_choose <= 0;
        else case(ntt_state)
            7'd6,7'd9,7'd31,7'd34:Temp_A_choose <= 0;
            7'd7,7'd32:Temp_A_choose <= 1;    
        endcase
    end
    always@(posedge clk) begin
        if(rst) Temp_A_rd_flag <= 0;
        else case(ntt_state)
            7'd6,7'd7,7'd31,7'd32:Temp_A_rd_flag <= ntt_in_flag;
        endcase
    end
    /// --------------------------------------   poly add/sub
    reg [23:0] Rng_q_24_1,Rng_q_24_2;
    reg [24:0] Rng_q_25_1,Rng_q_25_2;
    reg q_mod;
    reg masking_order;
    wire zero_masking = (~masking_flag) & (stage == 0) & (rep_cnt_d4 == 0);
    always@(posedge clk ) begin
        if(rst) masking_order <= 0;
        else if(d_cnt == 1 & ~KEYGEN_SIGN) 
            masking_order <= 1;
        else if(d_cnt == 1 & KEYGEN_SIGN & sample_rst_o_d7) 
            masking_order <= 1;
        else if(d_cnt == 0 & ~KEYGEN_SIGN) 
            masking_order <= 0;
        else if(d_cnt == 0 & KEYGEN_SIGN & sample_rst_o_d7) 
            masking_order <= 0;                  
        else if(Single_s_flag|keyGen_flag)
            masking_order <= 0;
    end
    reg add_flag;
    reg [8:0]add_cnt;reg add_flag_d,add_flag_d1;
    always@(posedge clk ) begin
        if(rst)  add_cnt <= 0;
        else if(add_flag) add_cnt <= add_cnt + 1;
        else if(add_24_out_rst_o) add_cnt <= 0;
    end 
    always@(posedge clk ) begin
        if(rst)  add_flag <= 0;
        else case(bram_state)
            7'd34,7'd35,7'd51,7'd52:if(add_cnt < 255) add_flag <=1; else add_flag <=0;   
            default:add_flag <= 0;
        endcase
    end  
    wire [63:0] stream_out;
    always@(posedge clk ) begin
        if(rst)  begin Rng_q_24_1 <= 0; Rng_q_24_2 <= 0; Rng_q_25_1 <= 0; Rng_q_25_2 <= 0 ;  end
        else  begin Rng_q_24_1 <= rng_dout[47:24] > q_24?rng_dout[47:24]-q_24:rng_dout[47:24]; 
                    Rng_q_24_2 <= rng_dout[23:0] > q_24?rng_dout[23:0]-q_24:rng_dout[23:0]; 
                    Rng_q_25_1 <= rng_dout[49:25] > q_25?rng_dout[49:25]-q_25:rng_dout[49:25] ; 
                    Rng_q_25_2 <= rng_dout[24:0] > q_25?rng_dout[24:0]-q_25:rng_dout[24:0] ; 
              end
    end

    wire add_flag1 = KEYGEN_SIGN?Cob_outflag_d2:sampleU_flag_d1;
    always@(posedge clk) begin
        if(rst) begin  add_24_flag_i <= 0;  add_24_din1 <= 0; add_24_din2 <= 0; end
        else case(bram_state)
            7'd1 : begin  add_24_flag_i <= rng_in_flag_d;  add_24_din1 <= 0; add_24_din2 <= {Rng_q_24_1, Rng_q_24_2}; end
            7'd3,7'd31 : begin  add_24_flag_i <= add_flag1;  add_24_din1 <=add_flag1?( KEYGEN_SIGN?Cob_out_24_d2:{sample_D_24_1_d1, sample_D_24_2_d1}):0; 
                        add_24_din2 <= masking_order_d?bram_a_25_douta[47:0]:(zero_masking?0:bram_a_24_douta[47:0]); end
            7'd5,7'd49 : begin  add_24_flag_i <= rng_in_flag_d1;  add_24_din1 <= rng_in_flag_d1?bram_a_24_douta:0; add_24_din2 <= rng_d; end
            7'd34,7'd51: begin  add_24_flag_i <= add_flag_d1; add_24_din1 <= bram_a_24_douta[47:0]; add_24_din2 <= bram_a_25_douta[47:0]; end
            7'd20: begin  add_24_flag_i <= rng_in_flag_d1; add_24_din1 <= KEYGEN_SIGN?bram_r_24_douta[47:0]:bram_s_24_douta[47:0]; add_24_din2 <= rng_d; end 
            default:begin  add_24_flag_i <= 0;  add_24_din1 <= 0; add_24_din2 <= 0; end
        endcase
    end
//                                             A25 
    always@(posedge clk ) begin
        if(rst) 
            add_25_mod <= 0;
    end
    always@(posedge clk ) begin
        if(rst) q_mod <= 0;
        else case(bram_state)
            7'd1,7'd5,7'd20,7'd49 :q_mod <= 1;
            7'd2,7'd6,7'd21,7'd50 : q_mod <= 0;
            default: q_mod <= 0;
        endcase
    end
    
    always@(posedge clk ) begin
        if(rst) begin  add_25_flag_i <= 0;  add_25_din1 <= 0; add_25_din2 <= 0; end
        else case(bram_state)
            7'd2 : begin  add_25_flag_i <= rng_in_flag_d;  add_25_din1 <= 0; add_25_din2 <= {Rng_q_25_1, Rng_q_25_2}; end
            7'd3,7'd31 :begin add_25_flag_i <=  add_flag1;  add_25_din1 <= add_flag1?( KEYGEN_SIGN?Cob_out_25_d2:{sample_sign1_d,sample_D_24_1_d1,sample_sign2_d, sample_D_24_2_d1}):0; 
                    add_25_din2 <= masking_order_d?bram_a_24_douta:(zero_masking?0:bram_a_25_douta); end                  
            7'd6,7'd50 : begin  add_25_flag_i <= rng_in_flag_d1;  add_25_din1 <= rng_in_flag_d1?bram_a_25_douta:0; add_25_din2 <= rng_d1; end
            7'd35,7'd52:begin  add_25_flag_i <= add_flag_d1;  add_25_din1 <= bram_a_24_douta[49:0]; add_25_din2 <=  bram_a_25_douta[49:0]; end
            7'd21:begin  add_25_flag_i <= rng_in_flag_d1;  add_25_din1 <= KEYGEN_SIGN?bram_r_25_douta:bram_s_25_douta; add_25_din2 <= rng_d1; end 
            default: begin  add_25_flag_i <= 0;  add_25_din1 <= 0; add_25_din2 <= 0; end
        endcase
    end
    //                                                  S25 
    always@(posedge clk ) begin
        if(rst) begin  sub_25_flag_i <= 0;  sub_25_din1 <= 0; sub_25_din2 <= 0; end
        else case(bram_state)
            7'd2 : begin  sub_25_flag_i <= rng_in_flag_d;  sub_25_din1 <= 0; sub_25_din2 <= {Rng_q_25_1, Rng_q_25_2}; end
            7'd6,7'd50 : begin  sub_25_flag_i <= rng_in_flag_d1;  sub_25_din1 <= rng_in_flag_d1?bram_a_24_douta:0; sub_25_din2 <= rng_d1; end
            7'd21:begin  sub_25_flag_i <= rng_in_flag_d1;  sub_25_din1 <= KEYGEN_SIGN?bram_r_24_douta:bram_s_24_douta; sub_25_din2 <= rng_d1; end 
            
            default: begin  sub_25_flag_i <= 0;  sub_25_din1 <= 0; sub_25_din2 <= 0; end
        endcase
    end

    always@(posedge clk ) begin
        if(rst) begin  sub_24_flag_i <= 0;  sub_24_din1 <= 0; sub_24_din2 <= 0; end
        else case(bram_state)
            7'd1 : begin  sub_24_flag_i <= rng_in_flag_d;  sub_24_din1 <= 0; sub_24_din2 <= {Rng_q_24_1,1'b0, Rng_q_24_2}; end
            7'd5,7'd49 : begin  sub_24_flag_i <= rng_in_flag_d1;  sub_24_din1 <= rng_in_flag_d1?{bram_a_25_douta[47:24],1'b0,bram_a_25_douta[23:0]}:0; sub_24_din2 <= {rng_d[47:24],1'b0, rng_d[23:0]}; end
            7'd20: begin  sub_24_flag_i <= rng_in_flag_d1; sub_24_din1 <= KEYGEN_SIGN?{bram_r_25_douta[47:24],1'b0,bram_r_25_douta[23:0]}:{bram_s_25_douta[47:24],1'b0,bram_s_25_douta[23:0]}; sub_24_din2 <= {rng_d[47:24],1'b0, rng_d[23:0]}; end 
            default: begin  sub_24_flag_i <= 0;  sub_24_din1 <= 0; sub_24_din2 <= 0; end
        endcase
    end
    
    
    
    wire [47:0] add_24 = {add_25_dout[49:25],add_25_dout[23:0]};
    wire [47:0] sub_24 = {sub_25_dout[49:25],sub_25_dout[23:0]};
    // ----------------------------------------  bram_a_24 // no keygen_sign in round part
    always@(posedge clk) begin
          case(bram_state)
              7'd2,7'd5,7'd6,7'd49,7'd50:begin bram_a_24_ena <= rng_in_flag; bram_a_24_wra <= 0;   end
              7'd3,7'd31: begin bram_a_24_ena <= KEYGEN_SIGN?Cob_outflag:sampleU_flag; bram_a_24_wra <= 0;   end
              7'd7,7'd13,7'd18,7'd19,7'd20,7'd21,7'd25,7'd29,7'd37,7'd41,7'd45,7'd47,7'd60,7'd61,7'd65,7'd66,7'd67,7'd72,7'd79,7'd80: begin bram_a_24_ena <= ntt_in_flag; bram_a_24_wra <= 0; end
              7'd16,7'd24,7'd30,7'd42,7'd58,7'd63,7'd68,7'd75:begin bram_a_24_ena <= ntt_out_flag; bram_a_24_wra <= 1;   end
              7'd35,7'd34,7'd51,7'd52:begin bram_a_24_ena <= add_flag; bram_a_24_wra <= 0;   end 
              7'd40: if(sampleC_flag & ~Chash_flag) begin bram_a_24_ena <= 1; bram_a_24_wra <= 0; end else begin bram_a_24_ena <= 0; bram_a_24_wra <= 0; end
              7'd8:begin bram_a_24_ena <= ntt_out_flag; bram_a_24_wra <= 1;   end
            default:begin bram_a_24_ena <= 0; bram_a_24_wra <= 0; end
        endcase
    end
    
    always@(posedge clk) begin
         case(bram_state)
            //7'd1,7'd2,7'd5,7'd6,7'd50 :begin bram_a_24_enb <=  sub_25_flag_o ; bram_a_24_wrb <= 1;   end
            7'd2,7'd6,7'd50 :begin bram_a_24_enb <=  sub_25_flag_o ; bram_a_24_wrb <= 1;   end                               /////////
            7'd1,7'd5:begin bram_a_24_enb <=  sub_24_flag_o ; bram_a_24_wrb <= 1;   end
            7'd3,7'd4,7'd31,7'd49:begin bram_a_24_enb <= add_24_flag_o; bram_a_24_wrb <= add_24_flag_o;   end
            7'd7,7'd13,7'd25,7'd29,7'd41,7'd67: begin bram_a_24_enb <= ntt_in_flag; bram_a_24_wrb <= 0; end
            7'd16,7'd19,7'd21,7'd24,7'd30,7'd42,7'd45,7'd48,7'd58,7'd61,7'd63,7'd65,7'd68,7'd75:begin bram_a_24_enb <= ntt_out_flag; bram_a_24_wrb <= 1;   end
            7'd34:if(add_24_flag_o) begin bram_a_24_enb <= 1; bram_a_24_wrb <= 1;   end
                 else begin bram_a_24_enb <= 0; bram_a_24_wrb <= 0; end 
            7'd40: if(Chash2_Dout_flag & ~Chash_flag) begin bram_a_24_enb <= 1; bram_a_24_wrb <= 1; end else begin bram_a_24_enb <= 0;bram_a_24_wrb <= 0;  end   
            7'd79,7'd80: begin bram_a_24_enb <= check_z_flag; bram_a_24_wrb <= 1;   end    
            7'd8:begin bram_a_24_enb <= ntt_out_flag; bram_a_24_wrb <= 1;   end
            default:begin bram_a_24_enb <= 0; bram_a_24_wrb <= 0; end
        endcase
    end 
    reg [11:0] a_addra_offset,a_addra_gap;
    always@(posedge clk) begin
         case(bram_state)
            7'd1,7'd5,7'd7,7'd12,7'd16,7'd18,7'd20,7'd24,7'd34,7'd36,7'd37,7'd49,7'd51,7'd58,7'd60,7'd63,7'd65,7'd67,7'd68,7'd72,7'd75,7'd79:a_addra_offset <= 0 ;
            7'd2,7'd6,7'd13,7'd14,7'd19,7'd25,7'd30,7'd35,7'd50,7'd52,7'd61,7'd66,7'd80:a_addra_offset <= 256 ;
            7'd3,7'd31:a_addra_offset <= masking_order_d?256:0; 
            7'd21,7'd29:a_addra_offset <= 512 ;
            7'd41,7'd42,7'd45,7'd47,7'd8:a_addra_offset <= 768 ;
            default: a_addra_offset <=  0;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3,7'd31:if(KEYGEN_SIGN) begin if(bram_a_24_ena) a_addra_gap <= a_addra_gap + 1 ; else if(sample_bram_start) a_addra_gap <= 1; end
                 else begin if(bram_a_24_ena) a_addra_gap <= a_addra_gap + 1 ; else a_addra_gap <= 1; end
            7'd1,7'd2,7'd5,7'd6,7'd7,7'd13,7'd18,7'd19,7'd20,7'd21,7'd24,7'd30,7'd34,7'd35,7'd41,7'd45,7'd47,7'd49,7'd50,7'd52,7'd51,7'd60,7'd61,7'd65,7'd66,7'd68,7'd75,7'd80: if(bram_a_24_ena) a_addra_gap <= a_addra_gap + 1 ; else a_addra_gap <= 1;
            7'd16,7'd25,7'd29,7'd42,7'd58,7'd63,7'd67,7'd8: if(bram_a_24_ena) a_addra_gap <= a_addra_gap + 2 ; else a_addra_gap <= 2;
            7'd36,7'd71,7'd78:a_addra_gap <= 0;
            7'd37,7'd72,7'd79:if(bram_a_24_ena& ntt_cnt[0]) a_addra_gap <= a_addra_gap + 1;
            default: a_addra_gap <= 1;
        endcase
    end
    always@(posedge clk ) begin
         case(bram_state)
            7'd3,7'd31:if(KEYGEN_SIGN) begin if (bram_a_24_ena) bram_a_24_addra <= a_addra_gap + a_addra_offset ; else if(sample_bram_start) bram_a_24_addra <= a_addra_offset;  else bram_a_24_addra <= bram_a_24_addra; end
                else begin if (bram_a_24_ena) bram_a_24_addra <= a_addra_gap + a_addra_offset ; else bram_a_24_addra <= a_addra_offset; end
            7'd8,7'd1,7'd2,7'd5,7'd6,7'd7,7'd13,7'd16,7'd18,7'd19,7'd20,7'd21,7'd24,7'd25,7'd29,7'd30,7'd34,7'd35,7'd37,7'd41,7'd42,7'd45,7'd47,7'd49,7'd50,7'd52,7'd51,7'd58,7'd60,7'd61,7'd63,7'd65,7'd66,7'd67,7'd68,7'd72,7'd75,7'd79,7'd80:if (bram_a_24_ena) bram_a_24_addra <= a_addra_gap + a_addra_offset ; else bram_a_24_addra <= a_addra_offset;
            7'd40: if(sampleC_flag & ~Chash_flag) begin bram_a_24_addra <= {2'b11,sample_D_24_1[9:2]};  end
            default:bram_a_24_addra <= 0;
        endcase
    end
    always@(posedge clk) begin
        case(bram_state)
            7'd16,7'd42,7'd58,7'd63:bram_a_24_dina <= {ntt_out1[23:0],ntt_out2[23:0]}; 
            7'd24,7'd68,7'd75:bram_a_24_dina <= {ntt_out1[23:0],ntt_out3[23:0]}; 
            7'd30:bram_a_24_dina <= {ntt_out1[24:0],ntt_out3[24:0]}; 
            default:bram_a_24_dina <= 0;   
        endcase  
    end 
    // -------------------------------      a 24 port b
    reg [11:0]a_addrb_gap,a_addrb_offset;
    always@(posedge clk) begin
         case(bram_state)
            // rng
            7'd1,7'd5,7'd34,7'd45,7'd49,7'd65: a_addrb_offset <= 0;
            7'd2,7'd6,7'd19,7'd48,7'd50,7'd61,7'd79,7'd80 : a_addrb_offset <= 256;
            7'd3,7'd4,7'd31,7'd32: a_addrb_offset <= masking_order_Q?256:0;
            7'd7,7'd24,7'd68,7'd75: a_addrb_offset <= 128;
            7'd13,7'd30: a_addrb_offset <= 384;
            7'd16,7'd58,7'd63,7'd67: a_addrb_offset <= 1;
            7'd21:a_addrb_offset <= 512;
            7'd25:a_addrb_offset <= 257;
            7'd29:a_addrb_offset <= 513;
            7'd41:a_addrb_offset <= 768+128;
            7'd42,7'd8:a_addrb_offset <= 768+1;
            default: a_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3,7'd4,7'd31,7'd32:if(KEYGEN_SIGN) begin if(bram_a_24_enb) a_addrb_gap <= a_addrb_gap + 1 ; else if(sample_bram_start) a_addrb_gap <= 1; end
                      else begin if(bram_a_24_enb) a_addrb_gap <= a_addrb_gap + 1 ; else a_addrb_gap <= 1; end
            7'd1,7'd2,7'd5,7'd6,7'd7,7'd13,7'd19,7'd21,7'd24 ,7'd30,7'd34,7'd41,7'd45,7'd48,7'd49,7'd50 ,7'd61,7'd65,7'd68,7'd75,7'd79,7'd80: if(bram_a_24_enb) a_addrb_gap <= a_addrb_gap + 1 ; else a_addrb_gap <= 1;
            7'd16,7'd25,7'd29 ,7'd42,7'd58,7'd63,7'd67,7'd8: if(bram_a_24_enb) a_addrb_gap <= a_addrb_gap + 2 ; else a_addrb_gap <= 2;
            default: a_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3, 7'd4,7'd31,7'd32 : if(KEYGEN_SIGN) begin if (bram_a_24_enb)     bram_a_24_addrb <= a_addrb_gap + a_addrb_offset ;  else if(sample_bram_start) bram_a_24_addrb <= a_addrb_offset; else bram_a_24_addrb <= bram_a_24_addrb;  end
                         else begin if (bram_a_24_enb)     bram_a_24_addrb <= a_addrb_gap + a_addrb_offset ;  else bram_a_24_addrb <= a_addrb_offset;  end
            7'd8,7'd1,7'd2,7'd5,7'd6,7'd7,7'd13,7'd16,7'd19,7'd21,7'd24,7'd25,7'd29,7'd30 ,7'd34,7'd41,7'd42,7'd45,7'd48,7'd49,7'd50,7'd58,7'd61,7'd63 ,7'd65,7'd67,7'd68,7'd75,7'd79,7'd80:if (bram_a_24_enb)     bram_a_24_addrb <= a_addrb_gap + a_addrb_offset ;  else bram_a_24_addrb <= a_addrb_offset;  
            7'd40 :if(Chash2_Dout_flag & ~Chash_flag) begin bram_a_24_addrb <= Chash2_addr_o; end
            default: bram_a_24_addrb <= 0;
        endcase    
    end 
    always@(posedge clk) begin
        case(bram_state)
            7'd1,7'd5,7'd34,7'd49:bram_a_24_dinb <= add_24_dout;
            7'd2,7'd6,7'd50 :bram_a_24_dinb <= sub_25_dout;
            7'd3,7'd4,7'd31,7'd32: bram_a_24_dinb <= masking_order_Q?add_25_dout:add_24_dout; 
            7'd16,7'd42,7'd58,7'd63:bram_a_24_dinb <= {ntt_out3[23:0],ntt_out4[23:0]}; 
            7'd19,7'd21,7'd48,7'd61:bram_a_24_dinb <= {ntt_out1[24:0],ntt_out3[24:0]}; 
            7'd24,7'd68,7'd75:bram_a_24_dinb <= {ntt_out2[23:0],ntt_out4[23:0]}; 
            7'd30:bram_a_24_dinb <= {ntt_out2[24:0],ntt_out4[24:0]}; 
            7'd40:if(Chash2_Dout_flag & ~Chash_flag) bram_a_24_dinb <= Chash2_Dout_24;    else     bram_a_24_dinb <= 0; 
            7'd45,7'd65:bram_a_24_dinb <= {ntt_out1[23:0],ntt_out3[23:0]}; 
            7'd79,7'd80:bram_a_24_dinb <= check_z[47:32]; 
            default : bram_a_24_dinb <= 0;   
        endcase    
    end 
    

    // ----------------------------------------  bram_a_25
    always@(posedge clk) begin
        case(bram_state)
              7'd1,7'd2,7'd5,7'd6,7'd49,7'd50:begin bram_a_25_ena <= rng_in_flag; bram_a_25_wra <= 0;   end
              7'd3,7'd31:  begin bram_a_25_ena <=  KEYGEN_SIGN?Cob_outflag:sampleU_flag; bram_a_25_wra <= 0;   end
              7'd9,7'd11,7'd18,7'd19,7'd20,7'd21,7'd23,7'd25,7'd27,7'd37,7'd43,7'd46,7'd48,7'd61,7'd60,7'd66,7'd65,7'd69,7'd72,7'd79:  begin bram_a_25_ena <= ntt_in_flag; bram_a_25_wra <= 0; end
              7'd17,7'd26,7'd28,7'd44,7'd59,7'd64,7'd70,7'd77:begin bram_a_25_ena <= ntt_out_flag; bram_a_25_wra <= 1; end
              7'd34,7'd35,7'd52,7'd51:begin bram_a_25_ena <= add_flag; bram_a_25_wra <= 0;   end 
              7'd40:if(sampleC_flag & ~Chash_flag) begin bram_a_25_ena <= 1; bram_a_25_wra <= 0; end else begin bram_a_25_ena <= 0;  bram_a_25_wra <= 0; end
              7'd8:begin bram_a_25_ena <= ntt_out_flag; bram_a_25_wra <= 1; end
            default:begin bram_a_25_ena <= 0; bram_a_25_wra <= 0;  end
        endcase
    end
    
    always@(posedge clk) begin
          case(bram_state)
            //7'd1,7'd2,7'd5,7'd6,7'd49,7'd50 :begin bram_a_25_enb <=  sub_25_flag_o; bram_a_25_wrb <= 1;   end
            //
            7'd2,7'd6,7'd50 :begin bram_a_25_enb <=  sub_25_flag_o; bram_a_25_wrb <= 1;   end                                     ///////
            7'd1,7'd5,7'd49 :begin bram_a_25_enb <=  sub_24_flag_o; bram_a_25_wrb <= 1;   end
             7'd3,7'd31: begin bram_a_25_enb <= add_24_flag_o; bram_a_25_wrb <= add_24_flag_o;   end
             7'd9,7'd11,7'd23,7'd27,7'd43,7'd69:  begin bram_a_25_enb <= ntt_in_flag; bram_a_25_wrb <= 0; end
             7'd17,7'd18,7'd20,7'd26,7'd28,7'd44,7'd46,7'd47,7'd59,7'd60,7'd64,7'd66,7'd70,7'd77:begin bram_a_25_enb <= ntt_out_flag; bram_a_25_wrb <= 1;   end
             7'd35:if(add_25_flag_o) begin bram_a_25_enb <= 1; bram_a_25_wrb <= 1;   end
                 else begin bram_a_25_enb <= 0; bram_a_25_wrb <= 0; end 
             7'd40:if(Chash2_Dout_flag & ~Chash_flag) begin bram_a_25_enb <= 1; bram_a_25_wrb <= 1; end  else begin bram_a_25_enb <= 0;bram_a_25_wrb <= 0;  end    
             7'd8:begin bram_a_25_enb <= ntt_out_flag; bram_a_25_wrb <= 1; end
            default:begin bram_a_25_enb <= 0;  bram_a_25_wrb <= 0; end
        endcase
    end 
    reg [11:0] a_25_addra_offset,a_25_addra_gap;
    always@(posedge clk) begin
        case(bram_state)
            // rng
            7'd1,7'd5,7'd11,7'd12,7'd17,7'd19,7'd21,7'd28,7'd34,7'd49,7'd51,7'd59,7'd61,7'd64,7'd66,7'd69,7'd70,7'd72,7'd77,7'd79:a_25_addra_offset <= 0 ;
            7'd2,7'd6,7'd9,7'd10,7'd18,7'd23,7'd26,7'd35,7'd50,7'd52,7'd60,7'd65 :a_25_addra_offset <= 256 ;
            7'd3,7'd31:a_25_addra_offset <= masking_order_d?0:256; 
            7'd20,7'd27:a_25_addra_offset <= 512 ;
            7'd43,7'd44,7'd46,7'd48,7'd8:a_25_addra_offset <= 768 ;
            7'd36,7'd37: a_25_addra_offset <=(~masking_flag)?256:0;
            default:a_25_addra_offset <= 0 ;
        endcase
    end
    always@(posedge clk ) begin
         case(bram_state)
            // rng
            7'd3,7'd31: if(KEYGEN_SIGN ) begin if(bram_a_25_ena) a_25_addra_gap <= a_25_addra_gap + 1 ; else if(sample_bram_start) a_25_addra_gap <= 1; else a_25_addra_gap <= a_25_addra_gap;  end
                    else begin if(bram_a_25_ena) a_25_addra_gap <= a_25_addra_gap + 1 ; else a_25_addra_gap <= 1; end
            7'd1,7'd2,7'd5,7'd6,7'd9,7'd11,7'd18,7'd19,7'd20,7'd21,7'd26,7'd28,7'd34,7'd35,7'd43,7'd46,7'd48,7'd49,7'd50,7'd52,7'd51,7'd61,7'd60,7'd66,7'd65,7'd70,7'd77: if(bram_a_25_ena) a_25_addra_gap <= a_25_addra_gap + 1 ; else a_25_addra_gap <= 1;
            7'd17,7'd23,7'd27,7'd44,7'd59,7'd64,7'd69,7'd8: if(bram_a_25_ena) a_25_addra_gap <= a_25_addra_gap + 2 ; else a_25_addra_gap <= 2;
            7'd36,7'd71,7'd78:a_25_addra_gap <= 0;
            7'd37,7'd72,7'd79:if(bram_a_25_ena& ntt_cnt[0]) a_25_addra_gap <= a_25_addra_gap + 1;
                   else a_25_addra_gap <= a_25_addra_gap; 
             default:a_25_addra_gap <=  1;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3,7'd31:if(KEYGEN_SIGN) begin if (bram_a_25_ena) bram_a_25_addra <= a_25_addra_gap + a_25_addra_offset ; else if(sample_bram_start) bram_a_25_addra <= a_25_addra_offset; else bram_a_25_addra <= bram_a_25_addra;  end
                else begin if (bram_a_25_ena) bram_a_25_addra <= a_25_addra_gap + a_25_addra_offset ; else bram_a_25_addra <= a_25_addra_offset; end
            7'd8,7'd1,7'd2,7'd5,7'd6,7'd9,7'd11,7'd17,7'd18,7'd19,7'd20,7'd21,7'd23,7'd26,7'd27,7'd28,7'd34,7'd35,7'd37,7'd43,7'd44,7'd46,7'd48,7'd49,7'd50,7'd52,7'd51,7'd59,7'd61,7'd60,7'd64,7'd66,7'd65,7'd69,7'd70,7'd72,7'd77,7'd79:if (bram_a_25_ena) bram_a_25_addra <= a_25_addra_gap + a_25_addra_offset ; else bram_a_25_addra <= a_25_addra_offset;
            7'd40:if(sampleC_flag & ~Chash_flag) begin bram_a_25_addra <= {2'b11,sample_D_24_1[9:2] };  end
            default: bram_a_25_addra <= 0;
       endcase
    end
    always@(posedge clk) begin
        case(bram_state)
            7'd17,7'd44,7'd59,7'd64:bram_a_25_dina <=  {ntt_out1[24:0],ntt_out2[24:0]}; 
            7'd26,7'd70,7'd77:bram_a_25_dina <=  {ntt_out1[24:0],ntt_out3[24:0]};
            7'd28:bram_a_25_dina <=  {ntt_out1[23:0],ntt_out3[23:0]};
            default:bram_a_25_dina <= 0;   
        endcase   
    end 
    // -------------------------------      a 25 port b
    reg [11:0]a_25_addrb_gap,a_25_addrb_offset;
    always@(posedge clk) begin
        case(bram_state)
            // rng
            7'd1,7'd5,7'd35,7'd47,7'd49,7'd66: a_25_addrb_offset <= 0;
            7'd2,7'd6,7'd18,7'd46,7'd50,7'd60 : a_25_addrb_offset <= 256;
            7'd3,7'd4,7'd31,7'd32: a_25_addrb_offset <= masking_order_Q?0:256;
            7'd9,7'd26: a_25_addrb_offset <= 384;
            7'd11,7'd28,7'd70,7'd77:a_25_addrb_offset <= 128;
            7'd17,7'd59,7'd64,7'd69:a_25_addrb_offset <= 1;
            7'd20: a_25_addrb_offset <= 512;
            7'd23: a_25_addrb_offset <= 257;
            7'd27: a_25_addrb_offset <= 513;
            7'd43: a_25_addrb_offset <= 768+128;
            7'd44,7'd8: a_25_addrb_offset <= 768+1; // 8: clear c from last time
            default:a_25_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3,7'd4,7'd31,7'd32:if(KEYGEN_SIGN) begin if(bram_a_25_enb) a_25_addrb_gap <= a_25_addrb_gap + 1 ; else if(sample_bram_start) a_25_addrb_gap <= 1; else a_25_addrb_gap <= a_25_addrb_gap; end
                      else begin if(bram_a_25_enb) a_25_addrb_gap <= a_25_addrb_gap + 1 ; else a_25_addrb_gap <= 1; end
            7'd1,7'd2,7'd5,7'd6,7'd9 ,7'd11,7'd18,7'd20,7'd26,7'd28,7'd35,7'd43,7'd46,7'd47,7'd49,7'd50,7'd60 ,7'd66,7'd70,7'd77: if(bram_a_25_enb) a_25_addrb_gap <= a_25_addrb_gap + 1 ; else a_25_addrb_gap <= 1;
            7'd17,7'd23,7'd27,7'd44,7'd59,7'd64,7'd69,7'd8: if(bram_a_25_enb) a_25_addrb_gap <= a_25_addrb_gap + 2 ; else a_25_addrb_gap <= 2;
            default:  a_25_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
         case(bram_state)
            7'd3,7'd4,7'd31,7'd32: if(KEYGEN_SIGN) begin if (bram_a_25_enb)     bram_a_25_addrb <= a_25_addrb_gap + a_25_addrb_offset ;  else if(sample_bram_start) bram_a_25_addrb <= a_25_addrb_offset; else  bram_a_25_addrb <= bram_a_25_addrb;  end
                        else begin if (bram_a_25_enb)     bram_a_25_addrb <= a_25_addrb_gap + a_25_addrb_offset ;  else bram_a_25_addrb <= a_25_addrb_offset;   end
            7'd8,7'd1,7'd2,7'd5,7'd6,7'd9,7'd11 ,7'd17,7'd18,7'd20,7'd23,7'd26,7'd27,7'd28,7'd35,7'd43,7'd44,7'd46,7'd47,7'd49,7'd50,7'd59,7'd60,7'd64 ,7'd66,7'd69,7'd70,7'd77:if (bram_a_25_enb)     bram_a_25_addrb <= a_25_addrb_gap + a_25_addrb_offset ;  else bram_a_25_addrb <= a_25_addrb_offset;  
            7'd40: if(Chash2_Dout_flag & ~Chash_flag) begin bram_a_25_addrb <= Chash2_addr_o; end else   bram_a_25_addrb <= 0; 
            default: bram_a_25_addrb <=0;
        endcase    
    end 
    always@(posedge clk) begin
         case(bram_state)
            7'd1,7'd5,7'd49:bram_a_25_dinb <= {sub_24_dout[48:25],sub_24_dout[23:0]};                                                                       //////
            7'd2,7'd6,7'd35,7'd50 :bram_a_25_dinb <= add_25_dout;
            7'd3,7'd4,7'd31,7'd32:bram_a_25_dinb <=  masking_order_Q?add_24_dout:add_25_dout;
            7'd17,7'd44,7'd59,7'd64:bram_a_25_dinb <=  {ntt_out3[24:0],ntt_out4[24:0]}; 
            7'd18,7'd20,7'd47,7'd60:bram_a_25_dinb <=  {ntt_out1[23:0],ntt_out3[23:0]}; 
            7'd26,7'd70,7'd77:bram_a_25_dinb <=  {ntt_out2[24:0],ntt_out4[24:0]}; 
            7'd28:bram_a_25_dinb <=  {ntt_out2[23:0],ntt_out4[23:0]}; 
            7'd40: if(Chash2_Dout_flag & ~Chash_flag) bram_a_25_dinb <= Chash2_Dout_25;   else     bram_a_25_dinb <= 0;
            7'd46,7'd66: bram_a_25_dinb <=  {ntt_out1[24:0],ntt_out3[24:0]}; 
            default:bram_a_25_dinb <= 0;
        endcase    
    end 
    // -------------------------- s bram 24 -----------------------------// remain keygen_sign
    always@(posedge clk ) begin
         if(~KEYGEN_SIGN) case(bram_state)
              7'd8,7'd14: begin bram_s_24_ena <= ntt_out_flag; bram_s_24_wra <= 1;end
              7'd18,7'd21: begin bram_s_24_ena <= ntt_in_flag; bram_s_24_wra <= 0;end //
              7'd20: begin bram_s_24_ena <= ntt_in_flag ; bram_s_24_wra <= 0;end
            default:begin bram_s_24_ena <= 0; bram_s_24_wra <= 0; end
        endcase
        else case(bram_state)
              7'd45,7'd48: begin bram_s_24_ena <= ntt_in_flag; bram_s_24_wra <= 0;end //
            default:begin bram_s_24_ena <= 0; bram_s_24_wra <= 0; end
        endcase
    end
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14: begin bram_s_24_enb <= ntt_out_flag; bram_s_24_wrb <= 1;end
            7'd20: begin bram_s_24_enb <= add_24_flag_o ; bram_s_24_wrb <= 1;end
            7'd21: begin bram_s_24_enb <= add_25_flag_o ; bram_s_24_wrb <= 1;end
            default:begin bram_s_24_enb <= 0;bram_s_24_wrb <= 0;  end
        endcase
    end 
    reg [11:0] s_addra_offset,s_addra_gap;
    always@(posedge clk ) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd8:s_addra_offset <= {ells_cnt,9'b0} ;
            7'd14:s_addra_offset <={ells_cnt,9'd256} ;
            7'd18,7'd20:s_addra_offset <= {ell_cnt,9'd0}; 
            7'd21:s_addra_offset <= {ell_cnt,9'd256}; 
            default:s_addra_offset <= 0;
        endcase
        else  case(bram_state)
            7'd45:s_addra_offset <= {ells_cnt,9'b0} ;
            7'd48:s_addra_offset <= {ells_cnt,9'd256} ;
            default:s_addra_offset <= 0;
        endcase
    end 
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14:if(bram_s_24_ena) s_addra_gap <= s_addra_gap + 2 ; else s_addra_gap <= 2;
            7'd18,7'd21,7'd20:if(bram_s_24_ena) s_addra_gap <= s_addra_gap + 1 ; else s_addra_gap <= 1;
            default:s_addra_gap <= 1;
        endcase
        else case(bram_state)
            7'd45,7'd48:if(bram_s_24_ena) s_addra_gap <= s_addra_gap + 1 ; else s_addra_gap <= 1;
            default:s_addra_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd18,7'd21,7'd20:if (bram_s_24_ena) bram_s_24_addra <= s_addra_gap + s_addra_offset ; else bram_s_24_addra <= s_addra_offset;
            default:bram_s_24_addra <= 0;
        endcase
        else case(bram_state)
            7'd45,7'd48:if (bram_s_24_ena) bram_s_24_addra <= s_addra_gap + s_addra_offset ; else bram_s_24_addra <= s_addra_offset;
            default:bram_s_24_addra <= 0;
        endcase
    end
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8:bram_s_24_dina <= {ntt_out1[23:0],ntt_out2[23:0]};
            7'd14:bram_s_24_dina <= {ntt_out1[24:0],ntt_out2[24:0]};
            default: bram_s_24_dina <= 0;
        endcase    
    end 
    // -------------------------------      s 24 port b
    reg [11:0]s_addrb_gap,s_addrb_offset;
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8:  s_addrb_offset <= {ells_cnt,9'd1} ;
            7'd14: s_addrb_offset <= {ells_cnt,9'd257} ;
            7'd20: s_addrb_offset <= {ell_cnt,9'd0}; 
            7'd21: s_addrb_offset <= {ell_cnt,9'd256}; 
            default:s_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14 : if(bram_s_24_enb) s_addrb_gap <= s_addrb_gap + 2 ; else s_addrb_gap <= 2;
            7'd20,7'd21 : if(bram_s_24_enb) s_addrb_gap <= s_addrb_gap + 1 ; else s_addrb_gap <= 1;
            default:s_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd20,7'd21 :if (bram_s_24_enb)     bram_s_24_addrb <= s_addrb_gap + s_addrb_offset ;  else bram_s_24_addrb <= s_addrb_offset;  
            default:  bram_s_24_addrb <= 0; 
        endcase  
    end 
    always@(posedge clk ) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd8:bram_s_24_dinb <= {ntt_out3[23:0],ntt_out4[23:0]}; 
            7'd14:bram_s_24_dinb <= {ntt_out3[24:0],ntt_out4[24:0]};  
            7'd20:bram_s_24_dinb <= add_24_dout;  
            7'd21:bram_s_24_dinb <= sub_25_dout;  
            default:  bram_s_24_dinb <= 0;  
        endcase  
    end 
    // -------------------------- s bram 25 -----------------------------//
    
    always@(posedge clk ) begin
         if(~KEYGEN_SIGN) case(bram_state)
              7'd10,7'd12: begin bram_s_25_ena <= ntt_out_flag; bram_s_25_wra <= 1;end
              7'd19,7'd20: begin bram_s_25_ena <= ntt_in_flag; bram_s_25_wra <= 0;end //  & (krng_cnt == k - 1)
              //7'd21: begin bram_s_25_ena <= ntt_in_flag & (krng_cnt == k - 1); bram_s_25_wra <= 0;end //  
              7'd21: begin bram_s_25_ena <= ntt_in_flag; bram_s_25_wra <= 0;end //  
            default:begin bram_s_25_ena <= 0;  bram_s_25_wra <= 0; end
        endcase 
        else  case(bram_state)
            7'd46,7'd47: begin bram_s_25_ena <= ntt_in_flag; bram_s_25_wra <= 0;end 
        endcase
    end
    always@(posedge clk ) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12: begin bram_s_25_enb <= ntt_out_flag; bram_s_25_wrb <= 1;end
            7'd20: begin bram_s_25_enb <= add_24_flag_o ; bram_s_25_wrb <= 1;end                                  
            7'd21: begin bram_s_25_enb <= add_25_flag_o ; bram_s_25_wrb <= 1;end
            default:begin bram_s_25_enb <= 0; bram_s_25_wrb <= 0; end
        endcase
    end 
    reg [11:0] s_25_addra_offset,s_25_addra_gap;
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd10:s_25_addra_offset <= {ells_cnt,9'd256} ;
            7'd12:s_25_addra_offset <={ells_cnt,9'd0} ;
            7'd19,7'd21:s_25_addra_offset <={ell_cnt,9'd256} ;
            7'd20:s_25_addra_offset <={ell_cnt,9'd0} ;
            default: s_25_addra_offset <= 0;
        endcase
        else case(bram_state)
            7'd46:s_25_addra_offset <={ells_cnt,9'd256} ;
            7'd47:s_25_addra_offset <={ells_cnt,9'd0} ;
            default: s_25_addra_offset <= 0;
        endcase
    end 
    always@(posedge clk ) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12:if(bram_s_25_ena) s_25_addra_gap <= s_25_addra_gap + 2 ; else s_25_addra_gap <= 2;
            7'd19,7'd20,7'd21:if(bram_s_25_ena) s_25_addra_gap <= s_25_addra_gap + 1 ; else s_25_addra_gap <= 1;
            default:s_25_addra_gap <= 1;
        endcase
        else case(bram_state)
            7'd46,7'd47:if(bram_s_25_ena) s_25_addra_gap <= s_25_addra_gap + 1 ; else s_25_addra_gap <= 1;
            default:s_25_addra_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd19,7'd20,7'd21:if (bram_s_25_ena) bram_s_25_addra <= s_25_addra_gap + s_25_addra_offset ; else bram_s_25_addra <= s_25_addra_offset;
            default: bram_s_25_addra <= 0;
        endcase
        else case(bram_state)
            7'd46,7'd47:if (bram_s_25_ena) bram_s_25_addra <= s_25_addra_gap + s_25_addra_offset ; else bram_s_25_addra <= s_25_addra_offset;
            default: bram_s_25_addra <= 0;
        endcase
    end
    always@(posedge clk) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd10:bram_s_25_dina <= {ntt_out1[24:0],ntt_out2[24:0]};
            7'd12:bram_s_25_dina <= {ntt_out1[23:0],ntt_out2[23:0]};
            default: bram_s_25_dina <= 0; 
        endcase    
    end 
    // -------------------------------      s 25 port b
    reg [11:0]s_25_addrb_offset,s_25_addrb_gap;
    always@(posedge clk ) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd10:  s_25_addrb_offset <= {ells_cnt,9'd257} ;
            7'd12:  s_25_addrb_offset <= {ells_cnt,9'd1} ; 
            7'd20:  s_25_addrb_offset <={ell_cnt,9'd0} ;   
            7'd21:  s_25_addrb_offset <={ell_cnt,9'd256} ;   
            default: s_25_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk ) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12 : if(bram_s_25_enb) s_25_addrb_gap <= s_25_addrb_gap + 2 ; else s_25_addrb_gap <= 2;
            7'd20,7'd21: if(bram_s_25_enb) s_25_addrb_gap <= s_25_addrb_gap + 1 ; else s_25_addrb_gap <= 1;
            default: s_25_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
        if(~KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd20,7'd21 :if (bram_s_25_enb)     bram_s_25_addrb <= s_25_addrb_gap + s_25_addrb_offset ;  else bram_s_25_addrb <= s_25_addrb_offset;  
            default: bram_s_25_addrb <= 0;   
        endcase    
    end 
    always@(posedge clk ) begin
         if(~KEYGEN_SIGN) case(bram_state)
            7'd10:bram_s_25_dinb <= {ntt_out3[24:0],ntt_out4[24:0]};   
            7'd12:bram_s_25_dinb <= {ntt_out3[23:0],ntt_out4[23:0]};  
            7'd20:bram_s_25_dinb <=  {sub_24_dout[48:25],sub_24_dout[23:0]};                                                                                //////
            7'd21:bram_s_25_dinb <= add_25_dout;  
            default:  bram_s_25_dinb <= 0; 
        endcase  
    end 
    // --------------------------  bram r ---------------------------------//
	// -------------------------- r bram 24 -----------------------------//
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
              7'd8,7'd14,7'd55: begin bram_r_24_ena <= ntt_out_flag; bram_r_24_wra <= 1;end
              7'd18,7'd21,7'd45,7'd48,7'd54,7'd60,7'd65,7'd74: begin bram_r_24_ena <= ntt_in_flag; bram_r_24_wra <= 0;end
			  7'd20: begin bram_r_24_ena <= ntt_in_flag; bram_r_24_wra <= 0;end //  & (krng_cnt == k - 1)
			  7'd40: if(sampleC_flag & ~Chash_flag) begin bram_r_24_ena <= 1; bram_r_24_wra <= 0; end else begin bram_r_24_ena <= 0; bram_r_24_wra <= 0; end
			  7'd7: begin bram_r_24_ena <= ntt_in_flag; bram_r_24_wra <= 1;end
            default:begin bram_r_24_ena <= 0; bram_r_24_wra <= 0; end
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd55: begin bram_r_24_enb <= ntt_out_flag; bram_r_24_wrb <= 1;end
            7'd20: begin bram_r_24_enb <= add_24_flag_o; bram_r_24_wrb <= 1;end //  & (krng_cnt == k - 1)
            7'd21: begin bram_r_24_enb <= add_25_flag_o ; bram_r_24_wrb <= 1;end //& (krng_cnt == k - 1)
            7'd40: if(Chash1_Dout_flag & ~Chash_flag) begin bram_r_24_enb <= 1; bram_r_24_wrb <= 1; end else begin bram_r_24_enb <= 0;bram_r_24_wrb <= 0;  end        
            7'd51: begin bram_r_24_enb <= add_24_flag_o; bram_r_24_wrb <= 1;end
            7'd54,7'd74: begin bram_r_24_enb <= ntt_in_flag; bram_r_24_wrb <= 0;end
            7'd45:begin bram_r_24_enb <= ntt_out_flag & (~masking_flag); bram_r_24_wrb <= ntt_out_flag & (~masking_flag);end
            7'd7: begin bram_r_24_enb <= ntt_in_flag; bram_r_24_wrb <= 1;end
            default:begin bram_r_24_enb <= 0; bram_r_24_wrb <= 0; end
        endcase    
    end 
    reg [11:0] r_addra_offset,r_addra_gap;
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd45:r_addra_offset <= {ells_cnt,9'b0} ;
            7'd14,7'd48:r_addra_offset <={ells_cnt,9'd256} ;
            7'd18,7'd20:r_addra_offset <= {ell_cnt,9'd0}; 
            7'd21:r_addra_offset <= {ell_cnt,9'd256};
            7'd54,7'd7:r_addra_offset <= {ell,9'd0};
            7'd55,7'd65:r_addra_offset <= {ell,8'd0};
            7'd60,7'd74:r_addra_offset <= {ell_cnt,8'd0};
            default: r_addra_offset <= 0; 
        endcase
    end 
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd55,7'd74:if(bram_r_24_ena) r_addra_gap <= r_addra_gap + 2 ; else r_addra_gap <= 2;
            7'd18,7'd21,7'd20,7'd45,7'd48,7'd54,7'd60,7'd65,7'd7:if(bram_r_24_ena) r_addra_gap <= r_addra_gap + 1 ; else r_addra_gap <= 1;
            default: r_addra_gap <= 1;
        endcase
    end
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd18,7'd21,7'd20,7'd45,7'd48,7'd54,7'd55,7'd60,7'd65,7'd74,7'd7:if (bram_r_24_ena) bram_r_24_addra <= r_addra_gap + r_addra_offset ; else bram_r_24_addra <= r_addra_offset;
            7'd40: if(sampleC_flag & ~Chash_flag) begin bram_r_24_addra <= sample_D_24_1[9:2] + {ell,9'd0};  end
            default:bram_r_24_addra <= 0;
        endcase
    end
    always@(posedge clk) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd55:bram_r_24_dina <= {ntt_out1[23:0],ntt_out2[23:0]};
            7'd14:bram_r_24_dina <= {ntt_out1[24:0],ntt_out2[24:0]};
            default: bram_r_24_dina <= 0;
        endcase    
    end 
    // -------------------------------      r 24 port b
    reg [11:0]r_addrb_gap,r_addrb_offset;
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8:  r_addrb_offset <= {ells_cnt,9'd1} ;
            7'd14: r_addrb_offset <= {ells_cnt,9'd257} ;
            7'd20: r_addrb_offset <= {ell_cnt,9'd0}; 
            7'd21: r_addrb_offset <= {ell_cnt,9'd256}; 
            7'd51,7'd45:  r_addrb_offset <= {ells_cnt,8'd0} ;
            7'd54,7'd7:  r_addrb_offset <= {ell,9'd128} ;
            7'd55: r_addrb_offset <= {ell,8'd1} ;
            7'd74: r_addrb_offset <= {ell_cnt,8'd1}; 
            default: r_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd55,7'd74 : if(bram_r_24_enb) r_addrb_gap <= r_addrb_gap + 2 ; else r_addrb_gap <= 2;
			7'd20,7'd21,7'd51,7'd54,7'd45,7'd7 : if(bram_r_24_enb) r_addrb_gap <= r_addrb_gap + 1 ; else r_addrb_gap <= 1;
            default:r_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd14,7'd20,7'd21,7'd51,7'd54,7'd55,7'd74,7'd45,7'd7 :if (bram_r_24_enb)     bram_r_24_addrb <= r_addrb_gap + r_addrb_offset ;  else bram_r_24_addrb <= r_addrb_offset;  
            7'd40 :if(Chash1_Dout_flag & ~Chash_flag) begin bram_r_24_addrb <= {ell,1'b0,Chash1_addr_o[7:0]}; end
            default:bram_r_24_addrb <= 0;
        endcase 
    end 
    always@(posedge clk) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd8,7'd55:bram_r_24_dinb <= {ntt_out3[23:0],ntt_out4[23:0]}; 
            7'd14:bram_r_24_dinb <= {ntt_out3[24:0],ntt_out4[24:0]};
            7'd45:bram_r_24_dinb <= {ntt_out1[23:0],ntt_out3[23:0]};   
            7'd20,7'd51:bram_r_24_dinb <= add_24_dout;  
            7'd21:bram_r_24_dinb <= sub_25_dout;  
            7'd40:if(Chash1_Dout_flag & ~Chash_flag) bram_r_24_dinb <= Chash1_Dout_24;    else     bram_r_24_dinb <= 0; 
            default: bram_r_24_dinb <= 0; 
        endcase 
    end 
    // -------------------------- r bram 25 -----------------------------//
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
              7'd10,7'd12,7'd57,7'd8: begin bram_r_25_ena <= ntt_out_flag; bram_r_25_wra <= 1;end
              7'd19,7'd20,7'd46,7'd47,7'd56,7'd61,7'd66,7'd76: begin bram_r_25_ena <= ntt_in_flag; bram_r_25_wra <= 0;end
			  7'd21: begin bram_r_25_ena <= ntt_in_flag ; bram_r_25_wra <= 0;end //  & (krng_cnt == k - 1)
			  7'd40:if(sampleC_flag & ~Chash_flag) begin bram_r_25_ena <= 1; bram_r_25_wra <= 0; end else begin bram_r_25_ena <= 0;  bram_r_25_wra <= 0; end
			  
            default:begin bram_r_25_ena <= 0; bram_r_25_wra <= 0; end
        endcase
    end
    always@(posedge clk) begin
         if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd57,7'd8: begin bram_r_25_enb <= ntt_out_flag; bram_r_25_wrb <= 1;end
            7'd20: begin bram_r_25_enb <= add_24_flag_o; bram_r_25_wrb <= 1;end // & (krng_cnt == k - 1)
            7'd21: begin bram_r_25_enb <= add_25_flag_o ; bram_r_25_wrb <= 1;end // & (krng_cnt == k - 1)
            7'd40:if(Chash1_Dout_flag & ~Chash_flag) begin bram_r_25_enb <= 1; bram_r_25_wrb <= 1; end  else begin bram_r_25_enb <= 0;bram_r_25_wrb <= 0;  end
            7'd52: begin bram_r_25_enb <= add_25_flag_o ; bram_r_25_wrb <= 1;end
            7'd56,7'd76: begin bram_r_25_enb <= ntt_in_flag; bram_r_25_wrb <= 0;end
            7'd46:begin bram_r_25_enb <= ntt_out_flag & (~masking_flag); bram_r_25_wrb <= ntt_out_flag & (~masking_flag);end
            default:begin bram_r_25_enb <= 0;  bram_r_25_wrb <= 0;  end
        endcase
    end 
    reg [11:0] r_25_addra_offset,r_25_addra_gap;
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
			7'd10,7'd46:r_25_addra_offset <={ells_cnt,9'd256} ;
            7'd12,7'd47:r_25_addra_offset <= {ells_cnt,9'b0} ;
            7'd19,7'd21:r_25_addra_offset <={ell_cnt,9'd256} ;
            7'd20:r_25_addra_offset <={ell_cnt,9'd0} ;
            7'd56,7'd8:r_25_addra_offset <={ell,9'd0} ;
            7'd57,7'd66:r_25_addra_offset <= {ell,8'd0} ;
            7'd61,7'd76:r_25_addra_offset <= {ell_cnt,8'd0} ;
            default:r_25_addra_offset <= 0;
        endcase
    end 
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd57,7'd76:if(bram_r_25_ena) r_25_addra_gap <= r_25_addra_gap + 2 ; else r_25_addra_gap <= 2;
            7'd19,7'd20,7'd21,7'd46,7'd47,7'd56,7'd61,7'd66,7'd8:if(bram_r_25_ena) r_25_addra_gap <= r_25_addra_gap + 1 ; else r_25_addra_gap <= 1;
            default: r_25_addra_gap <= 1;
        endcase
    end
    always@(posedge clk) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd19,7'd20,7'd21,7'd46,7'd47,7'd56,7'd57,7'd61,7'd66,7'd76,7'd8:if (bram_r_25_ena) bram_r_25_addra <= r_25_addra_gap + r_25_addra_offset ; else bram_r_25_addra <= r_25_addra_offset;
            7'd40:if(sampleC_flag & ~Chash_flag) begin bram_r_25_addra <= sample_D_24_1[9:2] + {ell,9'd0};  end
            default: bram_r_25_addra <= 0;
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd57:bram_r_25_dina <= {ntt_out1[24:0],ntt_out2[24:0]};
            7'd12:bram_r_25_dina <= {ntt_out1[23:0],ntt_out2[23:0]};
            default:bram_r_25_dina <= 0;
        endcase    
    end 
    // -------------------------------      r 25 port b
    reg [11:0]r_25_addrb_offset,r_25_addrb_gap;
    always@(posedge clk ) begin
         if(KEYGEN_SIGN) case(bram_state)
            // rng
            7'd10:  r_25_addrb_offset <= {ells_cnt,9'd257 } ;
            7'd12: r_25_addrb_offset <= {ells_cnt,9'd1} ;
            7'd20:  r_25_addrb_offset <={ell_cnt,9'd0} ;   
            7'd21:  r_25_addrb_offset <={ell_cnt,9'd256} ; 
            7'd52,7'd46:  r_25_addrb_offset <= {ells_cnt,8'd0 } ; 
            7'd56,7'd8 :  r_25_addrb_offset <= {ell,9'd128 } ;
            7'd57:  r_25_addrb_offset <= {ell,8'd1 } ;
            7'd76:  r_25_addrb_offset <= {ell_cnt,8'd1 } ;
            default:  r_25_addrb_offset <= 1;
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd57,7'd76 : if(bram_r_25_enb) r_25_addrb_gap <= r_25_addrb_gap + 2 ; else r_25_addrb_gap <= 2;
			7'd20,7'd21,7'd52,7'd56,7'd46,7'd8: if(bram_r_25_enb) r_25_addrb_gap <= r_25_addrb_gap + 1 ; else r_25_addrb_gap <= 1;
            default: r_25_addrb_gap <= 1;
        endcase
    end
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd12,7'd20,7'd21,7'd52,7'd56,7'd57,7'd76,7'd46,7'd8 :if (bram_r_25_enb)     bram_r_25_addrb <= r_25_addrb_gap + r_25_addrb_offset ;  else bram_r_25_addrb <= r_25_addrb_offset;  
            7'd40: if(Chash1_Dout_flag & ~Chash_flag) begin bram_r_25_addrb <= {ell,1'b0,Chash1_addr_o[7:0]}; end else   bram_r_25_addrb <= 0;   
            default:bram_r_25_addrb <= 0; 
        endcase 
    end 
    always@(posedge clk ) begin
        if(KEYGEN_SIGN) case(bram_state)
            7'd10,7'd57:bram_r_25_dinb <= {ntt_out3[24:0],ntt_out4[24:0]}; 
            7'd46:bram_r_25_dinb <= {ntt_out1[24:0],ntt_out3[24:0]};  
            7'd12:bram_r_25_dinb <= {ntt_out3[23:0],ntt_out4[23:0]}; 
            7'd20:bram_r_25_dinb <=  {sub_24_dout[48:25],sub_24_dout[23:0]};                                                             /////
            7'd21,7'd52:bram_r_25_dinb <= add_25_dout;  
            7'd40: if(Chash1_Dout_flag & ~Chash_flag) bram_r_25_dinb <= Chash1_Dout_25;   else     bram_r_25_dinb <= 0;
            default:bram_r_25_dinb <= 0;    
        endcase 
    end 
    //  ------------------------ ntt -----------------------------------//
    // ntt_state
    reg  ntt_add_sub;
    always@(posedge clk ) begin
        if(rst)  ntt_add_sub <= 0;
        else case(ntt_state)
            7'd38,7'd39:ntt_add_sub <= 1;
            7'd40:ntt_add_sub <= 0;
        endcase
    end 
   
    always@(posedge clk ) begin
        if(rst)  ntt_rst <= 0;
        else if(state == 0)ntt_rst <= 1;
        else if(ntt_output_rst) ntt_rst <= 1;
        else   ntt_rst <= 0;
    end 
    always@(posedge clk) begin
        if(rst)  ntt_cnt <= 0;
        else if(ntt_in_flag) ntt_cnt <= ntt_cnt + 1;
        else if(ntt_rst ) ntt_cnt <= 0;
    end 
    always@(posedge clk) begin
        if(rst)  ntt_in_flag <= 0;
        else case(ntt_state)
            7'd1,7'd2,7'd3,7'd4,7'd6,7'd7  ,7'd13,7'd14,7'd15,7'd16,7'd22,7'd23,7'd29,7'd30,7'd31,7'd32,7'd36,7'd37,7'd40,7'd41,7'd46,7'd47: if(ntt_cnt < 127) ntt_in_flag <=1; else ntt_in_flag <=0;  
            7'd8,7'd9,7'd10,7'd11,7'd24,7'd25,7'd26,7'd27,7'd33,7'd34,7'd38,7'd39:if(ntt_cnt < 255) ntt_in_flag <=1; else ntt_in_flag <=0;  
            7'd18,7'd42,7'd48,7'd50:if(ntt_cnt < 511) ntt_in_flag <=1; else ntt_in_flag <=0;  
            default:ntt_in_flag <= 0;
        endcase
    end 
    always@(posedge clk ) begin
        if(rst)  ntt_state <= 0;
        else ntt_state <= next_ntt_state;
    end 
    always@(*) begin
        case(ntt_state)
            7'd0: next_ntt_state = state == NULL?7'd1:ntt_state;  
			7'd1: next_ntt_state = ntt_rst?7'd2:ntt_state;
			7'd3: next_ntt_state = ntt_rst?7'd4:ntt_state;
			7'd4: next_ntt_state = ntt_rst?7'd5:ntt_state;
			7'd6: next_ntt_state = ntt_rst?7'd7:ntt_state;
			7'd7: next_ntt_state = ntt_rst?7'd8:ntt_state;
			7'd8: next_ntt_state = ntt_rst?7'd9:ntt_state;
			7'd10:next_ntt_state = ntt_rst?7'd11:ntt_state;
			7'd11:next_ntt_state = ntt_rst?7'd12:ntt_state;
			7'd13:next_ntt_state = ntt_rst?7'd14:ntt_state;
			7'd14:next_ntt_state = ntt_rst?(~masking_flag?7'd17:7'd15):ntt_state;
			7'd15:next_ntt_state = ntt_rst?7'd16:ntt_state;
			7'd16:next_ntt_state = ntt_rst?7'd17:ntt_state;
            7'd2: next_ntt_state = ntt_rst?(~masking_flag?7'd5:7'd3):ntt_state; //
            7'd5:if(ells_cnt1 < ell)  next_ntt_state = 7'd0; else next_ntt_state = 7'd6;
            7'd9:next_ntt_state = ntt_rst?(~masking_flag?7'd12:7'd10):ntt_state; // 
            7'd12:if(ell_cnt < ell - 1) next_ntt_state =  7'd6;
                  else next_ntt_state = 7'd13;
            7'd17:if(~masking_flag) next_ntt_state =(bram_state == 36 & add_24_out_rst_o_d)?7'd18:ntt_state;
                    else next_ntt_state = (bram_state == 35 & add_25_out_rst_o)?7'd18:ntt_state;   
            7'd18:next_ntt_state = ntt_rst?7'd19:ntt_state; 
            7'd19:if(kA_cnt < k) next_ntt_state = lane_flag?7'd6 :ntt_state;
                  else next_ntt_state = lane_flag?7'd20:ntt_state;  
            7'd20:if(~KEYGEN_SIGN) next_ntt_state =  keyGen_flag?7'd0:ntt_state; else   next_ntt_state =  keyGen_flag?7'd21:ntt_state;
            7'd21: next_ntt_state = Chash_flag_d?7'd22:ntt_state;  
            7'd22:next_ntt_state = ntt_rst?7'd23:ntt_state;
            7'd23:next_ntt_state = ntt_rst?7'd24:ntt_state;
            7'd24:next_ntt_state = ntt_rst?7'd25:ntt_state;  
            7'd25:next_ntt_state = ntt_rst?~masking_flag?7'd28:7'd26:ntt_state;  // d== 1 ? 
            7'd26:next_ntt_state = ntt_rst?7'd27:ntt_state; 
            7'd27:next_ntt_state = ntt_rst?7'd28:ntt_state;  
            7'd28:if(ells_cnt1 < ell - 1)  next_ntt_state = z_flag?7'd24:ntt_state;     else  next_ntt_state = z_flag?7'd29:ntt_state;   
            7'd29:next_ntt_state = ntt_rst?7'd30:ntt_state; 
            7'd30:next_ntt_state = ntt_rst?7'd31:ntt_state; 
            7'd31:next_ntt_state = ntt_rst?7'd32:ntt_state;  
            7'd32:next_ntt_state = ntt_rst?7'd33:ntt_state;   
            7'd33:next_ntt_state = ntt_rst?7'd34:ntt_state; 
            7'd34:next_ntt_state = ntt_rst?7'd35:ntt_state;    
            7'd35:if(ell_cnt < ell - 1) next_ntt_state =  7'd31; else next_ntt_state = 7'd36;  
            7'd36:next_ntt_state = ntt_rst?7'd37:ntt_state;       
            7'd37:next_ntt_state = ntt_rst?7'd38:ntt_state;     
            7'd38:next_ntt_state = ntt_rst?7'd39:ntt_state;       
            7'd39:next_ntt_state = ntt_rst?7'd40:ntt_state; 
            7'd40:next_ntt_state = ntt_rst?7'd41:ntt_state;       
            7'd41:next_ntt_state = ntt_rst?7'd42:ntt_state;             
            7'd42:next_ntt_state = ntt_rst?7'd43:ntt_state;
            7'd43:if(kA_cnt < k) next_ntt_state =  7'd31; else next_ntt_state = 7'd44;  
            7'd44:next_ntt_state = Poly_shift_rst_d?7'd45:ntt_state;
            7'd45:next_ntt_state = 7'd46;
            7'd46:next_ntt_state = ntt_rst?7'd47:ntt_state; // intt 1 
            7'd47:next_ntt_state = ntt_rst?7'd48:ntt_state; // intt 1 
            7'd48:next_ntt_state = ntt_rst?7'd49:ntt_state; // restruct
            7'd49:next_ntt_state = Poly_shift_rst_d?7'd50:ntt_state;
            7'd50:next_ntt_state = ntt_rst?7'd51:ntt_state; // check z
            7'd51:if(ell_cnt < ell - 1) next_ntt_state = 7'd46; else next_ntt_state = 7'd52;  // ntt_rst
            default:next_ntt_state = ntt_state;
        endcase
    end	
    always@(posedge clk ) begin
        if(rst)  ntt_mod <= 0;
        else case(ntt_state)
            7'd1,7'd3,7'd6,7'd22,7'd29,7'd31,7'd36:ntt_mod <= 3'b100;
            7'd2,7'd4,7'd7,7'd23,7'd30,7'd32,7'd37:ntt_mod <= 3'b000;
            7'd8,7'd10,7'd24,7'd26,7'd33,7'd38:ntt_mod <= 3'b110;
            7'd9,7'd11,7'd25,7'd27,7'd34,7'd39:ntt_mod <= 3'b010;
            7'd13,7'd15,7'd40,7'd46:ntt_mod <= 3'b101;
            7'd14,7'd16,7'd41,7'd47:ntt_mod <= 3'b001;
            7'd18,7'd42,7'd48,7'd50:ntt_mod <= 3'b011;
        endcase
    end // intt_start
    always@(posedge clk ) begin
        if(rst)  intt_start <= 0;
        else case(ntt_state)
            7'd13:intt_start <= ntt_output_rst_d4;
            7'd14,7'd15,7'd16,7'd40,7'd41,7'd47:intt_start <= ntt_output_rst_d3;
            7'd46:if(ell_cnt == 0) intt_start <= intt_flag_d; else  intt_start <= ntt_output_rst_d4;
        endcase
    end 
    
    reg shift_add_mod; reg [6:0]shift_add_din;
    always@(posedge clk ) begin
        if(rst)  shift_add_mod <= 0;
        else case(bram_state)
            7'd72:shift_add_mod <= 1;
            default:shift_add_mod <= 0;
        endcase
    end 
    always@(posedge clk ) begin
        if(rst)  shift_add_din <= 0;
        else case(bram_state)
            7'd72:shift_add_din <= ts_h;
            default:shift_add_din <= 0;
        endcase
    end 
	reg [24:0] ntt_in1_p, ntt_in2_p, ntt_in3_p, ntt_in4_p, ntt_add1_p, ntt_add2_p;
	reg ntt_in_flag_p;
	
	    always@(posedge clk ) begin
        if(rst)  ntt_in1_p <= 0;
		else if(ntt_in_flag_d1) case(ntt_state)
				7'd1,7'd22,7'd40:  ntt_in1_p <= bram_a_24_douta[47:24]; 
				7'd2,7'd23,7'd41:  ntt_in1_p <= bram_a_25_douta[49:25];
				7'd13,7'd15,7'd3:  ntt_in1_p <= bram_a_25_douta[47:24];
				7'd14,7'd16,7'd4:  ntt_in1_p <= bram_a_24_douta[49:25];
				7'd6,7'd7,7'd31,7'd32:  ntt_in1_p <= Temp_A_1;
				7'd8,7'd33:  ntt_in1_p <= ~KEYGEN_SIGN? bram_s_24_douta[47:24]: bram_r_24_douta[47:24];
				7'd9,7'd34:  ntt_in1_p <= ~KEYGEN_SIGN? bram_s_25_douta[49:25]:bram_r_25_douta[49:25];
				7'd10: ntt_in1_p <= ~KEYGEN_SIGN? bram_s_25_douta[47:24]: bram_r_25_douta[47:24];
				7'd11: ntt_in1_p <= ~KEYGEN_SIGN? bram_s_24_douta[49:25]:bram_r_24_douta[49:25];
				7'd18,7'd42,7'd48: ntt_in1_p <= 25'd16257024;
				7'd24:  ntt_in1_p <= bram_s_24_douta[47:24];
				7'd25:  ntt_in1_p <= bram_s_25_douta[49:25]; 
				7'd26:  ntt_in1_p <= bram_s_25_douta[47:24];
				7'd27:  ntt_in1_p <= bram_s_24_douta[49:25];
				7'd29,7'd38,7'd46:  ntt_in1_p <= bram_r_24_douta[47:24];
				7'd30,7'd39,7'd47:  ntt_in1_p <= bram_r_25_douta[49:25];
				7'd36,7'd37:  ntt_in1_p <= ts_out_1[15:8];
				7'd50:ntt_in1_p <= bram_a_24_douta[23:0]; 
				default: ntt_in1_p <= 0;
			endcase
		else   ntt_in1_p <= 0;
		end
		
	    always@(posedge clk ) begin
        if(rst)  ntt_in2_p <= 0;
		else if(ntt_in_flag_d1) case(ntt_state)
				7'd40:  ntt_in2_p <= bram_a_24_douta[23:0];
				7'd41:  ntt_in2_p <= bram_a_25_douta[24:0];
				7'd1,7'd22:  ntt_in2_p <= bram_a_24_doutb[47:24]; 
				7'd2,7'd23:  ntt_in2_p <= bram_a_25_doutb[49:25]; 
				7'd3:  ntt_in2_p <= bram_a_25_doutb[47:24]; 
				7'd4:  ntt_in2_p <= bram_a_24_doutb[49:25]; 
				7'd6,7'd7,7'd31,7'd32:  ntt_in2_p <= Temp_A_2; 
				7'd8,7'd33,7'd10,7'd24,7'd26,7'd38:  ntt_in2_p <= bram_a_24_douta[47:24]; 
				7'd9,7'd34,7'd11,7'd25,7'd27,7'd39:  ntt_in2_p <= bram_a_25_douta[49:25]; 
				7'd13,7'd15: ntt_in2_p <= bram_a_25_douta[23:0];
				7'd14,7'd16: ntt_in2_p <= bram_a_24_douta[24:0];
				7'd18,7'd42,7'd48: ntt_in2_p <= Poly_shift_1[23:0];
				7'd29:  ntt_in2_p <= bram_r_24_doutb[47:24]; 
				7'd30:  ntt_in2_p <= bram_r_25_doutb[49:25]; 
				7'd36,7'd37: ntt_in2_p <= ts_out_2[15:8]; 
				7'd46:  ntt_in2_p <= bram_r_24_douta[23:0];
				7'd47:  ntt_in2_p <= bram_r_25_douta[24:0];
				7'd50:ntt_in2_p <= bram_a_24_douta[23:0]; 
				default: ntt_in2_p <= 0;
			endcase
		else ntt_in2_p <= 0;
		end
		
	    always@(posedge clk ) begin
        if(rst)  ntt_in3_p <= 0;
		else if(ntt_in_flag_d1)  case(ntt_state)
				7'd40:  ntt_in3_p <= bram_a_24_doutb[47:24]; 
				7'd41:  ntt_in3_p <= bram_a_25_doutb[49:25]; 
				7'd1,7'd22:  ntt_in3_p <= bram_a_24_douta[23:0]; 
				7'd2,7'd23:  ntt_in3_p <= bram_a_25_douta[24:0];
				7'd3:  ntt_in3_p <= bram_a_25_douta[23:0]; 
				7'd4:  ntt_in3_p <= bram_a_24_douta[24:0];
				7'd6,7'd7,7'd31,7'd32:  ntt_in3_p <= Temp_A_3; 
				7'd8,7'd33:  ntt_in3_p <= ~KEYGEN_SIGN? bram_s_24_douta[23:0]: bram_r_24_douta[23:0];
				7'd9,7'd34:  ntt_in3_p <= ~KEYGEN_SIGN?bram_s_25_douta[24:0] :bram_r_25_douta[24:0]; 
				7'd10:  ntt_in3_p <= ~KEYGEN_SIGN? bram_s_25_douta[23:0]: bram_r_25_douta[23:0];
				7'd11:  ntt_in3_p <= ~KEYGEN_SIGN?bram_s_24_douta[24:0] :bram_r_24_douta[24:0];
				7'd13,7'd15:  ntt_in3_p <= bram_a_25_doutb[47:24]; 
				7'd14,7'd16:  ntt_in3_p <= bram_a_24_doutb[49:25]; 
				7'd18,7'd42,7'd48:  ntt_in3_p <= 25'hfff002;
				7'd24:  ntt_in3_p <= bram_s_24_douta[23:0]; 
				7'd25:  ntt_in3_p <= bram_s_25_douta[24:0];
				7'd26:  ntt_in3_p <= bram_s_25_douta[23:0];  
				7'd27:  ntt_in3_p <= bram_s_24_douta[24:0];
				7'd29:  ntt_in3_p <= bram_r_24_douta[23:0];
				7'd30:  ntt_in3_p <= bram_r_25_douta[24:0];
				7'd36,7'd37:  ntt_in3_p <= ts_out_1[7:0];
				7'd38: ntt_in3_p <= bram_r_24_douta[23:0];
				7'd39: ntt_in3_p <= bram_r_25_douta[24:0];
				7'd46: ntt_in3_p <= bram_r_24_doutb[47:24];
				7'd47: ntt_in3_p <= bram_r_25_doutb[49:25];
				default: ntt_in3_p <= 0;
			endcase
		else ntt_in3_p <= 0;
		end
		
	    always@(posedge clk ) begin
        if(rst)  ntt_in4_p <= 0;
		else if(ntt_in_flag_d1) case(ntt_state)
				7'd40:  ntt_in4_p <= bram_a_24_doutb[23:0]; 
				7'd41:  ntt_in4_p <= bram_a_25_doutb[24:0]; 
				7'd1,7'd22: ntt_in4_p <= bram_a_24_doutb[23:0]; 
				7'd2,7'd23: ntt_in4_p <= bram_a_25_doutb[24:0]; 
				7'd3:  ntt_in4_p <= bram_a_25_doutb[23:0]; 
				7'd4:  ntt_in4_p <= bram_a_24_doutb[24:0]; 
				7'd6,7'd7,7'd31,7'd32:  ntt_in4_p <= Temp_A_4; 
				7'd8,7'd33: ntt_in4_p <= bram_a_24_douta[23:0];
				7'd9,7'd34: ntt_in4_p <= bram_a_25_douta[24:0]; 
				7'd10:  ntt_in4_p <= bram_a_24_douta[23:0];
				7'd11:  ntt_in4_p <= bram_a_25_douta[24:0]; 
				7'd13,7'd15: ntt_in4_p <= bram_a_25_doutb[23:0]; 
				7'd14,7'd16: ntt_in4_p <= bram_a_24_doutb[24:0]; 
				7'd18,7'd42,7'd48: ntt_in4_p <=Poly_shift_2[24:0]; 
				7'd24:  ntt_in4_p <= bram_a_24_douta[23:0]; 
				7'd25:  ntt_in4_p <= bram_a_25_douta[24:0]; 
				7'd26:  ntt_in4_p <= bram_a_24_douta[23:0]; 
				7'd27:  ntt_in4_p <= bram_a_25_douta[24:0]; 
				7'd29:  ntt_in4_p <= bram_r_24_doutb[23:0]; 
				7'd30:  ntt_in4_p <= bram_r_25_doutb[24:0]; 
				7'd36,7'd37: ntt_in4_p <= ts_out_2[7:0]; 
				7'd38: ntt_in4_p <= bram_a_24_douta[23:0]; 
				7'd39: ntt_in4_p <= bram_a_25_douta[24:0];
				7'd46: ntt_in4_p <= bram_r_24_doutb[23:0]; 
				7'd47: ntt_in4_p <= bram_r_25_doutb[24:0];
				default: ntt_in4_p <= 0;
			endcase
		else ntt_in4_p <= 0;
		end
		
	    always@(posedge clk ) begin
        if(rst)  ntt_add1_p <= 0;
		else   case(ntt_state)
				7'd8,7'd33:  ntt_add1_p <=  (ell_cnt  == 0)?0:bram_a_25_douta[47:24];
				7'd9,7'd34:  ntt_add1_p <=  (ell_cnt  == 0)?0:bram_a_24_douta[49:25];
				7'd10:       ntt_add1_p <=  (ell_cnt  == 0)?0:bram_a_25_douta[47:24];
				7'd11:       ntt_add1_p <=  (ell_cnt  == 0)?0:bram_a_24_douta[49:25];
				7'd24:		 ntt_add1_p <=  bram_r_24_douta[47:24];  
				7'd25:		 ntt_add1_p <=  bram_r_25_douta[49:25];  
				7'd26:  	 ntt_add1_p <=  bram_r_25_douta[47:24];
				7'd27:       ntt_add1_p <=  bram_r_24_douta[49:25];
				7'd38:		 ntt_add1_p <=  bram_a_25_douta[47:24]; 
				7'd39:		 ntt_add1_p <=bram_a_24_douta[49:25]; 
				default: ntt_add1_p <= 0;
			endcase
		//else ntt_add1_p <= 0;
		end
	
	    always@(posedge clk ) begin
        if(rst)  ntt_add2_p <= 0;
		else case(ntt_state)
				7'd8,7'd33:  ntt_add2_p <= (ell_cnt  == 0)?0:bram_a_25_douta[23:0];
				7'd9,7'd34:  ntt_add2_p <= (ell_cnt  == 0)?0:bram_a_24_douta[24:0];
				7'd10:       ntt_add2_p <= (ell_cnt  == 0)?0:bram_a_25_douta[23:0];
				7'd11:       ntt_add2_p <= (ell_cnt  == 0)?0:bram_a_24_douta[24:0];
				7'd24:		 ntt_add2_p <= bram_r_24_douta[23:0];
				7'd25:		 ntt_add2_p <= bram_r_25_douta[24:0]; 
				7'd26:  	 ntt_add2_p <= bram_r_25_douta[23:0];
				7'd27:       ntt_add2_p <= bram_r_24_douta[24:0];
				7'd38:		 ntt_add2_p <= bram_a_25_douta[23:0];
				7'd39:		 ntt_add2_p <= bram_a_24_douta[24:0];
				default: ntt_add2_p <= 0;
			endcase
		//else ntt_add2_p <= 0;
		end
		
	    always@(posedge clk ) begin
        if(rst)  ntt_in_flag_p <= 0;
		else case(ntt_state)
				7'd1,7'd22,7'd2,7'd3,7'd4,7'd6,7'd7,7'd31,7'd32,7'd23,7'd40,7'd41,7'd8,7'd33,7'd9,7'd34,7'd10,7'd11,7'd48,7'd50:  ntt_in_flag_p <= ntt_in_flag_d1;
				7'd13,7'd15,7'd14,7'd16,7'd18,7'd42,7'd24,7'd25,7'd26,7'd27,7'd29,7'd30,7'd36,7'd37,7'd38,7'd39,7'd46,7'd47: ntt_in_flag_p <= ntt_in_flag_d1;
				default: ntt_in_flag_p <= 0;
			endcase
		end

	    always@(posedge clk ) begin
        if(rst)  begin  
				ntt_in1 <= 0;  ntt_in2 <= 0;
				ntt_in3 <= 0;  ntt_in4 <= 0; 
				ntt_add1 <= 0; ntt_add2 <= 0; 
				ntt_inflag <= 0; end
		else begin
				ntt_in1 <= ntt_in1_p;  ntt_in2 <= ntt_in2_p;
				ntt_in3 <= ntt_in3_p;  ntt_in4 <= ntt_in4_p; 
				ntt_add1 <= ntt_add1_p; ntt_add2 <= ntt_add2_p; 
				ntt_inflag <= ntt_in_flag_p;
		end
		end  
    always@(posedge clk) begin
        if(rst|keyGen_flag)  Chash_flag <= 0;
        else if(w_cnt>= w) Chash_flag <= 1;
    end
    always@(posedge clk) begin
        if(rst)  w_cnt <= 0;
        else if(Chash2_Dout_flag) w_cnt <= w_cnt + 1;
    end 
    
    
    // signals    
    always@(posedge clk) begin
        add_24_out_rst_o_d <= add_24_out_rst_o;
        rng_in_flag_d <= rng_in_flag;
        rng_in_flag_d1 <= rng_in_flag_d;
        sampleU_flag_d <= sampleU_flag;
        sampleU_flag_d1 <= sampleU_flag_d;
        sample_D_24_1_d <= sample_D_24_1; sample_D_24_1_d1 <= sample_D_24_1_d;
        sample_D_24_2_d <= sample_D_24_2; sample_D_24_2_d1 <= sample_D_24_2_d;
        sample_sign1 <=  sample_D_25_1[24];sample_sign1_d <= sample_sign1;
        sample_sign2 <=  sample_D_25_2[24];sample_sign2_d  <=  sample_sign2;
        masking_order_d<= masking_order;
        rng_d <= {Rng_q_24_1,Rng_q_24_2};
        rng_d1 <= {Rng_q_25_1,Rng_q_25_2};
        ntt_in_flag_d <= ntt_in_flag; ntt_in_flag_d1 <= ntt_in_flag_d;
        ntt_output_rst_d <= ntt_output_rst; ntt_output_rst_d2 <= ntt_output_rst_d1;
        ntt_output_rst_d1 <= ntt_output_rst_d; ntt_output_rst_d3 <= ntt_output_rst_d2;
        ntt_output_rst_d4 <= ntt_output_rst_d3;
        add_flag_d <= add_flag;
        add_flag_d1 <= add_flag_d;
        ntt_cnt_d <= ntt_cnt[0];
        ntt_cnt_d1 <= ntt_cnt_d;
        ConMulti_flag_o_d <= ConMulti_flag_o; ConMulti_flag_o_d1 <= ConMulti_flag_o_d; ConMulti_flag_o_d2 <=  ConMulti_flag_o_d1;
        ConMulti_flag_o_d3 <=  ConMulti_flag_o_d2;
        Poly_shift_rst_d <= Poly_shift_rst;
        //sign
        sample_rst_o_d <= sample_rst_o & state == Expand_A_16;
        sample_rst_o_d1 <= sample_rst_o_d;  sample_rst_o_d4 <= sample_rst_o_d3;
        sample_rst_o_d2 <= sample_rst_o_d1; sample_rst_o_d5 <= sample_rst_o_d4;
        sample_rst_o_d3 <= sample_rst_o_d2; sample_rst_o_d6 <= sample_rst_o_d5;
        sample_rst_o_d7 <= sample_rst_o_d6;
        Cob_outflag_d2 <= Cob_outflag_d1; Cob_outflag_d1 <= Cob_outflag_d;
        Cob_outflag_d <= Cob_outflag;
        Cob_out_24_d <= Cob_out_24;Cob_out_24_d1 <= Cob_out_24_d;Cob_out_24_d2 <= Cob_out_24_d1;
        Cob_out_25_d <= Cob_out_25;Cob_out_25_d1 <= Cob_out_25_d;Cob_out_25_d2 <= Cob_out_25_d1;
        Chash_addr_flag_d<= sampleC_flag;
        Chash_addr_flag_d1 <= Chash_addr_flag_d;
    end 
    always@(posedge clk ) begin
        if(rst)  sample_bram_start <= 0;
        else if(state == Expand_A_10 & sample_mod == 2 & KEYGEN_SIGN)  sample_bram_start <= 1;             // keygen_sign
        else sample_bram_start <= 0;
    end
    // shift_mod
    always@(posedge clk ) begin
        if(rst)  shift_mod <= 0;
        else if(KEYGEN_SIGN)  shift_mod <= 1;             // keygen_sign
        else shift_mod <= 0;
    end
    
    always@(posedge clk) begin
        if(rst|keyGen_flag)  Chash_flag_d <= 0;
        else if(w_cnt_d>= w_d) Chash_flag_d <= 1;
    end
    always@(posedge clk) begin
        if(rst)  w_cnt_d <= 0;
        else if(Chash_addr_flag_d1) w_cnt_d <= w_cnt_d + 1;
    end 
    reg cpoly_in_flag;
    always@(posedge clk) begin
        if(rst)  cpoly_in_flag <= 0;
        else if(state == C_poly_1) cpoly_in_flag <= 1;
    end 
    //  ---------------------  moudles --------------------------------//
    assign  hash_in_chang = {hash_in[7:0],hash_in[15:8],hash_in[23:16],hash_in[31:24],hash_in[39:32],hash_in[47:40],hash_in[55:48],hash_in[63:56]};
    assign  hash_out_chang = {hash_result[7:0],hash_result[15:8],hash_result[23:16],hash_result[31:24],hash_result[39:32],hash_result[47:40],hash_result[55:48],hash_result[63:56]};
    Keccak1600 hash(.CLK(clk),.RESET(rst|hash_rst),.INIT(hash_init),.GO(hash_go),.SQUEEZE(hash_squeeze),.ABSORB(hash_absorb),.EXTEND(hash_extend),.DIN(hash_in_chang),.DONE(hash_done),.RESULT(hash_result));   
    LFSR_rng_64 RNG(.clk(clk), .rst(rst|rng_done), .en(rng_en),.din(rng_din),.dout(rng_dout),.rng_flag(rng_in_flag));
    blk_mem_gen_a_50 bram_a_24 (.clka(clk),.ena(bram_a_24_ena),.wea(bram_a_24_wra),.addra(bram_a_24_addra),.dina(bram_a_24_dina),.douta(bram_a_24_douta),.clkb(clk),.enb(bram_a_24_enb),.web(bram_a_24_wrb),.addrb(bram_a_24_addrb),.dinb(bram_a_24_dinb),.doutb(bram_a_24_doutb));
    blk_mem_gen_a_50 bram_a_25 (.clka(clk),.ena(bram_a_25_ena),.wea(bram_a_25_wra),.addra(bram_a_25_addra),.dina(bram_a_25_dina),.douta(bram_a_25_douta),.clkb(clk),.enb(bram_a_25_enb),.web(bram_a_25_wrb),.addrb(bram_a_25_addrb),.dinb(bram_a_25_dinb),.doutb(bram_a_25_doutb));
    
	Poly_add_24 add_24_1(.clk(clk),.rst(rst),.in_flag(add_24_flag_i),.din1(add_24_din1),.din2(add_24_din2),.dout(add_24_dout),.out_flag(add_24_flag_o),.out_rst(add_24_out_rst_o));
	Poly_add_25 add_25(.clk(clk),.rst(rst),.in_flag(add_25_flag_i),.q_mod(q_mod),.din1(add_25_din1),.din2(add_25_din2),.dout(add_25_dout),.out_flag(add_25_flag_o),.out_rst(add_25_out_rst_o));
	Poly_sub_25 sub_25(.clk(clk),.rst(rst),.in_flag(sub_25_flag_i),.din1(sub_25_din1),.q_mod(q_mod),.din2(sub_25_din2),.dout(sub_25_dout),.out_flag(sub_25_flag_o));
	Poly_sub_24 sub_24_1(.clk(clk),.rst(rst),.in_flag(sub_24_flag_i),.din1(sub_24_din1),.din2(sub_24_din2),.dout(sub_24_dout),.out_flag(sub_24_flag_o));
    
    ChangeShakeToSample sample(.clk(clk), .rst(rst|sample_rst), .Din_flag(sample_din_flag),.Din_mod(sample_mod),.Din(sample_din),.inp_u(sample_u),.Dout_24_1(sample_D_24_1),.Dout_24_2(sample_D_24_2),.Dout_25_1(sample_D_25_1),.Dout_25_2(sample_D_25_2),.sampleA_out_flag(sampleA_flag),.sampleU_out_flag(sampleU_flag),.Chash_addr_flag(sampleC_flag),.sample_rst_o(sample_rst_o));
    c_shift_ram_masking_order masking (.D(masking_order),.CLK(clk),.Q(masking_order_Q));
    
    NTT_TOP NTT(.clk(clk), .rst(rst|ntt_rst),.mod(ntt_mod),.in_flag(ntt_inflag),.ntt_in1(ntt_in1),.ntt_in2(ntt_in2),.ntt_in3(ntt_in3),.ntt_in4(ntt_in4),.intt_start(intt_start),.Add_sub(ntt_add_sub),
    .ntt_out1(ntt_out1),.ntt_out2(ntt_out2),.ntt_out3(ntt_out3),.ntt_out4(ntt_out4),.ntt_out_flag(ntt_out_flag),.input_done(ntt_input_done),.output_rst(ntt_output_rst),.ntt_add1(ntt_add1),.ntt_add2(ntt_add2) );
    
    blk_mem_gen_s bram_s_24 (.clka(clk),.ena(bram_s_24_ena),.wea(bram_s_24_wra),.addra(bram_s_24_addra),.dina(bram_s_24_dina),.douta(bram_s_24_douta),.clkb(clk),.enb(bram_s_24_enb),.web(bram_s_24_wrb),.addrb(bram_s_24_addrb),.dinb(bram_s_24_dinb),.doutb(bram_s_24_doutb));
    blk_mem_gen_s bram_s_25 (.clka(clk),.ena(bram_s_25_ena),.wea(bram_s_25_wra),.addra(bram_s_25_addra),.dina(bram_s_25_dina),.douta(bram_s_25_douta),.clkb(clk),.enb(bram_s_25_enb),.web(bram_s_25_wrb),.addrb(bram_s_25_addrb),.dinb(bram_s_25_dinb),.doutb(bram_s_25_doutb));
  
	blk_mem_gen_s bram_r_24 (.clka(clk),.ena(bram_r_24_ena),.wea(bram_r_24_wra),.addra(bram_r_24_addra),.dina(bram_r_24_dina),.douta(bram_r_24_douta),.clkb(clk),.enb(bram_r_24_enb),.web(bram_r_24_wrb),.addrb(bram_r_24_addrb),.dinb(bram_r_24_dinb),.doutb(bram_r_24_doutb));
    blk_mem_gen_s bram_r_25 (.clka(clk),.ena(bram_r_25_ena),.wea(bram_r_25_wra),.addra(bram_r_25_addra),.dina(bram_r_25_dina),.douta(bram_r_25_douta),.clkb(clk),.enb(bram_r_25_enb),.web(bram_r_25_wrb),.addrb(bram_r_25_addrb),.dinb(bram_r_25_dinb),.doutb(bram_r_25_doutb));
    
    Combine_24 C0B24(.clk(clk), .rst(rst|ColA_rst), .din_flag(Cob_inflag),.din(Cob_in_24),.dout(Cob_out_24),.dout_flag(Cob_outflag));
    Combine_25 C0B25(.clk(clk), .rst(rst|ColA_rst), .din_flag(Cob_inflag),.din(Cob_in_25),.dout(Cob_out_25));
    
	Temp_A Temp_A_PreNTT(.clk(clk),.rst(rst|keyGen_flag),.t_wr_flag(Temp_A_wr_flag),.t_wr_half(Temp_A_wr_half),.din_24(Cob_out_24),.din_25(Cob_out_25),.t_rd_flag(Temp_A_rd_flag),.t_choose(Temp_A_choose),
	.dout_1(Temp_A_1),.dout_2(Temp_A_2),.dout_3(Temp_A_3),.dout_4(Temp_A_4));
    wire [48:0] Dout_sign_z;
    wire Dout_sign_z_flag;
    Const_multi ConstMulti(.clk(clk),.a_24(Shift_flag?Shift_in1:0),.a_25(Shift_flag?Shift_in2:0),.din_flag(Shift_flag),.d_24(ConMulti_24),.d_25(ConMulti_25),.dout_flag(ConMulti_flag_o));
    Poly_shift poly_shift(.clk(clk),.din_flag(ConMulti_flag_o),.Dsp_24(ConMulti_flag_o?{ntt_out1,ntt_out2}:0),.multi_24(ConMulti_flag_o?ConMulti_24:0),.Dsp_25(ConMulti_flag_o?{ntt_out3,ntt_out4}:0),.multi_25(ConMulti_flag_o?ConMulti_25:0),.Dout(Shift_dout),.Dout_flag(Shift_dout_flag),.Poly_shift_rst(Poly_shift_rst),.Shift_mod(shift_mod),.add_mod(shift_add_mod),.add_din(shift_add_din),.Dout_sign_z(Dout_sign_z),.Dout_sign_z_flag(Dout_sign_z_flag));
    wire poly_shift_on = ntt_in_flag_d1&(ntt_state == 7'd18|ntt_state == 7'd42 |ntt_state == 7'd48 );
    c_shift_ram_1 Shift1 (.D(poly_shift_on?Poly_shift_1[23:0]:0),.CLK(clk),.Q(Shift_in1));
    c_shift_ram_2 Shift2 (.D(poly_shift_on?Poly_shift_2[24:0]:0),.CLK(clk),.Q(Shift_in2));
    c_shift_ram_3 Shift3 (.D(poly_shift_on),.CLK(clk),.Q(Shift_flag));
    
    blk_mem_gen_ts bram_ts (.clka(clk),.ena(bram_ts_ena),.wea(bram_ts_wra),.addra(bram_ts_addra),.dina(bram_ts_dina),.douta(bram_ts_douta),.clkb(clk),.enb(bram_ts_enb),.web(bram_ts_wrb),.addrb(bram_ts_addrb),.dinb(bram_ts_dinb),.doutb(bram_ts_doutb));
    Chash_poly2 Chash_poly_2(.clk(clk), .rst(rst), .in_flag(Chash_addr_flag_d1),.Chash_addr(cpoly_in_flag?sample_D_24_1[15:0]:0),.ell(ell),.Din_24(cpoly_in_flag?bram_a_24_douta:0),.Din_25(cpoly_in_flag?bram_a_25_douta:0),
						 .addr_o(Chash2_addr_o),.Dout_24(Chash2_Dout_24),.Dout_25(Chash2_Dout_25),.Dout_flag(Chash2_Dout_flag));
    Chash_poly1 Chash_poly_1(.clk(clk), .rst(rst), .in_flag(Chash_addr_flag_d1),.Chash_addr(cpoly_in_flag?sample_D_24_1[15:0]:0),.ell(ell),.Din_24(cpoly_in_flag?bram_r_24_douta:0),.Din_25(cpoly_in_flag?bram_r_25_douta:0),
						 .addr_o(Chash1_addr_o),.Dout_24(Chash1_Dout_24),.Dout_25(Chash1_Dout_25),.Dout_flag(Chash1_Dout_flag)); 
    c_shift_ram_3 intt_flag (.D(ntt_output_rst_d4),.CLK(clk),.Q(intt_flag_d));
    wire [1: 0] hoo_h;
    reg [48:0] zoo;
    wire [14:0] h22;
    wire [29:0] z22;
    reg [38:0] h22z22;

    reg [55:0] check_h_in;
    Check_bounds_h Check_h1(.clk(clk),.rst(rst),.in_flag(sign_h_flag),.Check_h_in(check_h_in[55:0]),.hoo(hoo_h),.Accu_out(h22));
    c_accum_1 check_z_acc (.B((ntt_out_flag& ntt_state == 7'd50)?ntt_out2:0),.SCLR(rst),.CLK(clk),.Q(z22)); 

    // check bounds
    wire check_midq = Dout_sign_z>midq?1:0;
    reg [49:0] check_z_d;
    reg check_z_sign;
    reg check_z_flag_d;
    always@(posedge clk ) begin
        if(rst)  check_z_sign <= 0;
        else  check_z_sign <= check_midq;
    end
    always@(posedge clk ) begin
        if(rst)  check_z_d <= 0;
        else if(stage == 9 & Dout_sign_z_flag) check_z_d <=  (check_midq? -Dout_sign_z:Dout_sign_z);
        else  check_z_d <= 0;
    end
    always@(posedge clk ) begin
        if(rst)  check_z <= 0;
        else if(check_z_flag_d) check_z <=  check_z_d + (check_z_sign?{midq[48:1],2'b01}:0);
        else  check_z <= 0;
    end
    
    // check_h_in
    always@(posedge clk ) begin
        if(rst)  check_h_in <= 0;
        else if(shift_storage_flag& (stage == 8) ) check_h_in <= shift_reg ;
        else check_h_in <= 0;
    end 
    
    always@(posedge clk ) begin
        if(rst)  check_z_flag_d <= 0;
        else if(stage == 9 & Dout_sign_z_flag) check_z_flag_d <=  1;
        else  check_z_flag_d <= 0;
    end    
    always@(posedge clk ) begin
        if(rst)  check_z_flag <= 0;
        else check_z_flag <=  check_z_flag_d;
    end        
    wire [48:0]zoo_pre = check_z>zoo?check_z:zoo;
    always@(posedge clk) begin
        if(rst) zoo<=0;
        else if(check_z_flag) zoo <= zoo_pre;
    end
    always@(posedge clk) begin
        if(rst) h22z22<=0;
        else if((ntt_state == 50 & ntt_output_rst & ell_cnt == ell-1)) h22z22 <= {h22,24'd0} + z22;
    end
    //reg Check_true;
    always@(posedge clk) begin
        if(rst) Check_true<=0;
        else if(ntt_state == 52)  Check_true <= (hoo_h <= Boo_h) & (zoo <= Boo) & (h22z22 <= B22);
        else  Check_true<=0;
    end
    
    
    // round_flags 
    // keyGen_flag
    // Sign_z_flag finial_A_flag
    always@(posedge clk ) begin
        if(rst)  finial_A_flag <= 0;
        else if(bram_state == 54 & ntt_input_done) finial_A_flag <= 1;

        else  finial_A_flag <= 0;
    end
        
    always@(posedge clk ) begin
        if(rst)  z_flag <= 0;
        else if(bram_state == 52 & add_25_out_rst_o & masking_flag) z_flag <= 1;
        else if(bram_state == 46 & ntt_rst & ~masking_flag) z_flag <= 1;
        else  z_flag <= 0;
    end
    
    always@(posedge clk ) begin
        if(rst)  keyGen_flag <= 0;
        else if(kA_cnt ==k & lane_flag) keyGen_flag <= 1;
        else  keyGen_flag <= 0;
    end
    
    always@(posedge clk ) begin
        if(rst)  lane_flag <= 0;
        else if(Poly_shift_rst_d) lane_flag <= 1;
        else  lane_flag <= 0;
    end
    
    always@(posedge clk ) begin
        if(rst)  finial_lane_flag <= 0;
        else if(ntt_rst & ntt_state == 50) finial_lane_flag <= 1;
        else  finial_lane_flag <= 0;
    end
    // stage2_f
    always@(posedge clk ) begin
        if(rst)  stage2_f <= 0;
        else case(ntt_state)
            7'd16:if(masking_flag & ntt_rst) stage2_f <= 1; else  stage2_f <= 0; 
            7'd14:if(~masking_flag & ntt_rst) stage2_f <= 1; else  stage2_f <= 0; 
            default: stage2_f <= 0;
        endcase
    end 
    // lane_flag FIFO_end SampleA_half  lane_cnt sample_cnt ExpendA_flag 
    // Single_s_flag Single_A_flag
    always@(posedge clk ) begin
        if(rst)  Single_A_flag <= 0;
        else case(ntt_state)
            7'd11:if(masking_flag & ntt_rst) Single_A_flag <= 1; else  Single_A_flag <= 0; 
            7'd9:if(~masking_flag & ntt_rst) Single_A_flag <= 1; else  Single_A_flag <= 0; 
            7'd34:if(ntt_rst) Single_A_flag <= 1; else  Single_A_flag <= 0; 
            default: Single_A_flag <= 0;
        endcase
    end  
    always@(posedge clk ) begin
        if(rst)  Expand_A_wait <= 0;
        else if(bram_state == 17 & ntt_input_done) Expand_A_wait <=1;
        else if(bram_state == 59 & ntt_input_done) Expand_A_wait <= 1;
        else Expand_A_wait <= 0;
    end 
    always@(posedge clk ) begin
        if(rst)  Single_s_flag <= 0;
        else if(masking_flag) Single_s_flag <= ntt_state == 4 & ntt_output_rst;
        else if(~masking_flag) Single_s_flag <= ntt_state == 2 & ntt_output_rst;
    end 
    // Single_A_flag  : Temp_A_choose FIFO_end
	
    //////// only for test: output vk from KeyGen and z,h from Sign /////
    // Server_out
    always@(posedge clk ) begin
        if(rst)  Server_out <= 0;
        else if(shift_storage_flag&~KEYGEN_SIGN) Server_out <= shift_reg ;
        else if(shift_storage_flag& (stage == 8) ) Server_out <= shift_reg ;
        else if(Dout_sign_z_flag & (stage == 9) ) Server_out <= Dout_sign_z ;
        else Server_out <= 0;
    end 
    

    always@(posedge clk ) begin
        if(rst)  vk_flag <= 0;
        else if(shift_storage_flag&~KEYGEN_SIGN) vk_flag <= 1;  
        else vk_flag <= 0;
    end 
    // sign 
    // sign_h_flag
    always@(posedge clk ) begin
        if(rst)  sign_h_flag <= 0;
        else if(shift_storage_flag& (stage == 8)) sign_h_flag <= 1;  
        else sign_h_flag <= 0;
    end 
    
    always@(posedge clk ) begin
        if(rst)  sign_z_flag <= 0;
        else if(Dout_sign_z_flag & (stage == 9)) sign_z_flag <= 1;  
        else sign_z_flag <= 0;
    end 
endmodule
