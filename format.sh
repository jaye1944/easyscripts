#!/bin/bash
dev="/dev/sdb"
usbDevices=$(df | grep sdb)
if [ $# -eq 0 ];
then
	if [ "$usbDevices" != "" ]
	then
    	tput setaf 3
		echo "Listing All USB devices"
		tput setaf 2
		echo $usbDevices
	else
		tput setaf 1
		echo "No USB devices found"
		tput sgr0
		exit 0
	fi
	tput sgr0
	echo "Enter USB Dev NO to format :"
	read devno
	dev=$dev$devno
	#get the current name of USB
	mys=$(df | grep $dev |awk '{print $NF;}')
	oldName=${mys##*/}
	
	echo "Enter USB Dev name (default press only Enter key) :"
	read newName
	
	umount $dev #unmout device
	if [ "$name" != "" ]
	then
		#mys=$(df | grep $dev |awk '{print $NF;}')
		sudo mkfs.vfat -n $newName -I $dev	#need to give password
		tput setaf 2
		echo  $dev "[" $newName "] formatted to FAT32 succusefully..!!"
	else
	 	sudo mkfs.vfat -n $oldName -I $dev
	 	tput setaf 2
		echo  $dev "[" $oldName "] formatted to FAT32 succusefully..!!"
	fi
	tput sgr0
fi
