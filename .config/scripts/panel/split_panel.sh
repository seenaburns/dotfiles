#!/bin/bash
# Split input by col (arg1) and pipe into dzen2 with width (arg2) and offset (arg3)

FONT="lemon:size=8"
while read -r line;
do
    echo $line | cut -d \: -f $1
done | dzen2 -h 18 -w $2 -ta l -fn $FONT -x $3
