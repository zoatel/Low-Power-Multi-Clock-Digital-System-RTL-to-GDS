###################################################################

# Created by write_sdc on Wed Oct 23 00:10:24 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_RX_IN]
set_load -pin_load 0.5 [get_ports UART_TX_O]
set_load -pin_load 0.5 [get_ports PAR_ERR]
set_load -pin_load 0.5 [get_ports STP_ERR]
create_clock [get_ports REF_CLK]  -period 10  -waveform {0 5}
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
create_generated_clock [get_pins U0_CLK_GATE/GATED_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -master_clock REF_CLK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
create_clock [get_ports UART_CLK]  -period 271.297  -waveform {0 135.648}
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
create_generated_clock [get_pins U1_CLKDIV/DIV_CLK]  -name RX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLK  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
create_generated_clock [get_pins U0_CLKDIV/DIV_CLK]  -name TX_CLK  -source [get_ports UART_CLK]  -master_clock UART_CLK  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
set_input_delay -clock UART_CLK  54.2593  [get_ports UART_RX_IN]
set_output_delay -clock TX_CLK  1736  [get_ports UART_TX_O]
set_output_delay -clock RX_CLK  54.2593  [get_ports PAR_ERR]
set_output_delay -clock RX_CLK  54.2593  [get_ports STP_ERR]
set_clock_groups -asynchronous -name REF_CLK_1 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLK] [get_clocks TX_CLK] [get_clocks RX_CLK]]
