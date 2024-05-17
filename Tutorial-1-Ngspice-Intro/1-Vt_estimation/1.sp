* Netlist to estimate NMOS Vt for lin and sat regions

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8
.param LAMBDA=0.09u
.param width_N={20*LAMBDA}
.global gnd

VGS	G gnd 'SUPPLY'

** For linear region
VDS D gnd 0.05V

** For saturation region
* VDS D gnd 1.8V 

M1 D G gnd gnd CMOSN W={width_N} L={2*LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}

.dc VGS 0 1.8 0.1

.control
set hcopypscolor = 1 
set color0=white
set color1=black 

run

let x = (-VDS#branch)
plot x 

** For linear region
* plot deriv(x)
* hardcopy Idlinear.jpg (-VDS#branch)
* hardcopy Idlinearderiv.jpg deriv(-VDS#branch)

** For saturation region
* plot sqrt(x)
* plot deriv(sqrt(x))
* plot log(x)
* hardcopy Idsat.eps (-VDS#branch)
* hardcopy Idsatroot.eps sqrt(-VDS#branch)
* hardcopy Idsatrootderiv.eps deriv(sqrt(-VDS#branch))

.endc
