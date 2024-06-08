* SPICE3 file created from 3v2.ext - technology: scmos

.include ../../TSMC_180nm.txt
.param SUPPLY=1.8V
.option scale=0.09u
.global gnd vdd

Vdd vdd gnd 'SUPPLY'
vin inv_0/input 0 0

M1000 inv_1in inv_0/input gnd Gnd CMOSN w=20 l=2
+  ad=100 pd=50 as=200 ps=100
M1001 inv_1in inv_0/input vdd inv_0/w_n6_n6# CMOSP w=51 l=2
+  ad=255 pd=112 as=510 ps=224
M1002 inv_1/output inv_1in gnd Gnd CMOSN w=20 l=2
+  ad=100 pd=50 as=0 ps=0
M1003 inv_1/output inv_1in vdd inv_1/w_n6_n6# CMOSP w=51 l=2
+  ad=255 pd=112 as=0 ps=0
C0 inv_1/output gnd 0.23fF
C1 inv_1in inv_1/w_n6_n6# 0.06fF
C2 vdd inv_1/w_n6_n6# 0.09fF
C3 inv_1in inv_0/input 0.05fF
C4 inv_0/input inv_0/w_n6_n6# 0.06fF
C5 vdd inv_0/input 0.02fF
C6 inv_1/w_n6_n6# inv_1/output 0.07fF
C7 inv_1in inv_0/w_n6_n6# 0.07fF
C8 inv_1in vdd 0.58fF
C9 vdd inv_0/w_n6_n6# 0.09fF
C10 inv_0/input gnd 0.05fF
C11 inv_1in inv_1/output 0.05fF
C12 vdd inv_1/output 0.55fF
C13 inv_1in gnd 0.28fF
C14 gnd Gnd 0.27fF
C15 inv_1/output Gnd 0.08fF
C16 vdd Gnd 0.16fF
C17 inv_1in Gnd 0.23fF
C18 inv_1/w_n6_n6# Gnd 1.52fF
C19 inv_0/input Gnd 0.16fF
C20 inv_0/w_n6_n6# Gnd 1.52fF

.dc vin 0 1.8 0.001

.control
set hcopypscolor = 1 
set color0=white 
set color1=black 

run
plot v(b) 
plot deriv(v(b))
.endc
