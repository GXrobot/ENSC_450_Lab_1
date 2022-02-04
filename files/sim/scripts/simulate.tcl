#Simple tcl script for simulating HDL on Mentor Modelsim
#atino@sfu.ca
vsim fpu_double_tb 
add wave -radix hex -height 30 {/fpu_double_tb/clk} {/fpu_double_tb/rst} {/fpu_double_tb/enable} {/fpu_double_tb/rmode} {/fpu_double_tb/fpu_op} {fpu_double_tb/opa} {fpu_double_tb/opb} {fpu_double_tb/out_fp} {/fpu_double_tb/ready} {/fpu_double_tb/underflow} {fpu_double_tb/overflow} {fpu_double_tb/inexact} {/fpu_double_tb/exception} {fpu_double_tb/invalid} {/fpu_double_tb/END_SIM}
restart -f ; run 50000 ns

