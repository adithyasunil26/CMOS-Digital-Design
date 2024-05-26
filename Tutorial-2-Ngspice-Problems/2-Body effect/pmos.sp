* Netlist problem-2 PMOS

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param width_P={20*LAMBDA}
.global gnd vdd

VSG S G 'SUPPLY'
VSD S gnd 1.8V

VBS B S 0V
* VBS B S 0.9V
* VBS B S -0.9V

M1 gnd G S B CMOSP W={width_P} L={2*LAMBDA} AS={5*width_P*LAMBDA} 
+ PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

.dc VSG 0 1.8 0.1

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = (-VSD#branch)
plot x
plot sqrt(x)
plot deriv(sqrt(x))

.endc
