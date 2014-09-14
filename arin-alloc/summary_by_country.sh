#!/bin/bash

# IPv6
echo "##### IPv6 Summary #####"
if [ -z $1 ]; then
 awk -F '|' '/ipv6/ {print $2}' < addr_all_regs | sort | uniq -c
else
 awk -F '|' '/ipv6/ {print $2}' < addr_all_regs | sort | uniq -c | grep $1
fi

# IPv4
printf "\n##### IPv4 Summary #####\n"
if [ -z $1 ]; then
 awk -F '|' '/ipv4/ {print $2}' < addr_all_regs | sort | uniq -c
else
 awk -F '|' '/ipv4/ {print $2}' < addr_all_regs | sort | uniq -c | grep $1
fi
