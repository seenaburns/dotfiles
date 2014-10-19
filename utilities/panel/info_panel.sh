#!/bin/bash
#
# Dzen Panel with stats
#

# Import colors
source ~/.colors/current-sh

# General
DELAY=0.3
PADDING="30"
HALF_PADDING="15"

# Colors
DZEN_BG=$COLOR_BACKGROUND
DZEN_FG=$COLOR_FOREGROUND
BAR_BG=$COLOR_BLACK_DARK
BAR_FG=$COLOR_BLUE_DARK

BAR_W="75"
FONT="lemon:size=8"

SCREEN_W=$(xdpyinfo | grep 'dimensions' | grep -o '[0-9]*' | head -1);
SP_W=120;
INFO_W=$[ $SCREEN_W - $SP_W - 1920 ];
INFO_OFF=$[ $SCREEN_W - $INFO_W ];

gdbar() {
    echo $2 | dzen-gdbar -l "$1 " -bg "$BAR_BG" -fg "$BAR_FG" -w "$BAR_W" -h "6" -s o;
}

titleclock() {
    echo $(date +"%a %b, %d %I:%M %p")
}

volume()
{
    vol=$(amixer sget 'Master' | grep '..%' -o)
    gdbar "VOL" $vol
}

downspeed()
{
    cat /tmp/downspeed;
}
upspeed()
{
    cat /tmp/upspeed;
}

sync()
{
    # Check sync
    # Using dropbox
    syncstatus=$(dropbox status);
    echo -n "SYNC "
    if [ "$(echo $syncstatus | grep 'running!' -o)" == "running!" ]
    then
        echo -n "OFFLINE"
    else
        echo -n "$(dropbox status | head -1)"        
    fi
}

# Start widgets (close if already opened)
pgrep 'downspeed.sh' | xargs kill
pgrep 'upspeed.sh' | xargs kill
nohup ~/util/panel/info_widgets/downspeed.sh >/dev/null 2>&1 &
nohup ~/util/panel/info_widgets/upspeed.sh >/dev/null 2>&1 &

# LOOP EXECUTION (indefinitely)
SPACER="^p($HALF_PADDING)|^p($HALF_PADDING)"
while :;
do
    # echo -n "$(sync)"
    # echo -n "$SPACER"
    echo -n "$(downspeed)"
    echo -n "^p($PADDING)$(upspeed)"
    echo -n "$SPACER"
    echo -n "$(volume)"
    echo -n "$SPACER"
    echo -n "$(titleclock)"
    echo "^p($HALF_PADDING)"
    sleep $DELAY
done | dzen2 -h "18" -ta r -fn "$FONT" -bg "$DZEN_BG" -fg "$DZEN_FG" -w "$INFO_W" -x "$INFO_OFF"
