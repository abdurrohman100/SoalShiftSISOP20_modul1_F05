#!/bin/bash
upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
nama=$1
phrase=${nama%%.*}
#echo $phrase
shift=$(ls -l $nama | cut -d ' ' -f '8' | head -c 2)
if [ $shift -ne 0 ]
	then 
	newphrase=$(echo $phrase | tr "${upperAlphabet:0:26}" "${upperAlphabet:${shift}:26}" | tr "${lowAlphabet:0:26}" "${lowAlphabet:${shift}:26}")

	mv $nama $newphrase.txt
fi

