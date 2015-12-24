`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/18 14:07:40
// Design Name: 
// Module Name: motor_top
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


module motor_top(
	input clk,
	input speed,
	input rst,
	input direction,
	input steps,
	output locked,
	output[3:0] left_out,
	output[3:0] right_out
    );
	//向右时direction = 1;
	parameter turn_dir = 0,gostraight = 1;
	parameter turnsteps = 0;
	reg status;
	reg motorrst;
	reg motorstep;
	reg motorlocked;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			status <= turn_dir;
			motorlocked <= 1;
			locked <= 1;
		end
		else 
			case (status)
				turn_dir: 
						if (motorlocked) status <= turn_dir;
						else status <= gostraight;
				gostraight:
				    begin				
						status <= gostraight;
						if (motorlocked) locked <= 1;
						else  locked <= 0;
					end
			endcase
	end

	always @(status)begin
		case (status)
			turn_dir: begin
				motorrst <= 0;
				motorstep <= turnsteps;
				dir_left <= direction;
				dir_right <= ~direction;
			end
			gostraight: begin
				motorrst <= 0;
				motorstep <= steps;
				dir_left <= 1;
				dir_right <= 1;
			end
		endcase

	end
	motor_locked out0(
		.speed(speed),
		.rst(motorrst),
		.steps(motorstep),
		.dir_left(dir_left),
		.dir_right(dir_right),
		.motor_left(left_out),
		.motor_right(right_out),
		.locked(motorlocked)
		);
endmodule
