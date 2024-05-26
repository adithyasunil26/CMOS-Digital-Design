* Netlist problem-5-a

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd 

VGS	G gnd 1.8V
VDS D gnd 1.8V 
// VDS D gnd 0V 

C1 S gnd 1pF

M1 D G S gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.tran 1u 5m
// .tran 0.01n 5n

.ic v(S)=0V
// .ic v(S)=1.8V

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = S
plot x 

.endc
