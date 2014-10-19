#!/bin/bash
# usage: rotate.sh dir screen
# Rotate screen, reload wallpaper, restart panel

# Rotate, use defaults
defaultdisp="DVI-I-1";
defaultdir="right";
xrandr --output ${2-$defaultdisp} --rotate ${1-$defaultdir}

# Reload wallpaper
eval $(cat ~/.fehbg)

# Restart panel, persist past closing shell
while [[ -n $(pgrep panel) ]];
do
    pgrep panel | xargs kill -s 9;
done

nohup panel >/dev/null 2>&1 &
nohup info_panel.sh >/dev/null 2>&1 &

