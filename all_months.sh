#!/bin/bash

for n in $(seq 1 12); do cmd="$n month ago"; echo $(date --date="$cmd" +%b); done
