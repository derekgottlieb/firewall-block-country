#!/bin/bash

./nbcalc.py `grep ^192 non-us-cidr.txt | grep -v ^192.168 | sed -e ':a;N;$!ba;s/\n/ + /g'` > non-us-192.txt
./nbcalc.py `grep ^196 non-us-cidr.txt | sed -e ':a;N;$!ba;s/\n/ + /g'` > non-us-196.txt
./nbcalc.py `grep ^198 non-us-cidr.txt | sed -e ':a;N;$!ba;s/\n/ + /g'` > non-us-198.txt

grep ^1[2-8] non-us-cidr.txt > non-us-128-slash-2.txt
grep ^19[0-1] non-us-cidr.txt >> non-us-128-slash-2.txt
./nbcalc.py `cat non-us-128-slash-2.txt | sed -e ':a;N;$!ba;s/\n/ + /g'` > non-us-128-slash-2_condensed.txt 
