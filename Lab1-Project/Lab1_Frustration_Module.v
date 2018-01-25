`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    013:32:00 08/15/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #1 Project
// Module Name:    Lab1_Frustration_Module
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    EECS301 Lab 1 Frustration Module
//                 
//
// Dependencies:   
//
//////////////////////////////////////////////////////////////////////////////////

module Lab1_Frustration_Module
(
	// LED Signals
	output reg  [9:0] LEDR,

	// HEX LED Display Signals (Active-Low)
	output      [6:0] HEX0, // HEX LED Disp 0
	output      [6:0] HEX1, // HEX LED Disp 1
	output      [6:0] HEX2, // HEX LED Disp 2
	output      [6:0] HEX3, // HEX LED Disp 3
	output      [6:0] HEX4, // HEX LED Disp 4
	output      [6:0] HEX5, // HEX LED Disp 5
	
	// Key Button Signals
	input       [3:0] KEY,

	// Clock Signal
	input       CLOCK_50
);


	////////////////////////////////////////////////////////
	//
	// Key Button Adder
	//
	// Keys are assigned values 1, 2, 3, 4.  The Key values are summed then displayed.
	//
	reg [3:0] key_value;
	wire  [3:0] key0_value;
	wire [3:0] key1_value;
	wire [3:0] key2_value;
	wire [3:0] key3_value;
	
	//
	// Assign values to each key when pressed
	//
	assign key0_value = KEY[0] ? 4'h1 : 4'h0; // KEY[0] = 1
	assign key1_value = KEY[1] ? 4'h2 : 4'h0; // KEY[1] = 2
	assign key2_value = KEY[2] ? 4'h3 : 4'h0; // KEY[3] = 3
	assign key3_value = KEY[3] ? 4'h4 : 4'h0; // KEY[4] = 4
	
	//
	// Sum all key values
	//
	always @(posedge CLOCK_50)
	begin
		key_value = key3_value + key2_value + key1_value + key0_value;
	end
	
	
	////////////////////////////////////////////////////////
	//
	// LED Display
	//
	// Show the summed Key value on the LEDs
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'h0 : LEDR <= 10'b0000000000;
			4'h1 : LEDR <= 10'b0000000001;
			4'h2 : LEDR <= 10'b0000000011;
			4'h3 : LEDR <= 10'b0000000111;
			4'h4 : LEDR <= 10'b0000001111;
			4'h5 : LEDR <= 10'b0000011111;
			4'h6 : LEDR <= 10'b0000111111;
			4'h7 : LEDR <= 10'b0001111111;
			4'h8 : LEDR <= 10'b0011111111;
			4'h9 : LEDR <= 10'b0111111111;
			4'hA : LEDR <= 10'b1111111111;
			default : LEDR <= 10'b0000000000;
		endcase
	end
	
	
	////////////////////////////////////////////////////////
	//
	// HEX Display
	//
	//  Show the summed value on Hex displays 1 & 0
	//  Show a message on Hex displays 2-5
	//
	reg [6:0] hex0_reg;
	reg [6:0] hex1_reg;
	reg [6:0] hex2_reg;
	reg [6:0] hex3_reg;
	reg [6:0] hex4_reg;
	reg [6:0] hex5_reg;
	
	//
	// HEX signals are active-low so invert the output signals
	//
	assign HEX0 = ~hex0_reg;
	assign HEX1 = ~hex1_reg;
	assign HEX2 = ~hex2_reg;
	assign HEX3 = ~hex3_reg;
	assign HEX4 = ~hex4_reg;
	assign HEX5 = ~hex5_reg;
	
	//
	// HEX0 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'h0 : hex0_reg <= 7'h3F; // 0
			4'h1 : hex0_reg <= 7'h06; // 1
			4'h2 : hex0_reg <= 7'h5B; // 2
			4'h3 : hex0_reg <= 7'h4F; // 3
			4'h4 : hex0_reg <= 7'h66; // 4
			4'h5 : hex0_reg <= 7'h6D; // 5
			4'h6 : hex0_reg <= 7'h7D; // 6
			4'h7 : hex0_reg <= 7'h27; // 7
			4'h8 : hex0_reg <= 7'h7F; // 8
			4'h9 : hex0_reg <= 7'h6F; // 9
			4'hA : hex0_reg <= 7'h3F; // 0
			default : hex0_reg <= 7'h00; // Space
		endcase
	end
		
	//
	// HEX1 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'hA : hex1_reg <= 7'h06; // 1
			default : hex1_reg <= 7'h00; // Space
		endcase
	end
	
	//
	// HEX2 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'hA : hex2_reg <= 7'h79; // E
			default : hex2_reg <= 7'h00; // Space
		endcase
	end
	
	//
	// HEX3 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'h9,
			4'hA : hex3_reg <= 7'h6D; // S
			default : hex3_reg <= 7'h00; // Space
		endcase
	end
	
	//
	// HEX4 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'h7,
			4'h8,
			4'h9,
			4'hA : hex4_reg <= 7'h77; // A
			default : hex4_reg <= 7'h00; // Space
		endcase
	end
	
	//
	// HEX5 Data
	//
	always @(posedge CLOCK_50)
	begin
		case (key_value)
			4'h4,
			4'h5,
			4'h6,
			4'h7,
			4'h8,
			4'h9,
			4'hA : hex5_reg <= 7'h39; // C
			default : hex5_reg <= 7'h00; // Space
		endcase
	end
	
endmodule
