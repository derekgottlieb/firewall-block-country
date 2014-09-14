#!/bin/bash

./nbcalc.py `grep ^192 non-us-cidr.txt | sed -e ':a;N;$!ba;s/\n/ + /g'`
