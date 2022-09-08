# iiitb_sysarray_for_3x3_mat_mul 
# Systolic Array for 3x3 Matrices Multiplication of Integer Data type


The chip design for a Systolic Array which can multiply two 3x3 Matrices of Integer Data type. This model consists of Processing Elements(PE) and few delay blocks.


## Introduction

Matrix Multiplication can be particularly be done by many algorithms. In this paper matrix multiplication for 3x3 matrices in integer data type is specially discussed using the Systolic array which is a hardware structure used for operating matrix multiplication fastly as well as effeciently. The Processing elements in a Systolic Array are programmed to have a same operation. 

Below is the block diagram of the Systolic Array used in this model with appropriate indexing used in the code. Every block of the Systolic Array is connected to a same clock.

<p align="center">
  <img  src="/Images/sysArray.png">
</p>

Systolic Array has mainly two different types of Components triggered by the same clock. They are:

### Processing Element (PE)

 A Processing Element is a part of an hardware structure called systolic arrays alternatively called as cells. Processing Elements perform a common operation which are generally simple, but for different kinds of input. These cells will have memory banks for holding the data after each computation in the Processing Element.
 
 The Processing Element in this particular systolic array has three inputs c, b, and c which has outputs a’ = a, b’ = b, and c’ = c + a * b. The operation c + a * b can be considered as the common operation programmed in these processing elements. The outputs a’, and b’ are the outcome of the property of the PE acting as a hardware Register holding data for a clock cycle. These operations are briefly described in the below block diagram.
 
 <p align="center">
  <img  src="/Images/PE_int.png">
</p>

### Delay Block

A Delay block is just a group of flipflops for holding data for a clock cycle which is triggered to all the Delay blocks and Processing Elements at a time. These are used to make the Systolic Array symmetrical. In this case the Systolic Array is 5x5 structured. The inputs to the delay block are a, and b.
The outputs of the delay block are a’ = a, and b’ = b. The schematic of delay block is given below. 

 <p align="center">
  <img  src="/Images/delay_block.png">
</p>

## Systolic Array 

The systolic array used for matrix multiplication of 3x3 matrices of integer data types have inputs A3x3, and B3x3.

The whole process process takes 8 clock cycles of duration, In which each row of the Matrix A is passed to a00 , a10, and a20 and the first column of Matrix B is passed to b00 , b01, and b02. The second row of the Matrix A is passed to a10 , a20, and a30, and the second column of the Matrix B is passed to b01 , b02 , and b03 respectively. Similarly, The third of row of the Matrix A is passed to a20 , a30 , and a40, and the third column of the Matrix B is passed to b02 , b03 and b04 respectively in the first consecutive clock cycles.Other values remains as zero.

The output of the Matrices Multiplication namely D is collected at c35, c45, c55, c35 , and c45 of the systolic array. D00, D01, D02, D10, and D20 are collected at c55, c45, c35, c54, and c53 indices of the systolic array at 6th clock cycle of the process.Similarly, The indices D12, D11, D21 of the output matrix are collected at the indices c45, c55, and c54 of the systolic array at 7th clock cycle of the process. Lastly, the index D22 of the Matrix D is collected at the index c55 of the systolic array at 8th clock cycle of the process.

 <p align="center">
  <img  src="/Images/input_systolic_1.png">
</p>

## Applications

This model can be used for 3x3 Matrix Multiplication and futher can be extended to Convolution Operations and other places where other matrix multiplication is used.

## About iverilog 
Icarus Verilog is an implementation of the Verilog hardware description language.
## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing

### Installing iverilog and GTKWave

#### For Ubuntu

Open your terminal and type the following to install iverilog and GTKWave
```
$   sudo apt-get update
$   sudo apt-get install iverilog gtkwave
```

### Functional Simulation
To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.
```
$   sudo apt install -y git
$   git clone https://github.com/Ayyappa1911/iiitb_sysarray_for_3x3_mat_mul.git
$   cd iiitb_sysarray_for_3x3_mat_mul
$   iverilog iiitb_sysarray.v iiitb_sysarray_tb.v PE.v delay.v
$   ./a.out
$   gtkwave sysarray.vcd
```

## Functional Characteristics

The image below are the waveforms taken from the above instructions with the inputs 

A = [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ], B = [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ] 

and the output D = [ [30, 36, 42], [66, 81, 96], [102, 126, 150] ]

 <p align="center">
  <img  src="/Images/verilog_int_waveform.png">
</p>

All the other characteristics are mentioned under the Heading Systolic Array


## synthesis of verilog code

### SYNTHESIS
**Synthesis**: Synthesis transforms the simple RTL design into a gate-level netlist with all the constraints as specified by the designer. In simple language, Synthesis is a process that converts the abstract form of design to a properly implemented chip in terms of logic gates.

Synthesis takes place in multiple steps:
- Converting RTL into simple logic gates.
- Mapping those gates to actual technology-dependent logic gates available in the technology libraries.
- Optimizing the mapped netlist keeping the constraints set by the designer intact.

**Synthesizer**: It is a tool we use to convert out RTL design code to netlist. Yosys is the tool I've used in this project.

#### About Yosys
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.

- more at https://yosyshq.net/yosys/

To install yosys follow the instructions in  this github repository

https://github.com/YosysHQ/yosys


#### Commands in Linux to synthesize
```
$   yosys
```

The Command in Linux opens a terminal as below

 <p align="center">
  <img  src="/Images/yosys_images/yosys.png">
</p>

All the commands can be executed either by running the yosys_run.sh file given below.

```
$   yosys>    script yosys_run.sh
```

#### to see diffarent types of cells after synthesys
```
yosys>    stat
```
#### to generate schematics
```
yosys>    show
```

All the Commands executed via .sh file are given below

#### read_liberty will import all the necessary cells.

```
yosys> read_liberty -lib <Path for sky130_fd_sc_hd__tt_025C_1v80.lib>
```
 <p>
  <img  src="/Images/yosys_images/read_liberty.png">
</p>



#### read_verilog will read the all the necessary files for synthesis.
#### It must give Sucessfully Fined to all the Modules.

```
yosys> read_verilog <Path for all the code files>
```

 <p>
  <img  src="/Images/yosys_images/read_verilog.png">
</p>

#### synth -top command will take the top module as an attribute in the command to synthesize

```
yosys> synth -top <top_module_name>
```
#### It a long process. It starts with the design hierarchy analysis and It ends with Design stats and Check Pass

 <p>
  <img  src="/Images/yosys_images/synth_1.png">
</p>

 <p>
  <img  src="/Images/yosys_images/synth_2.png">
</p>

#### If your design has flipflops. The command below will map d flipflops required to the design.
#### Ensure that the no of flip flops required for the each module is same as allocated.

```
yosys> dfflibmap -liberty <Path for sky130_fd_sc_hd__tt_025C_1v80.lib>
```

<p>
  <img  src="/Images/yosys_images/dfflibmap_1.png">
</p>

 <p>
  <img  src="/Images/yosys_images/dfflibmap_2.png">
</p>

### abc command will allocate all the standard gates to the design
### Ensure all the No of Input, and total no of output ports for all the modules are correct.

```
yosys> abc -liberty <Path for sky130_fd_sc_hd__tt_025C_1v80.lib> -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}
```

<p>
  <img  src="/Images/yosys_images/ABC.png">
</p>

#### clean removes all the unused wires and gates.

```
yosys> clean
```

#### fatten removes all the unused modules

```
yosys> flatten 
```

#### write_verilog creates the synthesised version of .V file. For this Project it's iiitb_sysarray_synth.v

```
yosys> write_verilog -noattr <file name of the required synthesis file> 
```

<p>
  <img  src="/Images/yosys_images/write_verilog.png">
</p>

#### stat shows all the final statistics of the synthesized design.

```
yosys> stat
```

<p>
  <img  src="/Images/yosys_images/stat.png">
</p>


#### show displays the design in an Image format in a new GUI.

```
yosys> show <module_name>
```

### GATE LEVEL SIMULATION(GLS)
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.We perform this to verify logical correctness of the design after synthesizing it. Also ensuring the timing of the design is met.
Following are the commands to run the GLS simulation:
```
$ iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../verilog_model/primitives.v ../verilog_model/sky130_fd_sc_hd.v iiitb_sysarray_synth.v iiitb_sysarray_tb.v
$ ./a.out
$ gtkwave sysarray.vcd
```
The gtkwave output for the netlist should match the output waveform for the RTL design file. As netlist and design code have same set of inputs and outputs, we can use the same testbench and compare the waveforms.
#### GLS Waveforms

<p>
  <img  src="/Images/yosys_images/synthesis_1.png">
</p>

## Observations

- The waveforms generated using the Original module files/logic and the Waveforms generated by the synthesised GLS are correct.

# Post Synthesis (ASIC FLOW)

## Layout 

### Installations required for post Synthesis Layout

## Python Installation
```
$ sudo apt install -y build-essential python3 python3-venv python3-pip
```
## Docker installation
```
(Below command removes older version of docker if installed)
$ sudo apt-get remove docker docker-engine docker.io containerd runc 

$ sudo apt-get update

$ sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
$ sudo mkdir -p /etc/apt/keyrings

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
$ sudo apt-get update

$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

$ apt-cache madison docker-ce 
(copy the version string you want to install)

(paste the version string copiee above in place of <VERSION_STRING>)
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin 

$ sudo docker run hello-world 
(If the docker is successfully installed u will get a success message here)
```
## OpenLane Installation
```
$ git clone https://github.com/The-OpenROAD-Project/OpenLane.git

$ cd OpenLane/

$ make

$ make test
```

## Magic Installation

Magic is useful to view the Layouts after every step of the flow i.e, (floorplan, Placement, Routing..).

### Installing csh
```
$ sudo apt-get install csh
```

### Installing x11/xorg
```
$ sudo apt-get install x11

$ sudo apt-get install xorg

$ sudo apt-get install xorg openbox
```

### Installing GCC
```
$ sudo apt-get install gcc
```

### Installing build-essential
```
$ sudo apt-get install build-essential
```

### Installing OpenGL
```
$ sudo apt-get install freeglut3-dev
```

### Installing tcl/tk
```
$ sudo apt-get install tcl-dev tk-dev
```

Now all the dependent softwares are installed now lets install Magic

### Installing Magic
```
$ git clone https://github.com/RTimothyEdwards/magic

$ cd magic

$ ./configure

$ make

$ make install
```

## Klayout Installation
```
$ sudo apt-get install klayout
```

## ngspice Installation
```
$ sudo apt-get install ngspice
```

# Creating an Inverter Cell

This cell helps us to understand the flow.

# Layout

## Setup for openlane.

```
$ cd designs

$ mkdir iiitb_sysarray

$ cd iiitb_sysarray

$ mkdir src

$ touch config.json

$ cd src

$ touch iiitb_sysarray.v
```
Add the Verilog code used to to get the Post synthesis simulation in iiitb_sysarray.v. It's not the file generated in Synthesis in Yosys. 

Copy  `sky130_fd_sc_hd__fast.lib`, `sky130_fd_sc_hd__slow.lib`, `sky130_fd_sc_hd__typical.lib` and `sky130_vsdinv.lef` files to `src` folder in your design. <br>

The src folder should be as follows.

<p>
  <img  src="/Images/OL_images/src_floder.png">
</p>

The content of the config.json create above is as follows. The values can be modified for a accordingly.

Don't use defined `DIE_AREA` and `FP_SIZING : absolute`, use it as `FP_SIZING : relative`

```
{
    "DESIGN_NAME": "iiitb_sysarray",
    "VERILOG_FILES": "dir::src/iiitb_sysarray.v",
    "CLOCK_PORT": "clock",
    "CLOCK_NET": "clock",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 20,
    "PL_TARGET_DENSITY": 0.5,
    "FP_SIZING" : "relative",
    "pdk::sky130*": {
        "FP_CORE_UTIL": 35,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 30
        }
    },
    
    "LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",  
    "TEST_EXTERNAL_GLOB": "dir::../iiitb_sysarray/src/*"

}
```

Navigate to the Openlane folder.

### Initiating the OpenLane software
```
$ sudo make mount
```
<p>
  <img  src="/Images/OL_images/initiation.png">
</p>

We need to generate the Layout in the interactive mode. This command forward us into tcl console.
```
$ ./flow.tcl -interactive
```
<p>
  <img  src="/Images/OL_images/interactive.png">
</p>

Run the following commands in the tcl console.

```
% package require openlane 0.9
```

<p>
  <img  src="/Images/OL_images/package.png">
</p>

```
% prep -design iiitb_sysarray
```
The design name in config.json and the design name mentioned above should match.

<p>
  <img  src="/Images/OL_images/prep_design.png">
</p>

The below commands ared used to merge external lef files to the merged.nom.lef.(To include sky130_vsdinv in our design)
```
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs
```
<p>
  <img  src="/Images/OL_images/merge_lefs.png">
</p>


The merged.nom.lef file should contatin the Macro definition of 'sky130_vsdinv'
<p>
  <img  src="/Images/OL_images/macro_search.png">
</p>

## Synthesis
```
% run_synthesis
```

<p>
  <img  src="/Images/OL_images/syn_cmd.png">
</p>

Synthesis Reports

Statistics of the components used is given as follows.It should contain data related to 'sky130_vsdinv' also.

<p>
  <img  src="/Images/OL_images/syn_stat_1.png">
</p>
<p>
  <img  src="/Images/OL_images/syn_stat_2.png">
</p>

Setup and Hold Slacks after synthesis.

<p>
  <img  src="/Images/OL_images/slacks.png">
</p>

The sky130_vsdinv cells should be visible in the synthesised netlist.

<p>
  <img  src="/Images/OL_images/net_synth.png">
</p>

## Floorplan
```
% run_floorplan
```
<p>
  <img  src="/Images/OL_images/floorplan.png">
</p>

### Floorplan reports

#### Die Area

<p>
  <img  src="/Images/OL_images/die_area.png">
</p>

#### Core Area

<p>
  <img  src="/Images/OL_images/core_area.png">
</p>

For the layout Navigate to results -> floorplan and type the command
```
magic -T /home/ayyappa/Desktop/ASIC/OpenLane/pdks/sky130A/libs.tech/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sysarray.def &
```

Floorplan view in magic

<p>
  <img  src="/Images/OL_images/floorplan_layout.png">
</p>

## Placement
```
% run_placement
```
<p>
  <img  src="/Images/OL_images/placement.png">
</p>

For the layout Navigate to results -> placement and type the command
```
magic -T /home/ayyappa/Desktop/ASIC/OpenLane/pdks/sky130A/libs.tech/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sysarray.def &
```

Placement view in magic

<p>
  <img  src="/Images/OL_images/placement_layout.png">
</p>

<bold>sky130_vsdinv</bold> in the placement view in Magic


<p>
  <img  src="/Images/OL_images/placemnt_vsdinv.png">
</p>

The sky130_vsdinv cells should be visible in the netlist generated after placement.

<p>
  <img  src="/Images/OL_images/net_placement.png">
</p>

## Clock Tree Synthesis
```
% run_cts
```
<p>
  <img  src="/Images/OL_images/cts.png">
</p>


The sky130_vsdinv cells should be visible in the netlist generated after clock tree synthesis.

<p>
  <img  src="/Images/OL_images/net_cts.png">
</p>

## Routing
```
% run_routing
```
<p>
  <img  src="/Images/OL_images/routing.png">
</p>

For the layout Navigate to results -> routing and use the command
```
magic -T /home/ayyappa/Desktop/ASIC/OpenLane/pdks/sky130A/libs.tech/sky130A.tech read ../../tmp/merged.nom.lef def read iiitb_sysarray.def &
```

Routing view in magic

<p>
  <img  src="/Images/OL_images/routing_layout.png">
</p>

<bold>sky130_vsdinv</bold> in the routing view in Magic

<p>
  <img  src="/Images/OL_images/vsdinv_routing.png">
</p>

The sky130_vsdinv cells should be visible in the netlist generated after routing.

<p>
  <img  src="/Images/OL_images/net_routing.png">
</p>

Dimensional data extracted in tcl command line after routing\

<p>
  <img  src="/Images/OL_images/area_routing_tcl.png">
</p>


## Contributors 

- **Ayyappa Koppuravuri** 
- **Kunal Ghosh** 


## Acknowledgments

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

- <a href="https://www.iiitb.ac.in/faculty/nanditha-rao">Prof Nanditha Rao</a>, International Institute of Information Technology, Bangalore


## Contact Information

- Ayyappa Koppuravuri, Integrated Masters of Technology (ECE) , International Institute of Information Technology, Bangalore  ayyappakoppuravuri1908@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com

## References:

- <a href="https://github.com/Ayyappa1911/Systolic-Array-Implementation-for-3x3-Matrix-Multiplication.git">Systolic array for 3x3 matrix multiplication for various data types</a> 

- <a href="https://youtu.be/vADVh1ogNo0">Youtube video for understanding this model</a> 

- C. Bagavathi MTech, O. Saraniya ME, PhD, in Deep Learning and Parallel Computing Environment for Bioengineering Systems, 2019

- <a href="https://github.com/sanampudig/iiitb_pwm_gen.git"> Resource for modeling the repo and some part of tool content</a>


