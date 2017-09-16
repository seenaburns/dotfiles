#!/usr/bin/env bash

XOFFSET=${1:-20}
BG=${2:-"#1D1C27"}
FG=${3:-"#C8D1E3"}

XSIZE=$(echo "1920 - (2*$XOFFSET)" | bc)

clock() {
  # from https://wiki.archlinux.org/index.php/Lemonbar
  dt=$(date "+%a %b %d, %T")
  echo -n "$dt"
}

volume() {
  # from https://wiki.archlinux.org/index.php/Bspwm
  volStatus=$(amixer get Master | tail -n 1 | cut -d '[' -f 4 | sed 's/].*//g')
  volLevel=$(amixer get Master | tail -n 1 | cut -d '[' -f 2 | sed 's/%.*//g')
  volDb=$(amixer get Master | tail -n 1 | cut -d '[' -f 3 | sed 's/\..*//g')
  # is alsa muted or not muted?
  echo -n "$volLevel% ${volDb}dB"
}

temp() {
  tempC=$(cat /sys/class/thermal/thermal_zone0/temp | tr -d '\n')
  tempF=$(echo "$tempC/1000 * 9/5 + 32" | bc)
  echo "${tempF}F"
}

while true; do
        echo "%{c}%{F$FG}%{B$BG}%{r} $(volume) | $(temp) | $(clock) %{F-}%{B-}"
        sleep 1
done | lemonbar -g "${XSIZE}x20+$XOFFSET+1180" -B "$BG" -F "$FG" -f "fira mono:size=10" -p
