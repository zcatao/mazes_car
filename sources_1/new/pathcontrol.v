`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/18 00:55:34
// Design Name: 
// Module Name: pathcontrol
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


module pathcontrol(
	input clk,
	input rst,
	input sensor,
	input mode,
	input speed,
	output dir_left,
	output dir_right
    );
	parameter[1:0] turn_left = 2'b01,
				   turn_right = 2'b10;
	parameter[3:0] s0 = 4'd1,s1 = 4'd2,s2 = 4
		;
	reg[3:0] states;
	
	always @(posedge clk or posedge rst) begin
	   	if (rst) begin
	   		// reset
	   		states <= s0;
	   	end
	   	 
	end			   
	// always @(posedge clk or posedge rst) begin
	// 	if (rst) begin
	// 		// reset
			
	// 	end

	// end

	// motor_locked u4(
	// 	.speed(speed),
	// 	.rst(rst),
	// 	.steps(steps),

	// 	.


	// 	input steps,
	// 	input dir_left,
	// 	input dir_right,
	// 	output [3:0] motor_left,
	// 	output [3:0] motor_right,
	// 	output locked
 //    );


endmodule
