#!/bin/sh
NAME="Da.Vincis.Demons"
SEASON=3	#season
NOOFEPS=10 	#number of epsiodes
EPSIODE=1	#starting epsiode
LIMIT=`expr $NOOFEPS + 1`

HOME_NAME=$NAME"_S"$SEASON

make_folder ()
{
    NAME="S"$2"E"$3
    echo $1/$NAME  
    mkdir $1/$NAME 
}

create_home ()
{
	mkdir $1
}

create_home $HOME_NAME 	

while [ $EPSIODE -lt $LIMIT ]
do
   if [ $EPSIODE -lt 10 ] #-eq for equal
   then
      make_folder $HOME_NAME $SEASON "0"$EPSIODE      
   else
      make_folder $HOME_NAME $SEASON $EPSIODE
   fi
   EPSIODE=`expr $EPSIODE + 1`
done

