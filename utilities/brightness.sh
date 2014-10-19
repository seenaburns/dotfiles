#!/bin/bash
monitors=( DVI-I-1 DVI-D-0 )
defaultb=1.0
defaultg=1.0:1.0:1.0

if [[ $1 = "clear" ]]
then
    for i in ${monitors[@]}; do
        echo "Clear $i, brightness=$defaultb gamma=$defaultg";
        xrandr --output $i --brightness $defaultb;
        xrandr --output $i --gamma $defaultg;
    done
elif [[ $1 = "brightness" ]]
then
    echo "Set ${monitors[*]} brightness $2 ${3-$2}";
    xrandr --output ${monitors[0]} --brightness $2;
    xrandr --output ${monitors[1]} --brightness ${3-$2};
elif [[ $1 = "gamma" ]]
then
    echo "Set ${monitors[*]} gamma $2 ${3-$2}";
    xrandr --output ${monitors[0]} --gamma $2;
    xrandr --output ${monitors[1]} --gamma ${3-$2};
else
    echo "Usage: brightness.sh [clear] [brightness <m1> <optional: m2>] [gamma <m1> <optional: m2>]";
fi

