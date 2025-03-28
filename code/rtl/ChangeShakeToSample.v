`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/18 18:04:37
// Design Name: 
// Module Name: ChangeShakeToSample
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// LUT 310 FF 290 3.6 0.664
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ChangeShakeToSample(
    input clk, rst, Din_flag,
    input [1:0] Din_mod, // 1- sampleA / 0- sampleU / 2 sampleU sign / 3 cpoly
    input [63:0] Din,
    input [5:0] inp_u,
 
    output reg [23: 0] Dout_24_1, Dout_24_2,
    output reg [24: 0] Dout_25_1, Dout_25_2,
    output reg sampleA_out_flag, sampleU_out_flag, Chash_addr_flag,
    
    output reg sample_rst_o
    );
    
    reg fifo_rd,fifo_rd_d;
    wire fifo_full,fifo_empty,fifo_almost_empty;
    wire [63:0] fifo_dout;
    reg [4:0]fifo_rd_cnt;reg process_flag;
    reg cnt_flag;
    wire [24:0] sampleU_Dout_1_24, sampleU_Dout_4_24;
    wire [55:0] Change56_dout;
	wire [47:0] Change48_dout;
    wire Change56_doutflag,Change48_doutflag;
    wire [23:0] Redc24_dout;
    wire [24:0] Redc25_dout;
    wire [48: 0] sample_A_Dout;
    always@(posedge clk) fifo_rd_d <= fifo_rd;
    always@(posedge clk)  
        if(rst) cnt_flag <= 0;
        else if(Din_mod == 1) cnt_flag <= fifo_rd_cnt[3];
		else if(Din_mod == 2) cnt_flag <= fifo_rd_cnt[2];
	
    always@(posedge clk ) begin
        if(rst) fifo_rd_cnt <= 0;
        else if(Din_mod == 0) begin
            case(fifo_rd_cnt) 
                4'b0000:  if(Din_flag) fifo_rd_cnt <= {2'b00,~fifo_empty};//if(Sample_mod==1 & Sample_mod==1)
                4'b0001: if(fifo_empty) fifo_rd_cnt <= 0 ;  else fifo_rd_cnt <= fifo_rd_cnt + 1 ;
                4'b0010,4'b0011: fifo_rd_cnt <= fifo_rd_cnt + 1 ;
                4'b0100:fifo_rd_cnt <= 1 ;                     
            endcase
        end
		
        else if(Din_mod == 1) begin
            case(fifo_rd_cnt) 
                4'b0000:  if(Din_flag) fifo_rd_cnt <= {2'b00,~fifo_empty};//if(Sample_mod==1 & Sample_mod==1)
                4'b0001,4'b0010,4'b0011,4'b0100,4'b0101,4'b0110,4'b0111: 
                    if(fifo_rd & fifo_almost_empty) fifo_rd_cnt <= fifo_rd_cnt ; else if(fifo_empty)  fifo_rd_cnt <= fifo_rd_cnt;else fifo_rd_cnt <= fifo_rd_cnt + 1 ;
                4'b1000:fifo_rd_cnt <= 1 ;                     
            endcase
         end
		 
        else if(Din_mod == 2) begin
            case(fifo_rd_cnt) 
                4'b0000:  if(Din_flag) fifo_rd_cnt <= {2'b00,~fifo_empty};//if(Sample_mod==1 & Sample_mod==1)
                4'b0001,4'b0010,4'b0011: 
                    if(fifo_rd & fifo_almost_empty) fifo_rd_cnt <= fifo_rd_cnt ; else if(fifo_empty)  fifo_rd_cnt <= fifo_rd_cnt;else fifo_rd_cnt <= fifo_rd_cnt + 1 ;
                4'b0100:fifo_rd_cnt <= 1 ;                     
            endcase
        end
		
        else if(Din_mod == 3) begin
            if(~fifo_empty) fifo_rd_cnt <= fifo_rd_cnt + 1;
			else if(fifo_rd_cnt[1:0] == 3) fifo_rd_cnt <= fifo_rd_cnt + 1;
        end

    end 
	
	// rd
    always@(posedge clk) begin
        if(rst) fifo_rd <= 0;
        else if(Din_mod == 0) 
            case(fifo_rd_cnt)
                4'd1,4'd2,4'd3:fifo_rd<= 0;
                4'd0,4'd4:if(fifo_almost_empty & fifo_rd | fifo_empty)fifo_rd<= 0; else  fifo_rd<= 1;
            endcase  
        else if(Din_mod == 1) 
            case(fifo_rd_cnt)
                4'd1,4'd2,4'd3,4'd4,4'd5,4'd6,4'd7: if(fifo_almost_empty & fifo_rd | fifo_empty)fifo_rd<= 0; else fifo_rd<= 1;
                4'd0,4'd8:fifo_rd<= 0;
            endcase
        else if(Din_mod == 2) 
            case(fifo_rd_cnt)
                4'd1,4'd2,4'd3: if(fifo_almost_empty & fifo_rd | fifo_empty)fifo_rd<= 0; else fifo_rd<= 1;
                4'd0,4'd4:fifo_rd<= 0;
            endcase  
		else if(Din_mod == 3) 
			if(fifo_rd_cnt == 1) fifo_rd <= 1; else fifo_rd <= 0;
    end
	// process_flag
    always@(posedge clk ) begin
        if(rst) process_flag <= 0;
        else if(Din_mod == 0) begin
            case(fifo_rd_cnt)
                4'd1:if(fifo_empty) process_flag <= 0 ;  else process_flag <= 1 ;
                4'd2,4'd3,4'd4: process_flag<= 1;
                4'd0: process_flag<= 0;
            endcase  
        end
        else if(Din_mod == 1 | Din_mod == 2) begin
            if(fifo_rd|cnt_flag) process_flag <= 1;
            else if(fifo_empty) process_flag <= 0;
        end
        else  process_flag <= 0;		
    end
	reg [1:0] cnt1;
    always@(posedge clk ) begin
        if(rst) cnt1 <= 0;
        else if(fifo_rd_cnt[2:0] == 2) cnt1 <= cnt1 + 1 ;
    end
	
	reg [55:0] FHash; reg FHash_flag;
    always@(posedge clk) begin
        if(rst) FHash <= 0;
        else if(Din_mod == 0 & process_flag) 
            case(fifo_rd_cnt[1:0])
                2'b01:FHash <= fifo_dout[15:0];
                2'b10:FHash <= fifo_dout[63:48];
                2'b11:FHash <= fifo_dout[47:32];
                2'b00:FHash <= fifo_dout[31:16];
            endcase
		else if(Din_mod == 1 & Change56_doutflag) 
				FHash <= Change56_dout;
        else if(Din_mod == 2 & Change48_doutflag) 
				FHash <= Change48_dout;		
        else FHash <= 0;
    end
	
    always@(posedge clk ) begin
        if(rst) FHash_flag <= 0;
        else if(Din_mod == 0) 
				FHash_flag <= process_flag;
		else if(Din_mod == 1 ) 
				FHash_flag <= Change56_doutflag;
        else if(Din_mod == 2) 
				FHash_flag <= Change48_doutflag;		
        else FHash_flag <= 0;
    end
	// redc

	reg [49:0] Redc_din;
	reg Redc_flag;

    always@(posedge clk) begin
        if(rst) begin Redc_din <= 0; Redc_flag <= 0; end
		else if(Din_mod == 1) 
				 begin Redc_din <= sample_A_Dout; Redc_flag <= sample_A_out_flag; end
        else if(Din_mod == 2) 
				 begin Redc_din <= {2'b0,sampleU_Dout_1_24, sampleU_Dout_4_24}; Redc_flag <= sampleU_Dout_flag_24; end	
        else  begin Redc_din <= 0; Redc_flag <= 0; end
    end
	
	// Dout_24_1, Dout_24_2 
    always@(posedge clk) begin
        if(rst)  begin Dout_24_1 <= 0; Dout_24_2 <= 0; 
						Dout_25_1 <= 0; Dout_25_2 <= 0; 
				  end
        else if(Din_mod == 0 & sampleU_Dout_flag_24) 
				begin Dout_24_1 <= sampleU_Dout_1_24; Dout_24_2 <= sampleU_Dout_4_24; 
					  Dout_25_1 <= sampleU_Dout_1_24[23]?{1'b1, sampleU_Dout_1_24}:sampleU_Dout_1_24; 
					  Dout_25_2 <= sampleU_Dout_4_24[23]?{1'b1, sampleU_Dout_4_24}:sampleU_Dout_4_24;
				end
		else if(Din_mod == 1) 
				begin Dout_24_1 <= Redc24_dout; Dout_24_2 <= 0; 
					  Dout_25_1 <= Redc25_dout; Dout_25_2 <= 0;
				end
		else if(Din_mod == 2 & Redc25_outflag) 
				begin Dout_24_1 <= Redc24_dout; Dout_24_2 <= 0; 
					  Dout_25_1 <= Redc25_dout; Dout_25_2 <= 0;
				end		
        else if(Din_mod == 3) case(cnt1[1:0])
					2'b01:Dout_24_1 <= {fifo_dout[55:48],fifo_dout[63:56] };
					2'b10:Dout_24_1 <= {fifo_dout[39:32],fifo_dout[47:40] };
					2'b11:Dout_24_1 <= {fifo_dout[23:16],fifo_dout[31:24] };
					2'b00:Dout_24_1 <= {fifo_dout[7:0],fifo_dout[15:8] };
        endcase
        else    begin Dout_24_1 <= 0; Dout_24_2 <= 0; 
					  Dout_25_1 <= 0; Dout_25_2 <= 0;
				end
    end
	// sampleA_out_flag, sampleU_out_flag, Chash_addr_flag
	
    always@(posedge clk ) begin
        if(rst) sampleA_out_flag <= 0;
        else if(Redc25_outflag & Din_mod == 1) sampleA_out_flag <= 1;
        else sampleA_out_flag <= 0;
    end
    always@(posedge clk) begin
        if(rst) sampleU_out_flag <= 0;
        else if(Redc25_outflag & Din_mod == 2) sampleU_out_flag <= 1;
		else if(sampleU_Dout_flag_24 & Din_mod == 0)  sampleU_out_flag <= 1;
        else sampleU_out_flag <= 0;
    end
    
    always@(posedge clk ) begin
        if(rst) Chash_addr_flag <= 0;
        else if(fifo_rd_cnt[2:0] == 3 & Din_mod == 3) Chash_addr_flag <= 1;
        else Chash_addr_flag <= 0;
    end
    reg Redc_flag_d,Redc_flag_d1,Redc_flag_d2,Redc_flag_d3;
    always@(posedge clk )begin
             Redc_flag_d <= Redc_flag;   Redc_flag_d2 <= Redc_flag_d1;
             Redc_flag_d1 <= Redc_flag_d;Redc_flag_d3 <= Redc_flag_d2;
    end
    always@(posedge clk ) begin
        if(rst) sample_rst_o <= 0;
        else if(Din_mod == 0) sample_rst_o <= ~sampleU_Dout_flag_24&sampleU_Dout_flag_25;
        else if(Din_mod == 2) sample_rst_o <= ~Redc_flag_d3 &Redc24_outflag ;
        else sample_rst_o <= 0;
    end
    //
    
    Change64To56 change56(.clk(clk),.rst(rst),.inflag(Din_mod == 1 & process_flag),.Din(fifo_dout),.Dout(Change56_dout),.D_flag(Change56_doutflag));
	Change64To48 change48(.clk(clk),.rst(rst),.inflag(Din_mod == 2 & process_flag),.Din(fifo_dout),.Dout(Change48_dout),.D_flag(Change48_doutflag));
    fifo_generator_CHANGE FIFO_chang (.clk(clk),.srst(rst|sample_rst_o),.din(Din),.wr_en(Din_flag),.rd_en(fifo_rd),.dout(fifo_dout),.full(fifo_full),.empty(fifo_empty),.almost_empty(fifo_almost_empty)); 
    sample_a sampleA(.clk(clk), .rst(rst), .Din_flag(Din_mod == 1 & FHash_flag),.Din(FHash),.Dout(sample_A_Dout),.Dout_flag(sample_A_out_flag));
    
	sample_u sampleU(.clk(clk),.rst(rst),.u(inp_u),.u_mod(Din_mod[1]),.Din(FHash),.Din_flag(~Din_mod[0] & FHash_flag),.Dout_3_24(sampleU_Dout_1_24),
    .Dout_4_24(sampleU_Dout_4_24),.Dout_flag_24(sampleU_Dout_flag_24),.Dout_flag_25(sampleU_Dout_flag_25)); 
	
	Reduc_25_s Redc25(.clk(clk),.rst(rst),.en(Redc_flag), .Din({1'b0,Redc_din[48:0]}),.Dout(Redc25_dout), .Dout_flag(Redc25_outflag));
	Reduc_24_s Redc24( .clk(clk),.rst(rst),.en(Redc_flag), .Din(Redc_din[48:0]),.Dout(Redc24_dout), .Dout_flag(Redc24_outflag));	
    
endmodule

 