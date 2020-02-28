#! /bin/bash
curdir=`pwd`
if [ -f $curdir/wget.log ]
 then
 rm $curdir/wget.log
fi
if [ -f $curdir/location.log ]
 then
 rm $curdir/location.log
fi
for ((num=1; num<=28; num=num+1))
do
  wget -O $curdir/pdkt_kusuma_$num.jpg --append-output=$curdir/wget.log https://loremflickr.com/320/240/cat 
done
  grep "Location" $curdir/wget.log> $curdir/location.log

