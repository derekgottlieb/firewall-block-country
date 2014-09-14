#!/bin/bash

DATE=$(date +%Y%m%d)

#wget -O addr_tmp ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-${DATE}
wget -O addr_tmp ftp://ftp.arin.net/pub/stats/arin/delegated-arin-${DATE}

if [ -e addr_tmp ]; then
 rm -f addr_all_regs
 grep -E "\|ipv[46]\|" addr_tmp >> addr_all_regs
 rm -f addr_tmp
else
 echo "No updated delegated-arin file available."
fi
