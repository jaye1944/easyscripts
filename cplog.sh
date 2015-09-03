#!/bin/sh
logFile='a'
outFile='out'
#chk num of args
if [ $# -eq 0 ];
then
echo "Usage is cplog [start] [end]"
exit 0
fi

#chk args
if [ $2 -lt $1 ];
then
echo "[start] < [end]"
exit 0
fi
en=$((($2+1)-$1))
awk 'NR>='$1 $logFile | awk 'NR<='$en > $outFile

