`timescale 1ms / 1us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 20:38:43
// Design Name: 
// Module Name: test_motor
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


module test_motor;
	wire[3:0] motor_left;
	wire[3:0] motor_right;
	reg rst;
	reg clk_200Hz;
	reg dir_left;
	reg dir_right;

	initial begin
		rst = 1;
		clk_200Hz = 0;
		dir_right = 1;
		dir_left = 0;
		#1
		clk_200Hz = 0;
		rst = 0;
	end
	stepmotor u0(
		.speed(clk_200Hz),
		.rst(rst),
		.dir_left(dir_left),
		.dir_right(dir_right),
		.motor_left(motor_left),
		.motor_right(motor_right)
		);
	always#5 clk_200Hz = ~clk_200Hz;
endmodule
