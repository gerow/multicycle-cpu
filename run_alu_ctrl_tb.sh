#!/bin/sh

iverilog -o ee357_alu_ctrl_tb ee357_alu_ctrl_tb.v alu_ctrl.v
vvp -n ee357_alu_ctrl_tb
rm ee357_alu_ctrl_tb