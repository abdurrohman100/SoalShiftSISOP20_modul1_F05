#! /bin/bash
curdir=`pwd`
if [ ! -d $curdir/duplicate ]
then
  mkdir $curdir/duplicate
fi
if [ ! -d $curdir/kenangan ]
then
  mkdir $curdir/kenangan
fi

if [ "$(ls -A $curdir/kenangan/)" ]; then
   kLast=$(ls $curdir/kenangan  -l | cat | grep "kenangan" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	kLast=1
	#echo "Klast"$kLast

fi


if [ "$(ls -A $curdir/duplicate/)" ]; then
   dLast=$(ls $curdir/duplicate -l | cat | grep "duplicate" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	dLast=1
	#echo "Dlast"$dLast
fi

awk -F ' ' '{n++;print n" "$2;}' $curdir/location.log | sort -k 2 > $curdir/sorted.log
awk -F  ' ' '{
cmdDupe="mv "now"/pdkt_kusuma_"$1".jpg "now"/duplicate/duplicate_"b".jpg"; 
cmdKena="mv "now"/pdkt_kusuma_"$1".jpg "now"/kenangan/kenangan_"a".jpg";
if(i==$2){ system(cmdDupe);b++} else {system(cmdKena);a++}; i=$2;}' a="$kLast" b="$dLast" now=$curdir $curdir/sorted.log


cat $curdir/location.log >> $curdir/location.log.bak
cat $curdir/wget.log >> $curdir/wget.log.bak
if [ -f sorted.log ]
 then
 rm $curdir/sorted.log
fi
