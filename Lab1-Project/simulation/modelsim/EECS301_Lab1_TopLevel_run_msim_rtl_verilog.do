transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project {H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project/Lab1_Frustration_Module.v}
vlog -vlog01compat -work work +incdir+H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project {H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project/EECS301_Lab1_TopLevel.v}

vlog -vlog01compat -work work +incdir+H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project {H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project/TF_EECS301_Lab1_TopLevel.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TF_EECS301_Lab1_TopLevel

do H:/Projects/EECS301/lab1-assignment-AndreaN33/Lab1-Project/simulation/modelsim/wave.do
