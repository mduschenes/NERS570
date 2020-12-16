#!/bin/bash

d=2
n=${1:-100}
q=${2:-2}
T=${3:-0.50000}

echo ./plot.py "data_d${d}_n${n}_q${q}_T${T}_J-1.000000.csv" plot_energy_T${T}.pdf plot.json plot.mplstyle "energy_mean" "null"
./plot.py "data_d${d}_n${n}_q${q}_T${T}_J-1.000000.csv" plot_energy_var_T${T}.pdf plot.json plot.mplstyle "energy_var" "null"
./plot.py "data_d${d}_n${n}_q${q}_T${T}_J-1.000000.csv" plot_order_T${T}.pdf plot.json plot.mplstyle "order_mean" "null"
./plot.py "data_d${d}_n${n}_q${q}_T${T}_J-1.000000.csv" plot_order_var_T${T}.pdf plot.json plot.mplstyle "order_var" "null"

