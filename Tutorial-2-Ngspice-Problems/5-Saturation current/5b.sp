* Netlist problem-5-b

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_P={20*LAMBDA}
.global gnd vdd

VGS	G gnd 1.8V
VDS D gnd 1.8V
* VDS D gnd 0V

C1 S gnd 1pf

M1 S G D vdd CMOSP W={width_P} L={2*LAMBDA} AS={5*width_P*LAMBDA} 
+ PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

.tran 0.01s 1s
* .tran 0.01s 10s

.ic v(S)=0V
* .ic v(S)=1.8V

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = S
plot x 

.endc
