#!/bin/sh
uid=$(id -u)
gid=$(id -g)
# this creates a list of the ub devices only
# first list all files in the this directory to show all  drives connected
# then filter them using awk and  display them as /dev/sd* 
usbdev=$(ls -l /sys/dev/block/ | awk -F"/" '($6~"usb" && $14~"sd") {print "/dev/"$14}')
#					     ^usb or sata field (by exp)
#							 ^sd* field

#echo $(lsblk -rno size,name,mountpoint $usbdev )

#if there is 
if [ "$usbdev" ]
then
#this shows all mounted or unmounted devices with some info of them 
#lsblk -rno size,name,mountpoint $usbdev
        selected=$( \
                lsblk -rno size,name,mountpoint $usbdev | \
                awk '($1!~"M" && $1!~"K") {print  $2, $1, $3 }' | \
                dmenu -l 5 -i -p "USB Drives: "   | awk '{print $1}'  \
#		rofi -dmenu | awk '{print $1}' \
        ) 
#check if it is already mounted or not (same as mount command)
	if grep -qs $selected /proc/mounts
        then
                sync
                sudo umount /dev/$selected
                grep -qs /media/hindawy/$selected /proc/mounts || sudo rm -rf /media/hindawy/$selected
        else
                [ ! -d /media/hindawy/$selected ] && sudo mkdir /media/hindawy/$selected && 
                sudo mount -o uid=$uid,gid=$gid /dev/$selected /media/hindawy/$selected &&
		sudo chown -R hindawy:hindawy /media/hindawy/$selected && exit 0
	fi


else
    echo "No drives connected" | dmenu -i -p "USB Drives: "
    exit
fi


#echo $selected

#knowing the name of the drive
#label=$(sudo blkid | awk -v var="$selected" -F'=' '($1~var) {print $2}' | awk -F'"' '{print $2}')
exit


