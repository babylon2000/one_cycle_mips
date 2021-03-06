transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/sign_extend.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/pc.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/adder.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/mux2in1.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/register_file.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/alu.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/main_control.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/alu_decoder.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/controller.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/datapath.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/mips.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/shift_left_by_2.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/pc_jmp.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/instruction_memory.v}
vlog -vlog01compat -work work +incdir+E:/fpga/labs/mips {E:/fpga/labs/mips/data_memory.v}

