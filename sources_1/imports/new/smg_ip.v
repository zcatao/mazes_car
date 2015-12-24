`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/08 19:13:30
// Design Name: 
// Module Name: smg_ip
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


module smg_ip(
	input clk_1MHz,input[15:0] data,
	output[3:0] sm_wei,output[7:0] sm_duan
    );
// seperate  frequency
	integer clk_cnt;
	reg clk_400Hz;
	always@(posedge clk) begin
		if(clk_cnt == 32'd100000) begin
			clk_cnt <= 1'b0;
			clk_400Hz <= ~clk_400Hz;
		end
		else begin
			clk_cnt <= clk_cnt + 1'b1;
		end
	end

	// wei control
	reg[3:0] wei_ctrl = 4'b1110;
	always@(posedge clk_400Hz) begin
		wei_ctrl <= {wei_ctrl[2:0],wei_ctrl[3]};
	end

	//duan control
	reg[3:0] duan_ctrl;
	always@(posedge clk_400Hz) begin
		case (wei_ctrl)
		4'b1110:duan_ctrl = data[3:0];
		4'b1101:duan_ctrl = data[7:4];
		4'b1011:duan_ctrl = data[11:8];
		4'b0111:duan_ctrl = data[15:12];
		default:duan_ctrl = 4'hf;
		endcase;
	end

	//unfasten code
	reg[7:0] duan;
	always@(duan_ctrl)
		case(duan_ctrl)
		4'h0:duan=8'b1100_0000;//0
		4'h1:duan=8'b1111_1001;//1
		4'h2:duan=8'b1010_0100;//2
		4'h3:duan=8'b1011_0000;//3
		4'h4:duan=8'b1001_1001;//4
		4'h5:duan=8'b1001_0010;//5
		4'h6:duan=8'b1000_0010;//6
		4'h7:duan=8'b1111_1000;//7
		4'h8:duan=8'b1000_0000;//8
		4'h9:duan=8'b1001_0000;//9
		4'ha:duan=8'b1000_1000;//a
		4'hb:duan=8'b1000_0011;//b
		4'hc:duan=8'b1100_0110;//c
		4'hd:duan=8'b1010_0001;//d
		4'he:duan=8'b1000_0111;//e
		4'hf:duan=8'b1000_1110;//f
		// 4'hf:duan=8'b1111_1111;//ä¸æ˜¾ç¤?
		default : duan = 8'b1111_1111;//不显示
		endcase
	assign sm_wei = wei_ctrl;
	assign sm_duan = duan;
endmodule