* Netlist problem-3 a

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N=1.8u
.global gnd vdd

VGS G gnd 'SUPPLY'
VDS1 D gnd 0

M1 D G S gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

M2 S G gnd gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.dc VDS1 0 1.8 0.01

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = (-VDS1#branch)
set curplottitle="id vs vgs"
plot x

.endc
