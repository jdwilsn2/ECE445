transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/serializer.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/deserializer.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/clk_div_N.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/dac_adc_test.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/dac_adc_test_ctrl.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/SEG7_LUT.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445/output_files {C:/Users/Justin/Documents/GitHub/ECE445/output_files/register.sv}
vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/test.sv}

vlog -sv -work work +incdir+C:/Users/Justin/Documents/GitHub/ECE445 {C:/Users/Justin/Documents/GitHub/ECE445/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
