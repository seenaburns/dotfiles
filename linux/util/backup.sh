#!/bin/bash
set -e

if [ $# -lt 2 ]
then
    echo "Usage: ./backup.sh [backupdir] [rsync src]"
    echo "  ./backup.sh /backup /*"
    echo "  ./backup.sh root@host:~/"
    exit 1
fi

backupdir=$1
src=$2

dirname=$(echo "$(date +%Y-%m-%d)-backup")
dest="$backupdir/$dirname/"

echo $dest
mkdir -p $dest

START=$(date +%s)
if [[ $src = '/' ]]
then
    rsync -aAXv --progress --exclude={"/dev/","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} "$src" "$dest"
else
    rsync -aAXv --progress "$src" "$dest"
fi
FINISH=$(date +%s)
echo "total time: $(( ($FINISH-$START) / 60 )) minutes, $(( ($FINISH-$START) % 60 )) seconds"
echo "Backup from $(date '+%Y-%m-%d, %T, %A')" | tee "$dest/backup.txt"

