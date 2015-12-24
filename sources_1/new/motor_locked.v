
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/18 11:37:06
// Design Name: 
// Module Name: motor_locked
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

//调用之前应该复位
module motor_locked(
	input clk,
	input speed,

	input rst,
	input steps,
	input dir_left,
	input dir_right,
	output [3:0] motor_left,
	output [3:0] motor_right,
	output locked
    );
	
	integer steps_cnt = 1'b0;
	wire speed_out;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
					// reset
			steps_cnt <= 1'b0;
			locked <= 0;
		end
		else if (steps_cnt < steps) begin
			steps_cnt <= steps_cnt + 1'b1;
			end
		else begin
			locked <= 1;
		end
	end

	assign speed_out = (locked == 1'b1)? speed : 1'b0;
	/***** shi li hua dianji shuchu *****/
	stepmotor u3(
		.speed(speed_out),
		.rst(rst),
		.dir_right(dir_right),
		.dir_left(dir_left),
		.motor_right(motor_right),
		.motor_left(motor_left)
		);
endmodule
