transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/duty_lut.sv}
vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/tremolo_fsm.sv}
vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/attenuator.sv}
vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/trem_counter.sv}
vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/rate_lut.sv}
vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/tremolo.sv}

vlog -sv -work work +incdir+U:/ece445/pedals {U:/ece445/pedals/testbench2.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench2

add wave *
view structure
view signals
run 45 sec
