#!/bin/bash
# Sample network upspeed, write to temp file
DELAY=2
OUTF=/tmp/upspeed

sample_up()
{
    tx1=$(cat /sys/class/net/wlp6s1/statistics/tx_bytes)
    sleep $DELAY
    tx2=$(cat /sys/class/net/wlp6s1/statistics/tx_bytes)
    txdiff=$[ $tx2 - $tx1]
    txtrue=$[ $txdiff / 1024 / $DELAY ]

    printf "UP %.0f kb/s\n" "$txtrue"
}

while true;
do
    echo -n $(sample_up)
    echo -n $(sample_up) > $OUTF;
done
