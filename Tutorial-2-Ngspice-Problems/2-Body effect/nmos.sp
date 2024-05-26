* Netlist problem-2 NMOS

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd 

VGS G gnd 'SUPPLY'
VDS D gnd 'SUPPLY'

VBS B gnd 0V
* VBS B gnd 0.9V
* VBS B gnd -0.9V

M1 D G gnd B CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.dc VGS 0 1.8 0.1

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = (-VDS#branch)
plot x
plot sqrt(x)
plot deriv(sqrt(x))

.endc
