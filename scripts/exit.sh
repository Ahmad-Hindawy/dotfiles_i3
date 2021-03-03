#!/bin/sh

choice=$(echo "Shutdown\nReboot\nExit" | dmenu -i -p "Choose action: ") 
#echo $choice | dmenu
if [ $choice = "Shutdown" ];
then
#systemctl poweroff
shutdown -h now
elif [ $choice = "Reboot" ];
then
shutdown -r now
elif [ $choice = "Exit" ];
then
i3-msg exit
fi
