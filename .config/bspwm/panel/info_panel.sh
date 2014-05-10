#!/bin/bash
#
# Dzen Panel with stats
#

# Import colors
source ~/.colors/current-sh

# General
DELAY="2"
PADDING="30"
HALF_PADDING="15"

# Colors
DZEN_BG=$COLOR_BACKGROUND
DZEN_FG=$COLOR_FOREGROUND
BAR_BG=$COLOR_BLACK_DARK
BAR_FG=$COLOR_BLUE_DARK

BAR_W="75"
FONT="uushi:size=8"

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
    rx1=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    sleep $DELAY
    rx2=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    rxdiff=$(echo "$rx2 - $rx1" | bc -l)
    rxtrue=$(echo "$rxdiff/1024/$DELAY" | bc -l)

    printf "DOWN %.0f kb/s\n" "$rxtrue"
}
upspeed()
{
    tx1=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    sleep $DELAY
    tx2=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    txdiff=$(echo "$tx2 - $tx1" | bc -l)
    txtrue=$(echo "$txdiff/1024/$DELAY" | bc -l)

    printf "UP %.0f kb/s\n" "$txtrue"
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
    # sleep $DELAY
done | dzen2 -h "18" -ta r -fn "$FONT" -bg "$DZEN_BG" -fg "$DZEN_FG" -w "700" -x "3140"
