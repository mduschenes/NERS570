#!/bin/bash

file=membench

#exts=("" ".out" ".png")
exts=(".png")

for ext in "${exts[@]}"
do
	make ${file}${ext}
done

