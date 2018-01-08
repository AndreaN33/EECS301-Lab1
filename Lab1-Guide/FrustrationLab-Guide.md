# Frustration Lab

The framework code used in the Quartus Tutorial implemented a simple design to light up some LEDs when pushing buttons.  The code was error free so the compilation process was easy (hopefully).  In the next part of the lab, another framework module will be added to the design, except the new module code has numerous bugs. The goal will be to fix the problems and in the process see some of the more common (and confusing) Quartus error messages.

## Assignment Step Overview

* Add the Frustration Module to the design.
* Error Debugging Walkthrough (iteratively compile and fix bugs)
* Load the error-free image on the Development board 

## Lab System Architecture

![Lab System Architecture](images/Lab1-SystemArchitecture-small.png)

## Frustration Module Instantiation

The **Lab1\_Frustration\_Module** was included with the framework code and was added to the project during the project creation in the Quartus Tutorial.  The module code is in the file `Lab1_Frustration_Module.v`.

FPGA designs are hierarchical and, by convention, the top most module in the design will be called the **Top Level** module.  For the Lab 1 Project this module is called **EECS301\_Lab1\_TopLevel**.  Modules and hierarchical design will be covered more in the next lab.  For now, we simply need to uncomment the module instantiation already provided in the top level module.

### Assignment Steps:

1. If not already open, open the Lab 1 Project, `EECS301_Lab1_TopLevel.qsf`, created during the Quartus tutorial.

	:warning: **WARNING:** Make sure to use **Open Project...** instead of **Open...** from the **File** menu.  **Open** will open just the file whereas **Open Project** loads the entire project.

1. Add the `Lab1_Frustration_Module.v` to the project by selecting the **Project** -> **Add/Remove Files in Project...**

	Use the `...` button to open the file browser and select the `Lab1_Frustration_Module.v` file.  
	
	You should see the file added to the file list.
	
	![Add Files](images/QuartusAddFile01.png)


2. On the left-hand side of the Quartus window, the Project Navigator panel will show all the modules and files in the project.  Open the top level module by double-clicking on the module name, **EECS301\_Lab1\_TopLevel**, in the navigator panel Hierarchy view.

	**NOTE:** The Project Navigator panel has a drop-down menu to switch between viewing the project module Hierarchy and the project Files.	
	![Project Navigator](images/ProjectNavigator01.png)
	
	**WARNING:** The Project Hierarchy is only updated after compiling the project so you may not see your changes right away.  Switching to the **Project Files** view is usually easier in the early stages of a project when the module structure is in flux.

3. In the **EECS301\_Lab1\_TopLevel** editor window, scroll down to see the commented-out **Lab1\_Frustration\_Module** instantiation.

	```verilog
		//
		// Lab 1 Frustration Module
		//
	
	//	Lab1_Frustration_Module frustration_module
	//	(
	//		// LED Signals
	//		.LEDR( LEDR ),
	//
	//		// HEX LED Display Signals (Active-Low)
	//		.HEX0( HEX0 ), // HEX LED Disp 0
	//		.HEX1( HEX1 ), // HEX LED Disp 1
	//		.HEX2( HEX2 ), // HEX LED Disp 2
	//		.HEX3( HEX3 ), // HEX LED Disp 3
	//		.HEX4( HEX4 ), // HEX LED Disp 4
	//		.HEX5( HEX5 ), // HEX LED Disp 5
	//	
	//		// Key Button Signals (Active-Low)
	//		.KEY( key_sync_reg ),
	//
	//		// Clock Signal
	//		.CLOCK_50( CLOCK_50 )
	//	);
	```

	**NOTE:** Verilog uses C-style comments: `//` to comment the remaining line and ``/* */`` to comment a section. Note that each line is commented here instead of using the block comment syntax.  Commenting this way make it easier to see block changes in the Git difference reports since the change is shown as a single change instead of two changes.

4. Remove the comment `//` from the beginning of each line of the module instantiation to enable the module.

	**NOTE:** The Quartus editor allows block selections by holding the **Alt** key while selecting the block with the mouse.

5. Save the file by either selecting **File** -> **Save** from the menu, clicking the **Save** icon on the toolbar, or using the key command **Ctrl+s**.

You are now ready to start the debugging walkthrough.

## Errors Walkthrough

Resolving errors in Quartus is an iterative process.  Many times one error will cascade many other error or warning messages.  Fixing the first error clears up the others so when looking at the Compilation Messages only focus on the first problem then try to recompile.  Its not fun trying to find phantom errors. 

### Assignment Steps:

1. In the **Tasks** panel, make sure the design flow drop-down is set to **Compilation**.

1. The compilation process is going to be run a number of times.  To save some time, instead of running the full compilation every time, run just the **Analysis & Synthesis** phase (which is first) until no errors are thrown. 
	
	The **Analysis & Synthesis** process can be run by expanding the **Compile Design** line and double-clicking on the **Analysis & Synthesis** line.
	
	![Tasks](images/TasksCompilation01.png)
	
1. When the **Analysis & Synthesis** finishes, there will be a lot of errors listed in the **Messages** window.  If the **Messages** window is not visible, click **Alt+3** to show it.

1. Scroll to the top of the message list.  

	![Messages](images/CompilerMessages01.png)
	
	The message list will show Info, Warning, Critical Warning or Error messages.  The messages can be filtered using the buttons in the upper-left corner so it's easier to find the problem messages among lots of info messages.
	
1. The following steps will walkthrough the error messages.  Hopefully the order of messages presented matches the errors given by Quartus.  You may have to jump around if Quartus ends up compiling in a different order.
	
1. The first Error message listed in the window should be:

	```
	Error (10170): Verilog HDL syntax error at Lab1_Frustration_Module.v(37) near text: ")";  expecting a direction. Check for and fix any syntax errors that appear immediately before or at the specified keyword. The Intel FPGA Knowledge Database contains many articles with specific details on how to resolve this error. Visit the Knowledge Database at https://www.altera.com/support/support-resources/knowledge-base/search.html and search for this specific error message number.
	```
	
	Double-click the error in the message window to jump to where the compiler thinks the error occurs.  Often, then error isn't actually on the line the compiler specifies but happens before the line.  In this case, there should not be a comma at the end of the last signal in the module definition.  
	
	Remove the comma after `CLOCK_50` to fix the error, then re-run the **Analysis & Synthesis** process.
	
1. The next error in the messages window should be:

	```
	Error (10170): Verilog HDL syntax error at Lab1_Frustration_Module.v(46) near text: "wire";  expecting ";". Check for and fix any syntax errors that appear immediately before or at the specified keyword. The Intel FPGA Knowledge Database contains many articles with specific details on how to resolve this error. Visit the Knowledge Database at https://www.altera.com/support/support-resources/knowledge-base/search.html and search for this specific error message number.
	```
	
	The compiler points to line 46 as the problem but, once again, this error is caused by earlier code.  The module header definition should be terminated with a semi-colon but it is missing.  Add-in the semi-colon as shown below:

	
	```verilog
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
	```
	
	Save the change, then re-run the **Analysis & Synthesis** process.

1. The next error in the messages window should be:

	```
	Error (10219): Verilog HDL Continuous Assignment error at Lab1_Frustration_Module.v(55): object "key0_value" on left-hand side of assignment must have a net type
	```
	
	This error happens when a continuous assignment is made (using **assign**) to a variable defined as a register.  In Verilog, wires are always continuous assignments whereas register assignments can be either combinatorial or sequential but must always be made within a process block.	
	Fix the error by changing the **reg** keyword to **wire** in the signal definition for **key0_value**.
	
	```verilog
	wire [3:0] key0_value;
	```
	
	Save the change, then re-run the **Analysis & Synthesis** process.
	
1. The next error in the messages window should be:

	```
	Error (10137): Verilog HDL Procedural Assignment error at Lab1_Frustration_Module.v(65): object "key_value" on left-hand side of assignment must have a variable data type
	```
	
	This is the opposite case of the last error.  Here the **key_value** variable is defined as a wire is used in a clocked assignment.  Fix the error by changing the **wire** keyword to **reg** in the signal definition for **key_value**.
	
	```verilog
	reg  [3:0] key_value;
	```
	
	Save the change, then re-run the **Analysis & Synthesis** process.

1. Next should be a big list of errors from the top level module similar to this message:

	```
	Error (12014): Net "LEDR[9]", which fans out to "LEDR[9]", cannot be assigned more than one value
		Error (12015): Net is fed by "GND"
		Error (12015): Net is fed by "Lab1_Frustration_Module:frustration_module|LEDR[9]"

	```
	
	This error indicates a signal conflict due to multiple assignment sources trying to drive the same signal.  Signals can have only one source driver but here the LEDR signals are being driven by both GND and a signal from the frustration_module.
	
	In this case, the problem occurred when the Frustration Module was uncommented in the `EECS301_Lab1_TopLevel` module. The Frustration Module drives the LEDR and HEXx signals that were already being assigned values in the Default Output Assignments section, shown here.
	
	```verilog
	//
	// Default Output Assignments
	//
	
	assign LEDR[9:4] = key_all_on ? 6'h3F : 6'h00;
	assign LEDR[3:0] = key_sync_reg;

	assign HEX0 = key_all_on ? 7'h00 : 7'h7F;
	assign HEX1 = key_all_on ? 7'h00 : 7'h7F;
	assign HEX2 = key_all_on ? 7'h06 : ~7'h06;
	assign HEX3 = key_all_on ? 7'h7C : ~7'h7C;
	assign HEX4 = key_all_on ? 7'h77 : ~7'h77;
	assign HEX5 = key_all_on ? 7'h38 : ~7'h38;
	```
	
	To fix the problem, comment out these assignments (by placing a `//` at the beginning of each line).  The Frustration Module will replace the Default Output Assignments.
	
	Save the file, then re-run the **Analysis & Synthesis** process.

1. 	The following warning messages are ones frequently seen in projects where pins are hard-wired either high or low.  

	```
	Warning (13024): Output pins are stuck at VCC or GND
		Warning (13410): Pin "HEX2[1]" is stuck at VCC
		Warning (13410): Pin "HEX2[2]" is stuck at VCC
		Warning (13410): Pin "HEX3[4]" is stuck at VCC
	```

	In this case, it is intended functionality so these messages can be ignored.
	
	In general, carefully look over the warning messages because logic errors can cause whole chunks of code to be eliminated and these messages may be the only flagged indication that there is no logic driving a pin.
	
1. Finally, the compilation should run through the **Analysis & Synthesis** process cleanly.  Now run the full compilation by double-clicking the **Compile Design** task.

	**NOTE:** If you are running the **Quartus Prime Lite Edition** on your own machine, you may see the following message which you can safely ignore:

	```
	Warning (292013): Feature LogicLock is only available with a valid subscription license. You can purchase a software subscription to gain full access to this feature.
	```

The build should now complete without any serious errors or warnings and the image can be loaded on the development board.  If you still have errors go back though the instruction steps to see if something was missed.  The `git diff` command can be used to see what changes you've made to the working files.

## Load the Development Board Image

After fixing all the bugs and getting a clean build, the image can be loaded on the development board.

Follow the same instructions in the [Development Kit Hardware Guide](DevKitHardware-Guide.md) that were used during the Quartus tutorial.

The Frustration Module changed the design functionality.  Each button is now assigned a value (1, 2, 3, and 4).  The total value of the pressed buttons are displayed by the number of LEDs lit and in decimal format on the Seven-Segment LED Displays.

---

Return to the [Lab 1 Assignment](../README.md) page...
