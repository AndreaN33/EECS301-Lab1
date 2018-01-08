#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]

# for enhancing USB BlasterII to be reliable, 25MHz
#create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
#set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tdi]
#set_input_delay -clock altera_reserved_tck -clock_fall 3 [get_ports altera_reserved_tms]
#set_output_delay -clock altera_reserved_tck 3 [get_ports altera_reserved_tdo]

#**************************************************************
# Create Generated Clock
#**************************************************************

derive_pll_clocks



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {KEY[0]}]
set_input_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {KEY[1]}]
set_input_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {KEY[2]}]
set_input_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {KEY[3]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[0]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[1]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[2]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[3]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[4]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[5]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[6]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[7]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[8]}]
set_output_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {LEDR[9]}]

set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX0[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX1[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX2[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX3[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX4[6]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[2]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[4]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[5]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  10.000 [get_ports {HEX5[6]}]

#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



