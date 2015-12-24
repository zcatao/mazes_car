`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/17 09:06:16
// Design Name: 
// Module Name: motorout
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


module motorout(
	input clk,
	input dir,
	input rst,
	output reg[3:0] pulseout
    );
	reg[2:0] status;
	//reg[3:0] pulseout;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			// reset
			status <= 0;
		end
		else if (dir) begin
			status <= status + 1;
		end
		else begin
			status <= status - 1;
		end
	end
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			pulseout <= 4'b0000;			
		end
		else 
			case (status)
				3'b000: pulseout = 4'b1000;
				3'b001: pulseout = 4'b1010;
				3'b010: pulseout = 4'b0010;
				3'b011: pulseout = 4'b0110;
				3'b100: pulseout = 4'b0100;
				3'b101: pulseout = 4'b0101;
				3'b110: pulseout = 4'b0001;
				3'b111: pulseout = 4'b1001;
			endcase
	end
endmodule
