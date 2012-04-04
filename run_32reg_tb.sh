#!/bin/sh

iverilog -o ee357_32reg_tb ee357_32reg_tb.v ee357_32reg.v
vvp -n ee357_32reg_tb
rm ee357_32reg_tb