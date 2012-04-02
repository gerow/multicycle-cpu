#!/bin/sh

iverilog -o ee357_alu_tb ee357_alu_tb.v ee357_alu.v
vvp -n ee357_alu_tb
rm ee357_alu_tb