set_global_assignment -entity "nios_system" -library "lib_nios_system" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "nios_system" -library "lib_nios_system" -name IP_TOOL_VERSION "13.0sp1"
set_global_assignment -entity "nios_system" -library "lib_nios_system" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_nios_system" -name SPD_FILE [file join $::quartus(sip_path) "../../nios_system.spd"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "../../nios_system.qsys"]

set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "nios_system.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_irq_mapper.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_width_adapter.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_address_alignment.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_uncompressor.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_arbitrator.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_rsp_xbar_mux_001.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_rsp_xbar_mux.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_rsp_xbar_demux_002.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_rsp_xbar_demux.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_cmd_xbar_mux.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_cmd_xbar_demux_001.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_cmd_xbar_demux.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_burst_adapter.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_traffic_limiter.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_st_pipeline_base.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_id_router_005.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_id_router_002.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_id_router.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_addr_router_001.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_addr_router.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_slave_agent.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_master_agent.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_slave_translator.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_master_translator.sv"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_to_cpu_ACK.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_to_fsm_ACK.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_up_character_lcd_communication.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_up_character_lcd_initialization.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_character_lcd_0.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_jtag_uart.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_control_words.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_keys.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_onchip_memory.hex"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_onchip_memory.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor.ocp"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor.sdc"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor.vo"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ic_tag_ram.dat"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ic_tag_ram.hex"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ic_tag_ram.mif"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_jtag_debug_module_sysclk.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_jtag_debug_module_tck.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_jtag_debug_module_wrapper.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_nios2_waves.do"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ociram_default_contents.dat"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ociram_default_contents.hex"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_ociram_default_contents.mif"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_oci_test_bench.v"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_a.dat"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_a.hex"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_a.mif"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_b.dat"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_b.hex"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_rf_ram_b.mif"]
set_global_assignment -library "lib_nios_system" -name MISC_FILE [file join $::quartus(sip_path) "submodules/nios_system_nios2_processor_test_bench.v"]
