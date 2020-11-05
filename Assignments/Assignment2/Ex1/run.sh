#!/bin/bash

name=Ex1
program=${name}.py
log=${name}.log

./${program} | tee ${log}
