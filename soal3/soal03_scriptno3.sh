#! /bin/bash
#curdir= "/home/seijaku/Documents/Sisop/Praktikum1/Nomor3/"
if [ -f /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log ]
 then
 rm /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log
fi
if [ -f /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log ]
 then
 rm /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log
fi
for ((num=1; num<=28; num=num+1))
do
  wget -O /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/pdkt_kusuma_$num.jpg --append-output=/home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log https://loremflickr.com/320/240/cat 
done
  grep "Location" /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log> /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log

if [ ! -d /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/duplicate ]
then
  mkdir /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/duplicate
fi
if [ ! -d /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/kenangan ]
then
  mkdir /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/kenangan
fi

if [ "$(ls -A /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/kenangan/)" ]; then
   kLast=$(ls /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/kenangan  -l | cat | grep "kenangan" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	kLast=1
	echo "Klast"$kLast

fi


if [ "$(ls -A /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/duplicate/)" ]; then
   dLast=$(ls /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/duplicate -l | cat | grep "duplicate" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	dLast=1
	echo "Dlast"$dLast
fi


echo $dLast $kLast "Helo"

awk -F ' ' '{n++;print n" "$2;}' /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log | sort -k 2 > /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/sorted.log
awk -F  ' ' '{ print a b "AWKWK";
cmdDupe="mv /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/pdkt_kusuma_"$1".jpg /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/duplicate/duplicate_"b".jpg"; 
cmdKena="mv /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/pdkt_kusuma_"$1".jpg /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/kenangan/kenangan_"a".jpg";
if(i==$2){ system(cmdDupe);print "Move"$1;b++} else {system(cmdKena);print "Send"$1;a++}; i=$2;}' a="$kLast" b="$dLast" /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/sorted.log


cat /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log >> /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/location.log.bak
cat /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log >> /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/wget.log.bak
if [ -f sorted.log ]
 then
 rm /home/seijaku/Documents/Sisop/Praktikum1/Nomor3/sorted.log
fi
#rm wget.log
#rm location.log
