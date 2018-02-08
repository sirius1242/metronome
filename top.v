`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/12/07 15:05:49
// Design Name: 
// Module Name: top
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


module top(
		input clk, rst_n, left, right, up, down, [15:0] SW,
		output bell, [2:0] sel, [6:0] segment, [15:0] LED
    );
		wire [7:0] speed;
		wire [31:0] data;
		wire inc, dec, add, min;
		assign data[15:0] = speed / 100 * 256 + speed % 100 /10 * 16 + speed % 100 % 10;
		metronome metronome1(speed, clk, rst_n, SW, bell, LED);
		seg seg1(clk, rst_n, data, sel, segment);
		band band1(clk, dec, inc, add, min, rst_n, speed);
		no_fitter left_fit(left, rst_n, clk, dec);
		no_fitter right_fit(right, rst_n, clk, inc);
		no_fitter up_fit(up, rst_n, clk, add);
		no_fitter down_fit(down, rst_n, clk, min);
		endmodule
