#!/bin/bash

# IPv4 example
#RIR|Country|v4/v6|network|# hosts|date|status
#arin|US|ipv4|23.68.0.0|262144|20120430|allocated

if [ -z $1 ]; then
 echo "Usage: $0 Countries-to-exclude-from-blocklist"
 echo " To specify multiple countries, use the format 'US|CA'"
 exit
fi

NETWORKS=$(grep -v summary addr_all_regs | awk -F '|' '/ipv4/ {print $2, $4, $5}' | sort | grep -E -v "$1")

#printf "$NETWORKS\n" 
while IFS= read -r line
do
 COUNTRY=$(echo "$line" | awk '{print $1}')
 NET=$(echo "$line" | awk '{print $2}')
 NUM_IPS=$(echo "$line" | awk '{print $3}')
 case "$NUM_IPS" in
  2147483648)
   NETMASK="128.0.0.0"
   ;;
  1073741824)
   NETMASK="192.0.0.0"
   ;;
  536870912)
   NETMASK="224.0.0.0"
   ;;
  268435456)
   NETMASK="240.0.0.0"
   ;;
  134217728)
   NETMASK="248.0.0.0"
   ;;
  67108864)
   NETMASK="252.0.0.0"
   ;;
  33554432)
   NETMASK="254.0.0.0"
   ;;
  16777216)
   NETMASK="255.0.0.0"
   ;;
  8388608)
   NETMASK="255.128.0.0"
   ;;
  4194304)
   NETMASK="255.192.0.0"
   ;;
  2097152)
   NETMASK="255.224.0.0"
   ;;
  1048546)
   NETMASK="255.240.0.0"
   ;;
  524288)
   NETMASK="255.248.0.0"
   ;;
  262144)
   NETMASK="255.252.0.0"
   ;;
  131072)
   NETMASK="255.254.0.0"
   ;;
  65536)
   NETMASK="255.255.0.0"
   ;;
  32768)
   NETMASK="255.255.128.0"
   ;;
  16384)
   NETMASK="255.255.192.0"
   ;;
  8192)
   NETMASK="255.255.224.0"
   ;;
  4096)
   NETMASK="255.255.240.0"
   ;;
  2048)
   NETMASK="255.255.248.0"
   ;;
  1024)
   NETMASK="255.255.252.0"
   ;;
  512)
   NETMASK="255.255.254.0"
   ;;
  256)
   NETMASK="255.255.255.0"
   ;;
  128)
   NETMASK="255.255.255.128"
   ;;
  64)
   NETMASK="255.255.255.192"
   ;;
  32)
   NETMASK="255.255.255.224"
   ;;
  16)
   NETMASK="255.255.255.240"
   ;;
  8)
   NETMASK="255.255.255.248"
   ;;
  4)
   NETMASK="255.255.255.252"
   ;;
  2)
   NETMASK="255.255.255.254"
   ;;
  1)
   NETMASK="255.255.255.255"
   ;;
  *)
   echo "ERROR: Unknown number of IPs ($line)."
   #exit
 esac
done <<< "$NETWORKS"
