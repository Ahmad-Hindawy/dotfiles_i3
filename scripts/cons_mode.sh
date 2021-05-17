#!/bin/sh
cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
echo $1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode 
cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode
