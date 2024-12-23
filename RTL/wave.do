onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TOP /SYS_TOP_TB/RST_TB
add wave -noupdate -expand -group TOP /SYS_TOP_TB/REF_CLK_TB
add wave -noupdate -expand -group TOP /SYS_TOP_TB/UART_CLK_TB
add wave -noupdate -expand -group TOP /SYS_TOP_TB/RX_IN_TB
add wave -noupdate -expand -group TOP -color Cyan /SYS_TOP_TB/TX_OUT_TB
add wave -noupdate -expand -group TOP /SYS_TOP_TB/PAR_ERR_TB
add wave -noupdate -expand -group TOP /SYS_TOP_TB/STP_ERR_TB
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/CLK
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ALU_OUT
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ALU_OUT_VLD
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/RDDATA
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/RDDATA_VLD
add wave -noupdate -expand -group {CNTRL UNIT} -color Gold /SYS_TOP_TB/DUT/U0_SYS_CNTRL/RX_P_DATA
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/RX_D_VLD
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/FIFO_FULL
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ALU_FUN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ALU_EN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/CLK_EN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ADDRESS
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/WR_EN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/RD_EN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/WR_DATA
add wave -noupdate -expand -group {CNTRL UNIT} -color Aquamarine /SYS_TOP_TB/DUT/U0_SYS_CNTRL/TX_P_DATA
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/TX_D_VLD
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/CLK_DIV_EN
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/address_save_flag
add wave -noupdate -expand -group {CNTRL UNIT} /SYS_TOP_TB/DUT/U0_SYS_CNTRL/address_save
add wave -noupdate -expand -group {CNTRL UNIT} -color Blue /SYS_TOP_TB/DUT/U0_SYS_CNTRL/cs
add wave -noupdate -expand -group {CNTRL UNIT} -color Blue /SYS_TOP_TB/DUT/U0_SYS_CNTRL/ns
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/CLK
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/WrEn
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/RdEn
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/Address
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/WrData
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/RdData
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/RdData_VLD
add wave -noupdate -group {Register File} -color White /SYS_TOP_TB/DUT/U0_RF/REG0
add wave -noupdate -group {Register File} -color White /SYS_TOP_TB/DUT/U0_RF/REG1
add wave -noupdate -group {Register File} -color White /SYS_TOP_TB/DUT/U0_RF/REG2
add wave -noupdate -group {Register File} -color White /SYS_TOP_TB/DUT/U0_RF/REG3
add wave -noupdate -group {Register File} /SYS_TOP_TB/DUT/U0_RF/Reg_File
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/W_CLK
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/W_RST
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/W_INC
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/R_CLK
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/R_RST
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/R_INC
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/WR_DATA
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/FULL
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/RD_DATA
add wave -noupdate -group FIFO /SYS_TOP_TB/DUT/U0_ASYNC_FIFO/EMPTY
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/CLK
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/A
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/B
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/EN
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/ALU_FUN
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/ALU_OUT
add wave -noupdate -group ALU /SYS_TOP_TB/DUT/U0_ALU/OUT_VALID
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/TX_CLK
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/RX_CLK
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/RX_IN_S
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/TX_IN_P
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/TX_IN_V
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/PRESCALE
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/PAR_EN
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/PAR_TYP
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/RX_OUT_P
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/RX_OUT_V
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/TX_OUT_S
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/TX_OUT_V
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/PAR_ERR
add wave -noupdate -group UART /SYS_TOP_TB/DUT/U0_UART/STP_ERR
add wave -noupdate -group {Gated CLK} /SYS_TOP_TB/DUT/U0_CLK_GATE/GATED_CLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109952157 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {262144 ns}
