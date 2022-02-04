# Simple script for compiling a vhdl file for simulation
# fcampi@sfu.ca

# Cleaning the work folder (This should not be done if compiling incrementally)
\rm -rf work

# Creating and mapping to logic name work the local work library
vlib work
vmap work work

# Compiling the VHDL code for simulation
vlog /CMC/setups/ensc450/SOCLAB/LIBRARIES/NangateOpenCellLibrary_PDKv1_3_v2010_12/Front_End/Verilog/NangateOpenCellLibrary.v
vlog ../syn_045/results/fpu_double.ref.v 
vcom ../vhdl/fpu_add.vhd
vcom ../vhdl/fpu_sub.vhd
vcom ../vhdl/fpu_mul.vhd
vcom ../vhdl/fpu_div.vhd
vcom ../vhdl/fpu_round.vhd
vcom ../vhdl/fpu_exceptions.vhd
vcom ../vhdl/fpu_double.vhd
vcom ../vhdl/fpu_double_TB.vhd 

