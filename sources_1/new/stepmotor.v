`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 08:54:27
// Design Name: 
// Module Name: stepmotor
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


module stepmotor(
	input speed,
	input rst,
	input dir_left,
	input dir_right,
	output [3:0] motor_left,
	output [3:0] motor_right
    );
	
	motorout left(
		.clk(speed),
		.rst(rst),
		.dir(dir_left),
		.pulseout(motor_left)
		);
	motorout right(
		.clk(speed),
		.rst(rst),
		.dir(dir_right),
		.pulseout(motor_right)
		);
endmodule
