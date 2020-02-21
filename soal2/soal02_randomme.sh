#!/bin/bash
fileOut="$1.txt"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 27 >> $fileOut
cat /dev/urandom | tr -dc '0-9' | head -c 1 >> $fileOut
#echo $fileOut $(date +%H) >> logs.log
