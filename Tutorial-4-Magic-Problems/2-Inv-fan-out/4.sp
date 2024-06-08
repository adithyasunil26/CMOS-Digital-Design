.include ../TSMC_180nm.txt

.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param length={2*LAMBDA}
.param w={20*LAMBDA}
.global gnd vdd

Vdd vdd gnd 'SUPPLY'
vin a 0 pwl(0 0V 0.5ns 1.8V 1.1ns 1.8V 1.5ns 0V 10ns 0V)
vv vdd vt 0
vg gt gnd 0

.subckt inv y x w v g
M1 y x v v CMOSP W={2.5*w} L={length} AS={5*2.5*w*LAMBDA} 
+ PS={10*LAMBDA+2*2.5*w} AD={5*2.5*w*LAMBDA} PD={10*LAMBDA+2*2.5*w}

M2 y x g g CMOSN W={w} L={length} AS={5*w*LAMBDA} 
+ PS={10*LAMBDA+2*w} AD={5*w*LAMBDA} PD={10*LAMBDA+2*w}
.ends inv

x1 b a w vdd gnd inv 
x2 c b 4*w vdd gnd inv 
x3 d c 16*w vt gt inv 
x4 e d 64*w vdd gnd inv 
x5 f e 376*w vdd gnd inv 
c1 f gnd 1pf 

.tran 10ps 5ns 

*Measuring rise and fall
.measure tran tcr
+TRIG v(c) VAL='0.10*SUPPLY' RISE=1 TARG v(c) VAL='0.90*SUPPLY' RISE=1
.measure tran tcf
+TRIG v(c) VAL='0.90*SUPPLY' FALL=1 TARG v(c) VAL='0.10*SUPPLY' FALL=1

.measure tran tdr
+TRIG v(d) VAL='0.10*SUPPLY' RISE=1 TARG v(d) VAL='0.90*SUPPLY' RISE=1
.measure tran tdf
+TRIG v(d) VAL='0.90*SUPPLY' FALL=1 TARG v(d) VAL='0.10*SUPPLY' FALL=1

*Measuring prop delays for I3
.measure tran tperiod1
+TRIG v(c) VAL='0.50*SUPPLY' RISE=1 TARG v(c) VAL='0.50*SUPPLY' RISE=2
.measure tran tpdr1
+TRIG v(c) VAL='0.50*SUPPLY' FALL=1 TARG v(d) VAL='0.50*SUPPLY' RISE=1
.measure tran tpdf1
+TRIG v(c) VAL='0.50*SUPPLY' RISE=1 TARG v(d) VAL='0.50*SUPPLY' FALL=1
.measure tran tpd1 
+param='(tpdr1+tpdf1)/2' goal=0

*Measuring prop delays for I4
.measure tran tperiod2
+TRIG v(d) VAL='0.50*SUPPLY' RISE=1 TARG v(d) VAL='0.50*SUPPLY' RISE=2
.measure tran tpdr2
+TRIG v(d) VAL='0.50*SUPPLY' FALL=1 TARG v(e) VAL='0.50*SUPPLY' RISE=1
.measure tran tpdf2
+TRIG v(d) VAL='0.50*SUPPLY' RISE=1 TARG v(e) VAL='0.50*SUPPLY' FALL=1
.measure tran tpd2
+param='(tpdr2+tpdf2)/2' goal=0

.control
set hcopypscolor = 1 
set color0=white 
set color1=black 

run

plot v(c) v(d) 
plot vv#branch
plot vg#branch

.endc