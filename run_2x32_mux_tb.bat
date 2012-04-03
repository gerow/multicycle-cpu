iverilog -o ee357_2x32_mux_tb ee357_2x32_mux_tb.v ee357_2x32_mux.v
vvp -n ee357_2x32_mux_tb
rm ee357_2x32_mux_tb