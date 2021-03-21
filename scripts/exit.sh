#!/bin/sh

choice=$(echo "Shutdown\nReboot\nSuspend\nLogout" | dmenu -i -p "Choose action: ") 
#echo $choice | dmenu
if [ $choice = "Shutdown" ];
then
#systemctl poweroff
	shutdown -h now
elif [ $choice = "Reboot" ];
then
	shutdown -r now
elif [ $choice = "Suspend" ];
then
	systemctl suspend
elif [ $choice = "Logout" ];
then
	i3-msg exit
fi
