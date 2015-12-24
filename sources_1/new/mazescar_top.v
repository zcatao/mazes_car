`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 08:57:01
// Design Name: 
// Module Name: mazescar_top
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


module mazescar_top(
	input clk,
	input rst,
	input dir_left,
	input dir_right,
	output[3:0] motor_left,
	output[3:0] motor_right
    );
	integer clk_cnt = 0;
	reg clk_200Hz;
	always@(posedge clk) begin
		if(clk_cnt == 32'd200000) begin
			clk_cnt <= 1'b0;
			clk_200Hz <= ~clk_200Hz;
		end
		else begin
			clk_cnt <= clk_cnt + 1'b1;
		end
	end
	stepmotor motor(
		.speed(clk_200Hz),
		.rst(rst),
		.dir_left(dir_left),
		.dir_right(dir_right),
		.motor_right(motor_right),
		.motor_left(motor_left)
		);
endmodule
