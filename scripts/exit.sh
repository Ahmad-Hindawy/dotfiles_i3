#!/bin/sh

choice=$(echo "Shutdown\nReboot\nExit" | dmenu -i -p "Choose action: ") 
#echo $choice | dmenu
if [ $choice = "Shutdown" ];
then
sudo -A shutdown -h now
elif [ $choice = "Reboot" ];
then
sudo -A shutdown -r now
elif [ $choice = "Exit" ];
then
#i3-msg exit
echo hi
fi
