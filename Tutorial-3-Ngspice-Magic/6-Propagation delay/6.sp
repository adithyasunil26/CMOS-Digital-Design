* Netlist 6

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8V
.param LAMBDA=0.18u
* .param width_N={10*LAMBDA}
.param width_N={50*LAMBDA}
.param width_P={2.5*width_N}
.global gnd vdd

Vdd vdd gnd dc 1.8
Vin a 0 pulse 0 1.8V 0ns 100ps 100ps 9.9ns 20ns

C1 c gnd 100f
*C1 c gnd 500f
*C1 c gnd 500f

.subckt inv D G vdd gnd
M1 D G vdd vdd CMOSP W={width_P} L={LAMBDA} AS={5*width_P*LAMBDA} 
+ PS={10*LAMBDA+2*width_P} AD={5*width_P*LAMBDA} PD={10*LAMBDA+2*width_P}

M2 D G gnd gnd CMOSN W={width_N} L={LAMBDA} AS={5*width_N*LAMBDA} 
+ PS={10*LAMBDA+2*width_N} AD={5*width_N*LAMBDA} PD={10*LAMBDA+2*width_N}
.ends inv

X1 b a vdd gnd inv
X2 c b vdd gnd inv

.tran 1n 100n

.measure tran rise_t
+TRIG v(a) VAL='SUPPLY/2' CROSS=1 TARG v(c) VAL='SUPPLY/2' CROSS=1
.measure tran fall_t
+TRIG v(a) VAL='SUPPLY/2' CROSS=2 TARG v(c) VAL='SUPPLY/2' CROSS=2

.control

run
plot v(a) v(c)

.endc
