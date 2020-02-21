#! /bin/bash
#curdir= "/home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/"
if [ -f /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log ]
 then
 rm /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log
fi
if [ -f /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log ]
 then
 rm /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log
fi
for ((num=1; num<=28; num=num+1))
do
  wget -O /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/pdkt_kusuma_$num.jpg --append-output=/home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log https://loremflickr.com/320/240/cat 
done
  grep "Location" /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log> /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log

if [ ! -d /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/duplicate ]
then
  mkdir /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/duplicate
fi
if [ ! -d /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/kenangan ]
then
  mkdir /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/kenangan
fi

if [ "$(ls -A /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/kenangan/)" ]; then
   kLast=$(ls /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/kenangan  -l | cat | grep "kenangan" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	kLast=1
	#echo "Klast"$kLast

fi


if [ "$(ls -A /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/duplicate/)" ]; then
   dLast=$(ls /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/duplicate -l | cat | grep "duplicate" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	dLast=1
	#echo "Dlast"$dLast
fi


#echo $dLast $kLast "Helo"

awk -F ' ' '{n++;print n" "$2;}' /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log | sort -k 2 > /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/sorted.log
awk -F  ' ' '{ print a b "AWKWK";
cmdDupe="mv /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/pdkt_kusuma_"$1".jpg /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/duplicate/duplicate_"b".jpg"; 
cmdKena="mv /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/pdkt_kusuma_"$1".jpg /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/kenangan/kenangan_"a".jpg";
if(i==$2){ system(cmdDupe);b++} else {system(cmdKena);a++}; i=$2;}' a="$kLast" b="$dLast" /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/sorted.log


cat /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log >> /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/location.log.bak
cat /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log >> /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/wget.log.bak
if [ -f sorted.log ]
 then
 rm /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/sorted.log
fi
#rm wget.log
#rm location.log
