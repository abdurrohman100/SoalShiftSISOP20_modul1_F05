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
nPDKT="pdkt_kusuma_"
nDownload="https://loremflickr.com/320/240/cat"
for ((num=1; num<=28; num=num+1))
do
  wget -O $curdir/$nPDKT$num.jpg --append-output=$curdir/wget.log $nDownload
done
  grep "Location" $curdir/wget.log> $curdir/location.log

