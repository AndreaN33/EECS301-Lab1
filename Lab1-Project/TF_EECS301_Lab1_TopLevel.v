`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Case Western Reserve University
// Engineer: Matt McConnell
// 
// Create Date:    09:32:00 01/19/2017 
// Project Name:   EECS301 Digital Design
// Design Name:    Lab #1 Demo
// Module Name:    TF_EECS301_Lab1_TopLevel
// Target Devices: Altera Cyclone V
// Tool versions:  Quartus v17.0
// Description:    Test Bench Simulation for EECS301_Lab1_TopLevel
//                 
//
// Dependencies:   EECS301_Lab1_TopLevel.v
//
//////////////////////////////////////////////////////////////////////////////////

module TF_EECS301_Lab1_TopLevel();

	//
	// Signal Declarations
	//
	// Signals must be declared before they are used so either
	//   declare everything at the top of the file or 
	//   group the declarations with the code where they are first used.
	//
	reg        CLOCK_50;
	reg  [3:0] KEY;
	wire [9:0] LEDR;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
	wire [6:0] HEX2;
	wire [6:0] HEX3;
	wire [6:0] HEX4;
	wire [6:0] HEX5;
	
	
	//
	// System Clock Emulation
	//
	// Toggle the CLOCK_50 signal every 10 ns to create to 50MHz clock signal.
	// The CLK_HALF_PER calculation converts Hz into ns for the clock period then 
	//   divides by 2 so the signal is toggled twice per cycle.
	//
	localparam CLK_RATE_HZ = 50000000; // 50 MHz
	localparam CLK_HALF_PER = ((1.0 / CLK_RATE_HZ) * 1000000000.0) / 2.0; // ns
	
	initial
	begin
		CLOCK_50 = 1'b0;
		forever #(CLK_HALF_PER) CLOCK_50 = ~CLOCK_50;
	end


	//
	// Unit Under Test: EECS301_Lab1_TopLevel
	//
	// This is the instantiation of the module being tested.
	//   Input signals
	//     CLOCK_50  1-bit  50MHz Clock
	//     KEY       4-bit  Push Button Inputs (Active-Low)
	//   Output signals
	//     LEDR     10-bit  Status LED Controls
	//     HEX0     7-bit   Seven-Segment LED Controls (Active-Low)
	//     HEX1     7-bit   Seven-Segment LED Controls (Active-Low)
	//     HEX2     7-bit   Seven-Segment LED Controls (Active-Low)
	//     HEX3     7-bit   Seven-Segment LED Controls (Active-Low)
	//     HEX4     7-bit   Seven-Segment LED Controls (Active-Low)
	//     HEX5     7-bit   Seven-Segment LED Controls (Active-Low)
	EECS301_Lab1_TopLevel uut
	(
		// Clock Signals
		.CLOCK_50( CLOCK_50 ),

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
		.KEY( KEY )
	);
	

	//
	// Expected Key Value Computation
	//
	wire [3:0] exp_key_value;

	wire [3:0] exp_key0_value = ~KEY[0] ? 4'h1 : 4'h0; // KEY[0] = 1
	wire [3:0] exp_key1_value = ~KEY[1] ? 4'h2 : 4'h0; // KEY[1] = 2
	wire [3:0] exp_key2_value = ~KEY[2] ? 4'h3 : 4'h0; // KEY[3] = 3
	wire [3:0] exp_key3_value = ~KEY[3] ? 4'h4 : 4'h0; // KEY[4] = 4
	
	assign exp_key_value = exp_key3_value + exp_key2_value + exp_key1_value + exp_key0_value;
	
	//
	// Expected LED Output Computation
	//
	// The expected LED output value is determined from the computed
	//   key value.  
	reg [9:0] exp_ledr_value;
	
	always @*
	begin
		case (exp_key_value)
			4'h0 : exp_ledr_value <= 10'b0000000000;
			4'h1 : exp_ledr_value <= 10'b0000000001;
			4'h2 : exp_ledr_value <= 10'b0000000011;
			4'h3 : exp_ledr_value <= 10'b0000000111;
			4'h4 : exp_ledr_value <= 10'b0000001111;
			4'h5 : exp_ledr_value <= 10'b0000011111;
			4'h6 : exp_ledr_value <= 10'b0000111111;
			4'h7 : exp_ledr_value <= 10'b0001111111;
			4'h8 : exp_ledr_value <= 10'b0011111111;
			4'h9 : exp_ledr_value <= 10'b0111111111;
			4'hA : exp_ledr_value <= 10'b1111111111;
			default : exp_ledr_value <= 10'bxxxxxxxxxx; // Invalid Key Value
		endcase
	end
	
	
	//
	// Test Stimulus
	//
	// This process provides the main testing routine for the simulation.
	// Note the use of blocking assignments for sequential process execution.
	//
	integer i;
	reg [3:0] test_key_reg;
	reg       test_pass_fail;
	
	initial
	begin
	
		// Initialize Signals
		KEY = 4'hF; // The 4'hF value sets each of the four KEY bits high (off)
		test_pass_fail = 1'b1;
		test_key_reg = 4'h0;
	
	
		// Delay for system to stabilize (in lieu of a Reset)
		#1000; // Delay 1000 ns
		
		
		/////////////////////////////////////////////////////
		//
		// Start Testing
		//
		
		
		//
		// Simulate single button presses
		//
		// Each of the four Keys are individually pressed for 1000ns.
		// The LEDR output is verified 100ns after the key press starts.
		// There is 1000ns between Key Press tests. 
		//
		
		// The $display function prints messages to the terminal message log
		$display("Single Button Press Tests");
		
		// Press Key 1
		KEY[0] = 1'b0; // Press Key (KEY is indexed so only bit 0 is changed)
		#100;
		test_pass_fail = exp_ledr_value == LEDR ? 1'b1 : 1'b0;  // This uses the ternary if-then-else operation
		if (test_pass_fail)
			$display(" KEY[0] Press Passed. Key Value = %d", exp_key_value);
		else
			$display(" KEY[0] Press FAILED!!!  Expected [%010b] != Actual [%010b]", exp_ledr_value, LEDR);
		#900;
		KEY[0] = 1'b1; // Release Key

		#1000;
		
		// Press Key 2
		KEY[1] = 1'b0; // Press Key
		#100;
		test_pass_fail = exp_ledr_value == LEDR ? 1'b1 : 1'b0;
		if (test_pass_fail)
			$display(" KEY[1] Press Passed. Key Value = %d", exp_key_value);
		else
			$display(" KEY[1] Press FAILED!!!  Expected [%010b] != Actual [%010b]", exp_ledr_value, LEDR);
		#900;
		KEY[1] = 1'b1; // Release Key

		#1000;
		
		// Press Key 3
		KEY[2] = 1'b0; // Press Key
		#100;
		test_pass_fail = exp_ledr_value == LEDR ? 1'b1 : 1'b0;
		if (test_pass_fail)
			$display(" KEY[2] Press Passed. Key Value = %d", exp_key_value);
		else
			$display(" KEY[2] Press FAILED!!!  Expected [%010b] != Actual [%010b]", exp_ledr_value, LEDR);
		#900;
		KEY[2] = 1'b1; // Release Key

		#1000;
		
		// Press Key 4
		KEY[3] = 1'b0; // Press Key
		#100;
		test_pass_fail = exp_ledr_value == LEDR ? 1'b1 : 1'b0;
		if (test_pass_fail)
			$display(" KEY[3] Press Passed. Key Value = %d", exp_key_value);
		else
			$display(" KEY[3] Press FAILED!!!  Expected [%010b] != Actual [%010b]", exp_ledr_value, LEDR);
		#900;
		KEY[3] = 1'b1; // Release Key

		#2000;
		
		//
		// Run thorough all KEY input combinations
		//
		// The same test routine is used in a loop to test every possible key
		// press combination for full coverage verification.

		$display("Full Coverage Key Press Tests");

		test_key_reg = 4'h0;
		
		for (i=0; i < 16; i=i+1)
		begin
		
			// Assign the test pattern to the KEY input 
			KEY = ~test_key_reg; // KEY is active-low so invert the test pattern
			#100;
			test_pass_fail = exp_ledr_value == LEDR ? 1'b1 : 1'b0;
			if (test_pass_fail)
				$display(" KEY Pattern [%04b] Press Passed. Key Value = %d", test_key_reg, exp_key_value);
			else
				$display(" KEY Pattern [%04b] Press FAILED!!!  Expected [%010b] != Actual [%010b]", test_key_reg, exp_ledr_value, LEDR);
			#900;
			KEY = 4'hF; // Release All Keys

			#1000;
			
			// Next Test Key Pattern
			test_key_reg = test_key_reg + 1'b1;
			
		end
		
		KEY = 4'hF; // Release All Keys

		//
		// Add another Key Test Pattern here...
		//
		#2000;


		
	end
	
endmodule
