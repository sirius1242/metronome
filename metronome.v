`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/02/07 14:11:51
// Design Name: 
// Module Name: metronome
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


module metronome(
		input [7:0] speed,
		input	clk,
		input	rst_n,
		input play,
		output reg bell
    );
		localparam freq = 2500;
		localparam beat = 25000000 / freq;
		localparam delta = 60 * freq / 256 / 10;
		//localparam beat = 25000000 / 2093;
		//localparam beat = 250000 / 2093;
		//wire[31:0] blank;
	 	assign blank = 60 * freq / speed ;
		integer i;
		integer j;
		reg sign;
		//assign green = en == 1 ? 1:0;
		always@(posedge clk or negedge rst_n)
		begin
			if (~rst_n)
			begin
				j <= 0;
				sign <= 0;
			end
			else if(~play)
				j <= j;
			else if(j >= beat)
			begin
				sign <= ~sign;
				j <= 0;
			end
			else
				j <= j+1;
		end
		always@(posedge sign or negedge rst_n)
		begin
			if (~rst_n)
			begin
				i <= 0;
				bell <= 0;
			end
			else if(~play)
				i <= i;
			else if(i >= blank)
				i <= 0;
			else if(i >= blank - delta)
			begin
				bell <= ~bell;
				i <= i+1;
			end
			else
				i <= i+1;
		end
endmodule


module band(
		input clk, left, right, up, down, rst_n,
		output reg [7:0] speed
		);
		always@(posedge clk or negedge rst_n)
		begin
			if(~rst_n)
				speed <= 60;
			else if(left)
				speed <= speed - 1;
			else if(right)
				speed <= speed + 1;
			else if(down)
				speed <= speed - 10;
			else if(up)
				speed <= speed + 10;
		end
endmodule
