
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries and RTL files to the search_path variable
set PROJECT_PATH /home/IC/Final_SYS
set LIB_PATH     /home/IC/tsmc_fb_cl013g_sc/aci/sc-m

lappend search_path $LIB_PATH/synopsys
lappend search_path $PROJECT_PATH/rtl/ALU
lappend search_path $PROJECT_PATH/rtl/FIFO
lappend search_path $PROJECT_PATH/rtl/CLKDIV
lappend search_path $PROJECT_PATH/rtl/CLKGATE
lappend search_path $PROJECT_PATH/rtl/DATASYNC
lappend search_path $PROJECT_PATH/rtl/REGFILE
lappend search_path $PROJECT_PATH/rtl/PULSEGEN
lappend search_path $PROJECT_PATH/rtl/RSTSYNC
lappend search_path $PROJECT_PATH/rtl/SYSCNTRL
lappend search_path $PROJECT_PATH/rtl/CLKDIVMUX
lappend search_path $PROJECT_PATH/rtl/UART/RX
lappend search_path $PROJECT_PATH/rtl/UART/TX
lappend search_path $PROJECT_PATH/rtl/UART/TOP
lappend search_path $PROJECT_PATH/rtl/SYSTOP
lappend search_path $PROJECT_PATH/rtl/MUX2X1


set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format_v verilog
set file_format_sv sverilog

#ALU
analyze -format $file_format_v ALU.v
#FIFO
analyze -format $file_format_v SYNC.v
analyze -format $file_format_v FIFO_MEM_CNTRL.v
analyze -format $file_format_v FIFO_RD.v
analyze -format $file_format_v FIFO_WR.v
analyze -format $file_format_v ASYNC_FIFO.v
#CLK_DIVIDER MUX
analyze -format $file_format_v CLKDIV_MUX.v
#CLK_DIVIDER
analyze -format $file_format_sv CLKDIV.sv
#CLK_GATING
analyze -format $file_format_v CLK_GATE.v
#DATA_SYNC
analyze -format $file_format_v DATA_SYNC.v
#REGISTER_FILE
analyze -format $file_format_v RegisterFile.v
#PULSE_GENERATOR
analyze -format $file_format_v PULSE_GEN.v
#RST_SYNC
analyze -format $file_format_v RST_SYNC.v
#SYS_CONTROLLER
analyze -format $file_format_sv SYS_CNTRL.sv
#UART_RX
analyze -format $file_format_sv UART_RX_DATA_SAMPLING.sv
analyze -format $file_format_sv UART_RX_DESERIALIZER.sv
analyze -format $file_format_sv UART_RX_EDG_BIT_COUNTER.sv
analyze -format $file_format_sv UART_RX_PAR_CHK.sv
analyze -format $file_format_sv UART_RX_STP_CHK.sv
analyze -format $file_format_sv UART_RX_STRT_CHK.sv
analyze -format $file_format_sv UART_RX.sv
analyze -format $file_format_sv UART_RX_FSM.sv
#UART_TX
analyze -format $file_format_sv UART_TX_MUX.sv
analyze -format $file_format_sv UART_TX_PARITY_CALC.sv
analyze -format $file_format_sv UART_TX_SERIALIZER.sv
analyze -format $file_format_sv UART_TX.sv
analyze -format $file_format_sv UART_TX_FSM.sv
#UART_TOP
analyze -format $file_format_v UART.v
#MUX2X1
analyze -format $file_format_v MUX2X1.v
#SYS_TOP
analyze -format $file_format_v SYS_TOP_DFT.v

elaborate -lib WORK SYS_TOP

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design >> reports/check_design.rpt

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix -style multiplexed_flip_flop -replace true -max_length 100  

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -scan

################################################################### 
# Setting Test Timing Variables
################################################################### 

# Preclock Measure Protocol (default protocol)
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports SCAN_CLK]  -type ScanClock   -view existing_dft -timing {30 60}
set_dft_signal -port [get_ports SCAN_RST]  -type Reset       -view existing_dft -active_state 0
set_dft_signal -port [get_ports TEST_MODE] -type Constant    -view existing_dft -active_state 1 
set_dft_signal -port [get_ports TEST_MODE] -type TestMode    -view spec         -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec         -active_state 1 -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec  

############################# Create Test Protocol #####################

create_test_protocol
                            
###################### Pre-DFT Design Rule Checking ####################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ###############################

insert_dft

######################## Optimize Logic post DFT #######################

compile -scan -incremental

###################### Design Rule Checking post DFT ###################

dft_drc -verbose -coverage_estimate

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf  sdf/$top_module.sdf
write_sdc  -nosplit sdc/$top_module.sdc

####################### reporting ##########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min -max_paths 20 > reports/hold.rpt
report_timing -delay_type max -max_paths 20 > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
report_constraint -all_violators -nosplit > reports/constraints.rpt

################# starting graphical user interface #######################

#gui_start

#exit
