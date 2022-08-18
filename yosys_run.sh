
# inital setup
read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# read design - we must Include all the files dependent to the Code we are synthesizing

read_verilog iiitb_sysarray.v PE.v delay.v

# generic synthesis - We must Include the name of the top module here
synth -top sysarr

# mapping to mycells.lib - We are mapping the D flipflops present in the Ciruit if any.
dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# This command maps the all the logic to gates level
abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# This command is used to remove all the unused components
clean


flatten

# write synthesized design
write_verilog -noattr iiitb_sysarray_synth.v

# To show all the statistics
stat

# To display the gate level design diagram
show
