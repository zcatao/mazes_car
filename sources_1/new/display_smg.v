`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 08:58:48
// Design Name: 
// Module Name: display_smg
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


module display_smg(
    input clk_100MHz,
    input rst,
    input[15:0] motor_data,
    input[15:0] sensor_data,
    output[3:0] sm_wei,
   	output[7:0] sm_duan
    );

	wire[15:0] data;
	smg_data Data(
		.clk_100Mhz(clk_100Mhz),
		.rst(rst),
		.motor_data(motor_data),
		.sensor_data(sensor_data),
		.data(data)
		);
	smg_ip smg_out(
	.clk_100MHz(clk_100MHz),
	.data(data),
	.sm_wei(sm_wei),
	.sm_duan(sm_duan)
    );
endmodule
