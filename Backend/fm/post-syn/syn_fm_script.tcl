
############################  Search PATH ################################

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

########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../syn/$top_module.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 

read_verilog -container Ref "ALU.v"
read_verilog -container Ref "CLKDIV_MUX.v"
read_verilog -container Ref "CLK_GATE.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "ASYNC_FIFO.v"
read_verilog -container Ref "FIFO_MEM_CNTRL.v"
read_verilog -container Ref "FIFO_RD.v"
read_verilog -container Ref "FIFO_WR.v"
read_verilog -container Ref "SYNC.v"
read_verilog -container Ref "PULSE_GEN.v"
read_verilog -container Ref "RegisterFile.v"
read_verilog -container Ref "RST_SYNC.v"
read_sverilog -container Ref "CLKDIV.sv"
read_sverilog -container Ref "SYS_CNTRL.sv"
read_sverilog -container Ref "UART_RX.sv"
read_sverilog -container Ref "UART_RX_DATA_SAMPLING.sv"
read_sverilog -container Ref "UART_RX_DESERIALIZER.sv"
read_sverilog -container Ref "UART_RX_EDG_BIT_COUNTER.sv"
read_sverilog -container Ref "UART_RX_FSM.sv"
read_sverilog -container Ref "UART_RX_PAR_CHK.sv"
read_sverilog -container Ref "UART_RX_STP_CHK.sv"
read_sverilog -container Ref "UART_RX_STRT_CHK.sv"
read_sverilog -container Ref "UART_TX.sv"
read_sverilog -container Ref "UART_TX_FSM.sv"
read_sverilog -container Ref "UART_TX_MUX.sv"
read_sverilog -container Ref "UART_TX_PARITY_CALC.sv"
read_sverilog -container Ref "UART_TX_SERIALIZER.sv"
read_verilog -container Ref "UART.v"
read_verilog -container Ref "SYS_TOP.v"

######################## set the top Reference Design ######################## 

set_reference_design SYS_TOP
set_top SYS_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/Final_SYS/syn/netlists/SYS_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYS_TOP
set_top SYS_TOP


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
