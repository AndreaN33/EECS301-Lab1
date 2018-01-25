`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    013:32:00 08/15/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #1 Project
// Module Name:    EECS301_Lab1_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    EECS301 Lab 1 Top Level File targeting the DE1-SoC Dev Board.
//                 
//
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module EECS301_Lab1_TopLevel
(
	// Clock Signals
	input          CLOCK_50,

	// LED Signals
	output   [9:0] LEDR,

	// HEX LED Display Signals (Active-Low)
	output   [6:0] HEX0, // HEX LED Disp 0
	output   [6:0] HEX1, // HEX LED Disp 1
	output   [6:0] HEX2, // HEX LED Disp 2
	output   [6:0] HEX3, // HEX LED Disp 3
	output   [6:0] HEX4, // HEX LED Disp 4
	output   [6:0] HEX5, // HEX LED Disp 5
	
	// Key Button Signals (Active-Low)
	input    [3:0] KEY
);

	
	//
	// Synchronize KEY input signals to system clock
	//
	reg [3:0] key_sync_reg;
	
	always @(posedge CLOCK_50)
	begin
		key_sync_reg <= ~KEY;
	end

	
	//
	// Default Output Assignments
	//
//	reg       key_all_on;
//
//	always @(posedge CLOCK_50)
//	begin
//		key_all_on <= &key_sync_reg;
//	end	
//	
//	assign LEDR[9:4] = key_all_on ? 6'h3F : 6'h00;
//	assign LEDR[3:0] = key_sync_reg;
//
//	assign HEX0 = key_all_on ? 7'h00 : 7'h7F;
//	assign HEX1 = key_all_on ? 7'h00 : 7'h7F;
//	assign HEX2 = key_all_on ? 7'h06 : ~7'h06;
//	assign HEX3 = key_all_on ? 7'h7C : ~7'h7C;
//	assign HEX4 = key_all_on ? 7'h77 : ~7'h77;
//	assign HEX5 = key_all_on ? 7'h38 : ~7'h38;


	//
	// Lab 1 Frustration Module
	//
	
	Lab1_Frustration_Module frustration_module
	(
		// LED Signals
		.LEDR( LEDR ),

		// HEX LED Display Signals (Active-Low)
		.HEX0( HEX0 ), // HEX LED Disp 0
		.HEX1( HEX1 ), // HEX LED Disp 1
		.HEX2( HEX2 ), // HEX LED Disp 2
		.HEX3( HEX3 ), // HEX LED Disp 3
		.HEX4( HEX4 ), // HEX LED Disp 4
		.HEX5( HEX5 ), // HEX LED Disp 5
		
		// Key Button Signals (Active-Low)
		.KEY( key_sync_reg ),

		// Clock Signal
		.CLOCK_50( CLOCK_50 )
	);

endmodule
