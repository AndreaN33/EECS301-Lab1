onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Clock Signal}
add wave -noupdate /TF_EECS301_Lab1_TopLevel/CLOCK_50
add wave -noupdate -divider {User Signals}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/KEY[0]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/KEY[1]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/KEY[2]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/KEY[3]}
add wave -noupdate -divider {LED Signals}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[0]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[1]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[2]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[3]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[4]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[5]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[6]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[7]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[8]}
add wave -noupdate {/TF_EECS301_Lab1_TopLevel/LEDR[9]}
add wave -noupdate -divider {7-Segment Display Signals}
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX0
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX1
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX2
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX3
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX4
add wave -noupdate -radix hexadecimal /TF_EECS301_Lab1_TopLevel/HEX5
add wave -noupdate -divider {Key Value Validation}
add wave -noupdate -radix unsigned /TF_EECS301_Lab1_TopLevel/uut/frustration_module/key_value
add wave -noupdate -radix unsigned /TF_EECS301_Lab1_TopLevel/exp_key_value
add wave -noupdate /TF_EECS301_Lab1_TopLevel/test_pass_fail
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5752174 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {47250 ns}
run 47 us
