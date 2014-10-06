#!/bin/bash
# Sample network downspeed, write to temp file
DELAY=2
OUTF=/tmp/downspeed

sample_down()
{
    rx1=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    sleep $DELAY
    rx2=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    rxdiff=$(echo "$rx2 - $rx1" | bc -l)
    rxtrue=$(echo "$rxdiff/1024/$DELAY" | bc -l)

    printf "DOWN %.0f kb/s\n" "$rxtrue"
}

while true;
do
    echo -n $(sample_down) > $OUTF;
done