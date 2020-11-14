#!/bin/bash

file=membench

#exts=("" ".out" ".pdf")
exts=(".pdf")

for ext in "${exts[@]}"
do
	make ${file}${ext}
done

