#!/usr/bin/env bash

BG="#1D1C27"
FG="#C8D1E3"

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

while true; do
        echo "%{c}%{F$FG}%{B$BG} $(volume) | $(clock) %{F-}%{B-}"
        sleep 1
done | lemonbar -g 301x15+1625+10 -B "$BG" -F "$FG" -f "fira mono:size=10" -p
