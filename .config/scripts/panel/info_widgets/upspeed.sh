#!/bin/bash
# Sample network upspeed, write to temp file
DELAY=2
OUTF=/tmp/upspeed

sample_up()
{
    tx1=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    sleep $DELAY
    tx2=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    txdiff=$(echo "$tx2 - $tx1" | bc -l)
    txtrue=$(echo "$txdiff/1024/$DELAY" | bc -l)

    printf "UP %.0f kb/s\n" "$txtrue"
}

while true;
do
    echo -n $(sample_up) > $OUTF;
done