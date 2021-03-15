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
iverilog -o [output file] -s [top module] [.v files]
```

## Generate VCD file
```
vvp [compiled file]
```
