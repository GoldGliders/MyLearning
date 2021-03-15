# README

## Setup
install
- icrus verilog
- gtkwave

### gtkwave installation tips
When I installed gtkwave, I could not call it from CLI.
I solved the problem seeing [this page](https://ughe.github.io/2018/11/06/gtkwave-osx)

## Compile
```
iverilog -g2012 -o [output file] -s [top module] [.v files]
```
The option g specifies Verilog generation. `-g2012` specifies SystemVerilog.

## Generate VCD file
```
vvp [compiled file]
```

## View inner module's signal
`$dumpvars(0, [module name]);`
