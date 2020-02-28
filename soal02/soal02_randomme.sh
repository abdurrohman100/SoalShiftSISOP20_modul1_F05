#!/bin/bash
if [[ $1 =~ [^A-Za-z] ]]; then echo "Error Only Alphabet Allowed"
else 
noNum=$(echo $1|tr -dc 'A-Za-z')
fileOut="$noNum.txt"
cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 25 >> $fileOut
cat /dev/urandom | tr -dc 'A-Z' | head -c 1 >> $fileOut
cat /dev/urandom | tr -dc 'a-z' | head -c 1 >> $fileOut
cat /dev/urandom | tr -dc '0-9' | head -c 1 >> $fileOut
fi
#echo $fileOut $(date +%H) >> logs.log
