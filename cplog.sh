#!/bin/sh
logFile='infile'
outFile='outfile'
#check file is exist
if ! [ -e "$logFile" ]
then
  echo "File $logFile  NOT there"
  exit 0
fi

#chk num of args
if [ $# -eq 0 ];
then
echo "Usage cplog [start] [end]"
exit 0
fi

#chk args
if [ $2 -lt $1 ];
then
echo "[start] < [end]"
exit 0
fi
en=$((($2+1)-$1)) #get limit
awk 'NR>='$1 $logFile | awk 'NR<='$en > $outFile #exract correct part

#scp $outFile user@127.0.0.0:~/location

