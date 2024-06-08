* Inverter noise margin

.include ../../TSMC_180nm.txt

.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param length={2*LAMBDA}
.param w={20*LAMBDA}
.global gnd vdd

Vdd vdd gnd 'SUPPLY'
vin a 0 0

.subckt inv y x w vdd gnd
M1 y x vdd vdd CMOSP W={2.5*w} L={length} AS={5*2.5*w*LAMBDA}
+ PS={10*LAMBDA+2*2.5*w} AD={5*2.5*w*LAMBDA} PD={10*LAMBDA+2*2.5*w}

M2 y x gnd gnd CMOSN W={w} L={length} AS={5*w*LAMBDA}
+ PS={10*LAMBDA+2*w} AD={5*w*LAMBDA} PD={10*LAMBDA+2*w}
.ends inv

x1 b a w vdd gnd inv
x2 c b w vdd gnd inv 


.dc vin 0 1.8 0.001

.control
set hcopypscolor = 1 
set color0=white 
set color1=black 

run
plot v(b) 
plot deriv(v(b))
.endc
