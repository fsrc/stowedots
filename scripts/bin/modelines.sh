#!/bin/bash
# Calculates VMware xorg.conf ModeLines

function write_modeline() { 
  W=$1 
  H=$2 
  A=$(( $(($W/100 + 1)) * 100 )) 
  B=$(( $(($W/100 + 2)) * 100 )) 
  C=$(( $(($W/100 + 3)) * 100 )) 
  X=$(( $(($H/100 + 1)) * 100 )) 
  Y=$(( $(($H/100 + 2)) * 100 )) 
  Z=$(( $(($H/100 + 3)) * 100 )) 
  echo ModeLine '"'${W}x${H}'"' 100 $W $A $B $C $H $X $Y $Z
} 
params=$#  # Number of command-line parameters
param=1    # Start at first command-line param

while [ "$param" -le "$params" ]
do
  valuepar="echo \$$param"
  value=`eval $valuepar`
  W=${value%%x*} 
  H=${value#*x} 
  write_modeline ${W} ${H}
  (( param ++ ))
done
