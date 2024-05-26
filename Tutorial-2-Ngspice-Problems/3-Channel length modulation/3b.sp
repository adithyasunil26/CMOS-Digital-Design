* Netlist problem-3 b

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N=1.8u
.global gnd vdd

VGS	G gnd 'SUPPLY'
VDS D gnd 'SUPPLY'

M1 D G gnd gnd CMOSN W={width_N} L={4*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.dc VDS 0 1.8 0.1

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = (-VDS#branch)
set curplottitle="id vs vgs"
plot x
 
hardcopy b.eps (-VDS#branch)

.endc
