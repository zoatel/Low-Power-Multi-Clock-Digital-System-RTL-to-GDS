vlib work
vlog ./*/*.*v
vlog ./*/*/*.*v
vsim -voptargs=+acc work.SYS_TOP_TB
do wave.do
run -all