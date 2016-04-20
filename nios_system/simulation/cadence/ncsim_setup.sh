
# (C) 2001-2016 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 13.0sp1 232 win32 2016.04.18.20:10:20

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="nios_system"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/13.0sp1/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/irq_mapper/
mkdir -p ./libraries/width_adapter/
mkdir -p ./libraries/rsp_xbar_mux_001/
mkdir -p ./libraries/rsp_xbar_mux/
mkdir -p ./libraries/rsp_xbar_demux_002/
mkdir -p ./libraries/rsp_xbar_demux/
mkdir -p ./libraries/cmd_xbar_mux/
mkdir -p ./libraries/cmd_xbar_demux_001/
mkdir -p ./libraries/cmd_xbar_demux/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/burst_adapter/
mkdir -p ./libraries/limiter/
mkdir -p ./libraries/id_router_005/
mkdir -p ./libraries/id_router_002/
mkdir -p ./libraries/id_router/
mkdir -p ./libraries/addr_router_001/
mkdir -p ./libraries/addr_router/
mkdir -p ./libraries/nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo/
mkdir -p ./libraries/nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent/
mkdir -p ./libraries/nios2_processor_data_master_translator_avalon_universal_master_0_agent/
mkdir -p ./libraries/nios2_processor_jtag_debug_module_translator/
mkdir -p ./libraries/nios2_processor_data_master_translator/
mkdir -p ./libraries/to_cpu_ACK/
mkdir -p ./libraries/to_fsm_ACK/
mkdir -p ./libraries/character_lcd_0/
mkdir -p ./libraries/jtag_uart/
mkdir -p ./libraries/control_words/
mkdir -p ./libraries/keys/
mkdir -p ./libraries/onchip_memory/
mkdir -p ./libraries/nios2_processor/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/cycloneive_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/submodules/nios_system_onchip_memory.hex ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ic_tag_ram.dat ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ic_tag_ram.hex ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ic_tag_ram.mif ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ociram_default_contents.dat ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ociram_default_contents.hex ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_ociram_default_contents.mif ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/submodules/nios_system_nios2_processor_rf_ram_b.mif ./
fi

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v" -work altera_ver      
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"          -work lpm_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"             -work sgate_ver       
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cycloneive_atoms.v"  -work cycloneive_ver  
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_irq_mapper.sv"                               -work irq_mapper                                                                           -cdslib ./cds_libs/irq_mapper.cds.lib                                                                          
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                          -work width_adapter                                                                        -cdslib ./cds_libs/width_adapter.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                      -work width_adapter                                                                        -cdslib ./cds_libs/width_adapter.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                     -work width_adapter                                                                        -cdslib ./cds_libs/width_adapter.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                             -work rsp_xbar_mux_001                                                                     -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                                    
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_rsp_xbar_mux_001.sv"                         -work rsp_xbar_mux_001                                                                     -cdslib ./cds_libs/rsp_xbar_mux_001.cds.lib                                                                    
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                             -work rsp_xbar_mux                                                                         -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                                        
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_rsp_xbar_mux.sv"                             -work rsp_xbar_mux                                                                         -cdslib ./cds_libs/rsp_xbar_mux.cds.lib                                                                        
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_rsp_xbar_demux_002.sv"                       -work rsp_xbar_demux_002                                                                   -cdslib ./cds_libs/rsp_xbar_demux_002.cds.lib                                                                  
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_rsp_xbar_demux.sv"                           -work rsp_xbar_demux                                                                       -cdslib ./cds_libs/rsp_xbar_demux.cds.lib                                                                      
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                             -work cmd_xbar_mux                                                                         -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                                        
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_cmd_xbar_mux.sv"                             -work cmd_xbar_mux                                                                         -cdslib ./cds_libs/cmd_xbar_mux.cds.lib                                                                        
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_cmd_xbar_demux_001.sv"                       -work cmd_xbar_demux_001                                                                   -cdslib ./cds_libs/cmd_xbar_demux_001.cds.lib                                                                  
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_cmd_xbar_demux.sv"                           -work cmd_xbar_demux                                                                       -cdslib ./cds_libs/cmd_xbar_demux.cds.lib                                                                      
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                               -work rst_controller                                                                       -cdslib ./cds_libs/rst_controller.cds.lib                                                                      
  ncvlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                             -work rst_controller                                                                       -cdslib ./cds_libs/rst_controller.cds.lib                                                                      
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                          -work burst_adapter                                                                        -cdslib ./cds_libs/burst_adapter.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                      -work burst_adapter                                                                        -cdslib ./cds_libs/burst_adapter.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                        -work limiter                                                                              -cdslib ./cds_libs/limiter.cds.lib                                                                             
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                        -work limiter                                                                              -cdslib ./cds_libs/limiter.cds.lib                                                                             
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_id_router_005.sv"                            -work id_router_005                                                                        -cdslib ./cds_libs/id_router_005.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_id_router_002.sv"                            -work id_router_002                                                                        -cdslib ./cds_libs/id_router_002.cds.lib                                                                       
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_id_router.sv"                                -work id_router                                                                            -cdslib ./cds_libs/id_router.cds.lib                                                                           
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_addr_router_001.sv"                          -work addr_router_001                                                                      -cdslib ./cds_libs/addr_router_001.cds.lib                                                                     
  ncvlog -sv "$QSYS_SIMDIR/submodules/nios_system_addr_router.sv"                              -work addr_router                                                                          -cdslib ./cds_libs/addr_router.cds.lib                                                                         
  ncvlog     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                 -work nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo -cdslib ./cds_libs/nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo.cds.lib
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                            -work nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent          -cdslib ./cds_libs/nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent.cds.lib         
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                     -work nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent          -cdslib ./cds_libs/nios2_processor_jtag_debug_module_translator_avalon_universal_slave_0_agent.cds.lib         
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                           -work nios2_processor_data_master_translator_avalon_universal_master_0_agent               -cdslib ./cds_libs/nios2_processor_data_master_translator_avalon_universal_master_0_agent.cds.lib              
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                       -work nios2_processor_jtag_debug_module_translator                                         -cdslib ./cds_libs/nios2_processor_jtag_debug_module_translator.cds.lib                                        
  ncvlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                      -work nios2_processor_data_master_translator                                               -cdslib ./cds_libs/nios2_processor_data_master_translator.cds.lib                                              
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_to_cpu_ACK.v"                                -work to_cpu_ACK                                                                           -cdslib ./cds_libs/to_cpu_ACK.cds.lib                                                                          
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_to_fsm_ACK.v"                                -work to_fsm_ACK                                                                           -cdslib ./cds_libs/to_fsm_ACK.cds.lib                                                                          
  ncvlog     "$QSYS_SIMDIR/submodules/altera_up_character_lcd_communication.v"                 -work character_lcd_0                                                                      -cdslib ./cds_libs/character_lcd_0.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/altera_up_character_lcd_initialization.v"                -work character_lcd_0                                                                      -cdslib ./cds_libs/character_lcd_0.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_character_lcd_0.v"                           -work character_lcd_0                                                                      -cdslib ./cds_libs/character_lcd_0.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_jtag_uart.v"                                 -work jtag_uart                                                                            -cdslib ./cds_libs/jtag_uart.cds.lib                                                                           
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_control_words.v"                             -work control_words                                                                        -cdslib ./cds_libs/control_words.cds.lib                                                                       
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_keys.v"                                      -work keys                                                                                 -cdslib ./cds_libs/keys.cds.lib                                                                                
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_onchip_memory.v"                             -work onchip_memory                                                                        -cdslib ./cds_libs/onchip_memory.cds.lib                                                                       
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor.vo"                          -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor_jtag_debug_module_sysclk.v"  -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor_jtag_debug_module_tck.v"     -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor_jtag_debug_module_wrapper.v" -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor_oci_test_bench.v"            -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/submodules/nios_system_nios2_processor_test_bench.v"                -work nios2_processor                                                                      -cdslib ./cds_libs/nios2_processor.cds.lib                                                                     
  ncvlog     "$QSYS_SIMDIR/nios_system.v"                                                                                                                                                                                                                                                                
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
