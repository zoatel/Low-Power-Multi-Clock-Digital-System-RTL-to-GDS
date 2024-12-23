
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set verilogout_no_tri true
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

set REF_CLK_NAME REF_CLK
set UART_CLK_NAME UART_CLK
set SCAN_CLK_NAME SCAN_CLK
set REF_CLK_PER 10
set UART_CLK_PER 271.2967
set UART_TX_CLK_PER 8680
set SCAN_CLK_PER 100

set SETUP_SKEW 0.2
set HOLD_SKEW 0.1

create_clock -period $REF_CLK_PER -name $REF_CLK_NAME -waveform "0 [expr $REF_CLK_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $SETUP_SKEW [get_clocks $REF_CLK_NAME]
set_clock_uncertainty -hold $HOLD_SKEW [get_clocks $REF_CLK_NAME]

create_generated_clock -master_clock $REF_CLK_NAME -source [get_ports REF_CLK] \
		       -name "ALU_CLK" -divide_by 1 [get_port U0_CLK_GATE/GATED_CLK]
set_clock_uncertainty -setup $SETUP_SKEW [get_clocks ALU_CLK]
set_clock_uncertainty -hold $HOLD_SKEW [get_clocks ALU_CLK]

create_clock -period $UART_CLK_PER -name $UART_CLK_NAME -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $SETUP_SKEW [get_clocks $UART_CLK_NAME]
set_clock_uncertainty -hold $HOLD_SKEW [get_clocks $UART_CLK_NAME]

create_generated_clock -master_clock $UART_CLK_NAME -source [get_ports UART_CLK] \
		       -name "RX_CLK" -divide_by 1 [get_port U1_CLKDIV/DIV_CLK]
set_clock_uncertainty -setup $SETUP_SKEW [get_clocks RX_CLK]
set_clock_uncertainty -hold $HOLD_SKEW [get_clocks RX_CLK]

create_generated_clock -master_clock $UART_CLK_NAME -source [get_ports UART_CLK] \
		       -name "TX_CLK" -divide_by 32 [get_port U0_CLKDIV/DIV_CLK]
set_clock_uncertainty -setup $SETUP_SKEW [get_clocks TX_CLK]
set_clock_uncertainty -hold $HOLD_SKEW [get_clocks TX_CLK]

create_clock -period $SCAN_CLK_PER -name $SCAN_CLK_NAME -waveform "0 [expr $SCAN_CLK_PER/2]" [get_ports SCAN_CLK]

set_dont_touch_network {REF_CLK UART_CLK RST}

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"]  \
                               -group [get_clocks "UART_CLK TX_CLK RX_CLK"] \
			       -group [get_clocks "SCAN_CLK"]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay   [expr 0.2*$UART_CLK_PER]
set out_delay0 [expr 0.2*$UART_TX_CLK_PER]
set out_delay1 [expr 0.2*$UART_CLK_PER]
set scan_delay [expr 0.2*$SCAN_CLK_PER]

set_input_delay $in_delay -clock $UART_CLK_NAME [get_port UART_RX_IN]

set_input_delay $scan_delay -clock $SCAN_CLK_NAME [get_port SI]
set_input_delay $scan_delay -clock $SCAN_CLK_NAME [get_port SE]
set_input_delay $scan_delay -clock $SCAN_CLK_NAME [get_port TEST_MODE]

set_output_delay $out_delay0 -clock "TX_CLK" [get_port UART_TX_O]
set_output_delay $out_delay1 -clock "RX_CLK" [get_port PAR_ERR]
set_output_delay $out_delay1 -clock "RX_CLK" [get_port STP_ERR]

set_output_delay $scan_delay -clock $SCAN_CLK_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port SE]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port TEST_MODE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.5  [get_port UART_TX_O]
set_load 0.5  [get_port PAR_ERR]
set_load 0.5  [get_port STP_ERR]

set_load 0.5  [get_port SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port TEST_MODE]

####################################################################################


