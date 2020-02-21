#!/bin/bash
upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
nama=$1
phrase=${nama%%.*}
#echo $phrase
shift=$(ls -l $nama | cut -d ' ' -f '8' | head -c 2)
#echo $shift
if [ $shift -ne 0 ]
	then
	newphrase=$(echo $phrase | tr "${upperAlphabet:${shift}:26}" "${upperAlphabet:0:26}" | tr "${lowAlphabet:${shift}:26}" "${lowAlphabet:0:26}")
	mv $nama $newphrase.txt
fi
