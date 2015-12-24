`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 10:35:50
// Design Name: 
// Module Name: smg_data
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


module smg_data(
	input clk_100Mhz,
	input rst,
    input[15:0] motor_data,
    input[15:0] sensor_data,
    output[15:0] data
    );
	integer clk_cnt;
	reg clk_1Hz;
	reg[15:0] disp = 64'h0123456789ABCDEF;
	parameter[31:0] CNT = 28'h60_00000;
	parameter[1:0]  state_default = 0,
					state_motor = 1,
					state_sensor = 2;
	reg[1:0] states;
	
	//reg states;
//对clk进行分频 �? 1HZ
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			clk_cnt = 1'b0;
		end
		else if (clk_cnt == CNT) begin
			clk_cnt <= 1'b0;
			clk_1Hz <= ~clk_1Hz;
		end
		else begin
			clk_cnt <= clk_cnt + 1'b1;
		end
	end

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			states <= state_default;
		end
		else 
			case(states)
				state_default:begin
					data <= 16'hffff;
					states <= state_motor;
				end 	
				state_motor:begin
					data <= sensor_data;
					states <= state_sensor;
				end					
				state_sensor:begin
					data <= motor_data;
					states <= state_motor;
				end
				default: states <= state_default; 
			endcase
	end
endmodule
