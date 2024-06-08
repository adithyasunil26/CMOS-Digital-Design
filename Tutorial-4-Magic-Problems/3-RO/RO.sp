.include ../TSMC_180nm.txt

.param SUPPLY=1.8V
.param LAMBDA=0.09u
.param length={2*LAMBDA}
.param w={10*LAMBDA}
.global gnd vdd

Vdd vdd gnd 'SUPPLY'

.subckt inv y x w vdd gnd
M1 y x vdd vdd CMOSP W={2.5*w} L={length} AS={5*2.5*w*LAMBDA} 
+ PS={10*LAMBDA+2*2.5*w} AD={5*2.5*w*LAMBDA} PD={10*LAMBDA+2*2.5*w}

M2 y x gnd gnd CMOSN W={w} L={length} AS={5*w*LAMBDA} 
+ PS={10*LAMBDA+2*w} AD={5*w*LAMBDA} PD={10*LAMBDA+2*w}
.ends inv

x1 a2 a1 w vdd gnd inv 
x2 a3 a2 w vdd gnd inv 
x3 a4 a3 w vdd gnd inv 
x4 a5 a4 w vdd gnd inv 
x5 a6 a5 w vdd gnd inv 
x6 a7 a6 w vdd gnd inv 
x7 a8 a7 w vdd gnd inv 
x8 a9 a8 w vdd gnd inv 
x9 a10 a9 w vdd gnd inv 
x10 a11 a10 w vdd gnd inv 
x11 a12 a11 w vdd gnd inv 
x12 a13 a12 w vdd gnd inv 
x13 a14 a13 w vdd gnd inv 
x14 a15 a14 w vdd gnd inv 
x15 a16 a15 w vdd gnd inv 
x16 a17 a16 w vdd gnd inv 
x17 a18 a17 w vdd gnd inv 
x18 a19 a18 w vdd gnd inv 
x19 a20 a19 w vdd gnd inv 
x20 a21 a20 w vdd gnd inv 
x21 a22 a21 w vdd gnd inv 
x22 a23 a22 w vdd gnd inv 
x23 a24 a23 w vdd gnd inv 
x24 a25 a24 w vdd gnd inv 
x25 a26 a25 w vdd gnd inv 
x26 a27 a26 w vdd gnd inv 
x27 a28 a27 w vdd gnd inv 
x28 a29 a28 w vdd gnd inv 
x29 a30 a29 w vdd gnd inv 
x30 a31 a30 w vdd gnd inv 
x31 a1 a31 w vdd gnd inv

.tran 10ps 15ns 
.ic v(a1) 0V

*measuring oscillation time period and finding frequency of oscillation
.measure tran tosc
+TRIG v(a1) VAL='SUPPLY/2' RISE=2 TARG v(a1) VAL='SUPPLY/2' RISE=3
.measure tran fro
+param='1/tosc' goal=0

*Measuring prop delays 
.measure tran tpdr
+ TRIG v(a1) VAL='SUPPLY/2' FALL=1
+ TARG v(a2) VAL='SUPPLY/2' RISE=1

.measure tran tpdf
+ TRIG v(a1) VAL='SUPPLY/2' RISE=1
+ TARG v(a2) VAL='SUPPLY/2' FALL=1

.measure tran tpd param='(tpdr+tpdf)/2' goal=0
.measure tran calcfosc
+param='1/(62*tpd)' goal =0

.control
set hcopypscolor = 1 
set color0=white 
set color1=black 

run
set curplottitle="Adithya-2019102005-5"
plot v(a1) v(a2)

*hardcopy 5.eps v(a1) v(a2)
.endc