#!/bin/bash
# Split input by col (arg1) and pipe into dzen2 with offset (arg2)

while read -r line;
do
    echo $line | cut -d \: -f $1
done | dzen2 -h 18 -w 200 -ta l -fn uushi:size=8 -x $2
