

# SoalShiftSISOP20_modul1_F5
Repository Praktikum Sisop 1

5111840000100-ABDUR ROHMAN

5111840000166-FERALDY NATHANAEL



## Penjelasan Penyelesaian Soal nomor 1
### Soal 1a

``` 
#!/bin/bash

awk -F "	" 

'{if($13 ~ "West"){totalProfitWest=totalProfitWest + $21};
      if($13 ~ "East"){totalProfitEast=totalProfitEast + $21};
      if($13 ~ "South"){totalProfitSouth=totalProfitSouth + $21};
      if($13 ~ "Central"){totalProfitCentral =totalProfitCentral + $21};}

END {profitmin=totalProfitWest;regionterendah="West"; 
     if(profitmin>totalProfitEast){profitmin=totalProfitEast};
     if(profitmin>totalProfitSouth){profitmin=totalProfitSouth;regionterendah="South"};
     if(profitmin>totalProfitCentral){profitmin=totalProfitCentral;regionterendah="Central"};
     printf("Region dengan profit terendah = %s dengan profit sebesar %s\n",regionterendah,profitmin )}
     ' Sample-Superstore.tsv
     
```

pada no 1a kita diminta untuk mencari region dengan profit yang paling kecil. Pertama-tama dengan awk, digunakan :

  -F "  " yang artinya kita mendifinisikan "  " sebagai field separator dari file yang diolah

Selanjutnya, karna region hanya terdiri dari 4 jenis, maka kita dapat menggunakan cara yang greedy dengan membandingkan 
dan menyimpan masing-masing nilai profit dari ke 4 region. Setelah masing-masing disimpan, pada bagian END yaitu 
script yang akan dijalankan di akhir, akan dibandingnya masing-masing jumlah nilai profit untuk mencari region mana yang
memiliki profit terkecil. Setelah didapat baru di print/ditunjukan nama region dengan profitnya.


### Soal 1b

``` 
#!/bin/bash

awk -F "	" 'BEGIN {z=1;}

		   {if($13 ~ "Central"){a[$11]=a[$11]+$21;}}
		   END {
			for (i in a){
				if(z==1){
					nmin=i;	
					z=2;		
				}
				else if(z==2){
					nmin2=i;	
					z=3;		
				}
				else {
					if(a[nmin]>a[i]){
						if(a[nmin2]>a[nmin]){
							nmin2=nmin;
							nmin=i;
						}
						else {nmin=i;}
					}
					else if(a[nmin2]>a[i]){
						if(a[nmin1]>a[nmin]){
							nmin1=nmin;
							nmin2=i;
						}
						else {nmin2=i;}
					}
				}}
			
			printf("1. ")
			print nmin	
			print a[nmin]
		
			
			printf("2. ")
			print nmin2
			print a[nmin2]
			printf("\n")

	            }' Sample-Superstore.tsv
     
```

Pada soal no 1b, kita diminta mengolah dan mencari 2 State yang profitnya terkecil dari hasil pengolahan data soal no 1a.
Dari soal no 1a didapat region dengan profit terkecil adalah region Central. Pada soal no 1b ini kita memasukan data ke 
dalam array  untuk mendapatkan jumlah profit per-statenya. Indeks array menggunakan nama state sedangkan array itu sendiri 
menyimpan total profit dari state tersebut. Pada bagian akhir yaitu END akan dilakukan perulangan untuk membandingkan dan
mencari state mana yang memiliki total profit terkecil. Pada perulangan tersebut disimpan 2 State yang profitnya terkecil.



### Soal 1c

``` 

awk -F "	" 'BEGIN {}

		   {if($11 ~ "Illionis" || $11 ~ "Texas"){
			print $17 ";" $21 > "Barang-di-Texas-dan-Illionis.tsv"
		   }}

		   END { }' Sample-Superstore.tsv

sort -t';' -gk2 Barang-di-Texas-dan-Illionis.tsv > sorted.tsv 
 awk -F  ";" '{print $1 $2}NR==10{exit}' sorted.tsv 
     
```
Terakhir pada soal 1c kita diminta untuk menunjukan 10 nama produk dengan profit terkecil dari data yang dihasilkan dari soal
1b. Pada soal ini kita menggunakan cara yang berbeda. Pertama-tama kita membuat file baru yang berisi profit dan nama produk
yang hanya berasal dari Illionis dan Texas. Lalu kita melakukan sort -gk2 yang berarti kita sorting data sesuai generic 
numerik sort dan yang menjadi patokan sort merupakan kolom 2. Hasil sort kita simpan dalam file sorted.tsv. Baru dari file
yang sudah tersorting kita tampilkan 10 produk. 

## Penjelasan Penyelesaian Soal nomor 2

### Soal 2a
Pada soal nomor 2a kita diminta membuat sebuah script unutk mengenerate password berupa alphanumeric sebanyak 28 character. Untuk menggenerate random kamu membuat nya dalam file randomme.sh dan untuk menggenerate script menggunakan perintah berikut
``` 
#!/bin/bash

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 27 >> $fileOut
cat /dev/urandom | tr -dc '0-9' | head -c 1 >> $fileOut
     
```
Disini kami menggunakan /dev/urandom bawaan linux untuk menggenerate character acak. Kemudian dengan fungsi `tr -dc 'a-zA-Z0-9'` dimana tr merupakan fungsi untuk mendelete atau mentranslate character dengan menggunakan parameter `-dc` yang berarti delete complemen dari set yang diberikan yaitu `'a-zA-Z0-9'` kemudian mengambil 27 karakter awal menggunakan `head -c 27`, kemudian untuk menjamin adanya numeric pada password kami melakukan perintah yang sama untuk mendapatkan character terakhir dengan mengubah set nya menjadi `'0-9'`.
.

### Soal 2b
Pada nomor 2b kita diminta menyimpan password hasil script nomor 2a kedalam sebuah text file dengan nama berupa argumen yang diberikan saat menjalankan script. Karena 2a dan 2b berhubungan kami menjadikan 2a dan 2b menjadi satu script
``` 

#!/bin/bash

fileOut="$1.txt"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 27 >> $fileOut
cat /dev/urandom | tr -dc '0-9' | head -c 1 >> $fileOut
     
```
Untuk menerima argumen yang akan menjadi nama file kita menggunakan `$1` dan memasukanya ke variable `fileOut` dan menambahkan ekstensi .txt . Kemudian dari script nomor satu kita tinggal melakukan redirection ke file bernama `$fileOut` dengan menggunakan  `>` dan `>>`.  
 
 ### Soal 2b
Pada nomor 2b kita diminta menyimpan password hasil script nomor 2a kedalam sebuah text file dengan nama berupa argumen yang diberikan saat menjalankan script. Karena 2a dan 2b berhubungan kami menjadikan 2a dan 2b menjadi satu script
``` 

#!/bin/bash

fileOut="$1.txt"
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 27 >> $fileOut
cat /dev/urandom | tr -dc '0-9' | head -c 1 >> $fileOut
     
```
Untuk menerima argumen yang akan menjadi nama file kita menggunakan `$1` dan memasukanya ke variable `fileOut` dan menambahkan ekstensi .txt . Kemudian dari script nomor satu kita tinggal melakukan redirection ke file bernama `$fileOut` dengan menggunakan  `>` dan `>>`.  Untuk penggunaan scriptnya sendiri contohnya seperti berikut

    seijaku@seijaku:~/Documents/Sisop/Praktikum1/Nomor2$ bash randomme.sh inicontohnamaFile


maka akan script akan membuat file dengan nama inicontohnamaFile.txt.

### Soal 2c
Pada nomor 2c kita diminta melakukan enkripsi  terhadap nama file yang sudah kita buat menggunakan caesasr chipper dengan shiftnya adalah  jam pembuatan file. Karena disini diasumsikan file dibuat tidak untuk diubah maka disini untuk jam pembuatan file kami menggunakan modified date.
``` 

#!/bin/bash
nama=$1
phrase=${nama%%.*}
shift=$(ls -l $nama | cut -d ' ' -f '8' | head -c 2)
upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
newphrase=$(echo $phrase | tr "${upperAlphabet:0:26}" "${upperAlphabet:${shift}:26}" | tr "${lowAlphabet:0:26}" "${lowAlphabet:${shift}:26}")
mv $nama $newphrase.txt
     
```
Untuk menerima argumen yang akan menjadi nama file kita menggunakan `$1` dan memasukanya ke variable `nama` dan menghapus ekstensi .txt menggunakan string manipulation dan memasukan hasilnya ke variable `phrase`. Untuk mendapatkan shift yang kita inginkan kita menggunakan `ls -l $nama | cut -d ' ' -f '8' | head -c 2` . `ls -l $nama` akan didapat hasil seperti berikut

`-rw-r--r-- 1 seijaku seijaku 28 Feb 21 13:59 inicontohnamaFile.txt`
kemudian kita gunakan `cut -d ' ' -f '8'` dengan parameter `-d ' '` kita menentukan delimiter berupa ' '(spasi) kemudain untuk mencetak kolom ke 8 kita menambahkan parameter `-f '8'` hasil yang didapat berupa HH:MM kemudian kita mengambil 2 cahracter awal dari hasilnya untuk mendapatkan jam pembuatan file yang kemudian disimpan ke variable `shift`.
Untuk mempermudah melakukan enkripsi kita menggunakan bantuan fungsi tr dan string manipulation. Pertama kita mendefinisikan 2 buah set string yang masing-masing berisi 2 set huruf kapital dan biasa.

    tr "${upperAlphabet:0:26}" "${upperAlphabet:${shift}:26}"
Kemudian dari set tersebut kita melakukan string manipulation dengan mengesktrak substring dari stirng yang ada menggunakan `${string:position:length}` . Lakukan tr untuk string capital maupun biasa. Hasil enkripsi nama file kemudian disimpan dalam variable `newphrase`. Kemudian kita merename file dengan menggunakan perintah mv `mv $nama $newphrase.txt`.
Untuk penggunana script contohnya seperti berikut 
    seijaku@seijaku:~/Documents/Sisop/Praktikum1/Nomor2$ bash encryption.sh inicontohnamaFile.txt 
maka file inicontohnamaFile.txt akan berubah namanya dalam contoh ini shiftnya bernilai 13 jadi namanya berubah menjadi vavpbagbuanznSvyr.txt


### Soal 2d
Pada nomor 2d kita diminta mendekripsi file yang telah kita enkripsi. Cara kerjanya sama seperti script nomor 2c kita juga membutuhkan  jam pembuatan file untuk melakukan dekripsi. Scriptnya seperti berikut

    #!/bin/bash
    upperAlphabet=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
    lowAlphabet=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
    nama=$1
    phrase=${nama%%.*}
    shift=$(ls -l $nama | cut -d ' ' -f '8' | head -c 2)
    newphrase=$(echo $phrase | tr "${upperAlphabet:${shift}:26}" "${upperAlphabet:0:26}" | tr "${lowAlphabet:${shift}:26}" "${lowAlphabet:0:26}")
    mv $nama $newphrase.txt
Pada script dekripsi kita hanya perlu menukar posisi set pada fungsi tr.


## Penjelasan Penyelesaian Soal nomor 3
### Soal 3
Pada soal nomor 3 kita diminta membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) dan menyimpan log messages wget kedalam sebuah file "wget.log".  Script tersebut hanya berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu. Kemudian diminta membuat sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".
Untuk penyelesaian problem pertama yaitu mendownload 28 gambar dari https://loremflickr.com/320/240/cat kami membuat file dengan nama soal03_1script.sh isinya sebagai berikut
``` 
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
``` 
Penjelasanya sebagai berikut
``` 
#! /bin/bash
curdir=`pwd`
``` 
>pwd - print name of current/working directory

Kita menggunakan shebang untuk mendeklarasikan interpreter yang digunakan yaitu bash.
Kemudian disini saya membuat variable bernama *curdir* untuk menyimpan hasil dari fungsi *pwd* yaitu berupa direktori dimana script berada. Hal ini dilakukan untuk mempermudah penulisan absolute path. 

``` 
if [ -f $curdir/wget.log ]
 then
 rm $curdir/wget.log
fi
if [ -f $curdir/location.log ]
 then
 rm $curdir/location.log
fi
``` 
>rm - remove files or directories
>-f untuk menegecek sebuah file 

Kemudian disini kami mengecek apakah ada file wget.log ataupun location.log. Jika ada maka file tersebut akan dihapus. Hal ini dilakukan agar script kedua bisa dijalankan berkali-kali. Jadi sebelum mendownload file. Untuk pengecekan file digunakan parameter -f dan pathfile yang ingin di cek. Kemudian jika terdapat file log maka file tersebut akan dihapus menggunakan rm.
``` 
nPDKT="pdkt_kusuma_"
nDownload="https://loremflickr.com/320/240/cat"

for ((num=1; num<=28; num=num+1))
do
	wget -O $curdir/$nPDKT$num.jpg --append-output=$curdir/wget.log $nDownload
done
``` 
> Wget - The non-interactive network downloader.
> 
> --append-output=logfile -  Append ke logfile. Same as -o

Kemudian kami melakukan donwload file dari https://loremflickr.com/320/240/cat dengan menggunakan wget. Namun terlebih dahulu untuk menyimpan namafile dan alamat download pada sebuah variable dengan nama *nPDKT* dan *nDownload* . Perintah wget dimasukkan kedalam looping sehingga bisa mendownload 28 file saat dijalankan.

``` 
grep "Location" $curdir/wget.log> $curdir/location.log
``` 
>grep, egrep, fgrep, rgrep - print lines matching a pattern

Selanjutnya kami melakukan fungsi grep kata "Location" pada wget.log dan menyimpan hasilnya ke location.log. Hasil dari grep akan berupa asal file yang sudah di download

Kemudian untuk crontab yang digunakan adalah
``` 
    5 6-23/8 * * 0-5 /home/seijaku/SoalShiftSISOP20_modul1_F5/soal03/soal03_scriptno3.sh
``` 
>5 6-23/8 * * 0-5
>>5 berarti pada menit ke lima
>>6-23/8 berarti mulai jam 6 hingga jam 23 setiap 8 jam
>> (bintang) * berarti setiap hari di bulan itu
>>  (bintang) * berarti setiap bulan
>> 0-5 berarti dari hari MInggu sampai Jumat


/home/seijaku/SoalShiftSISOP20_modul1_F5/soal03 disini adalah local directory pada user dimana terdapat file yang akan dieksekusi bisa disesuaikan untuk setiap user.

Kemudian untuk mengecek duplikat gambar kami menggunakan soal03_2script.sh
``` 
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

if [ "$(ls -A $curdir/kenangan/)" ];
then
	kLast=$(ls $curdir/kenangan -l | cat | grep "kenangan" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	kLast=1
fi

if [ "$(ls -A $curdir/duplicate/)" ]; 
then
	dLast=$(ls $curdir/duplicate -l | cat | grep "duplicate" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	dLast=1
fi

awk -F ' ' '{n++;print n" "$2;}' $curdir/location.log | sort -k 2 > $curdir/sorted.log

awk -F ' ' '{
cmdDupe="mv "now"/pdkt_kusuma_"$1".jpg "now"/duplicate/duplicate_"b".jpg";
cmdKena="mv "now"/pdkt_kusuma_"$1".jpg "now"/kenangan/kenangan_"a".jpg";
if(i==$2){ system(cmdDupe);b++} else {system(cmdKena);a++}; i=$2;}' a="$kLast" b="$dLast" now=$curdir $curdir/sorted.log
cat $curdir/location.log >> $curdir/location.log.bak
cat $curdir/wget.log >> $curdir/wget.log.bak

if [ -f sorted.log ]
then
	rm $curdir/sorted.log
fi
``` 
Penjelasanya sebagai berikut
``` 
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
``` 
>#! /bin/bash pendekarasian bash interpreter
>pwd - print name of current/working directory
> -d mengecek apakah suatu direktori eksis
> mkdir - make directories
>
Pertama kami mendeklarasikan interpreter bash pada script ini menggunakna shebang #! /bin/bash.
Kemudian kami membuat variable untuk menyimpan path script untuk memudahkan penggunaaan absolute path. Kemudian kami mengecek directory *kenangan* ataupun *duplikat* jika direktori tersebut belum ada maka direktori tersebut akan dibuat menggunakan *mkdir*

``` 
if [ "$(ls -A $curdir/kenangan/)" ];
then
	kLast=$(ls $curdir/kenangan -l | cat | grep "kenangan" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	kLast=1
fi

if [ "$(ls -A $curdir/duplicate/)" ]; 
then
	dLast=$(ls $curdir/duplicate -l | cat | grep "duplicate" |awk -F ' |_' '{print $10}' | rev | cut -c5-|rev |sort -n | tail -1)
else
	dLast=1
fi
``` 
>ls - list directory contents
>> -A do not list implied. Return false if a directory empty
>> -l    use a long listing format.

>cat - concatenate files and print on the standard output

>grep, egrep, fgrep, rgrep - print lines matching a pattern

>awk -F untuk menjalankan script awk melalui terminal

>rev - reverse lines characterwise

>cut - remove sections from each line of files
>>-c select only these characters. Untuk menentukan jumlah karakter yang ingin di cut

>sort - sort lines of text files
>>-n compare according to string numerical value

>tail - output the last part of files

Block fungsi diatas untuk mengecek nomor file terakhir pada folder kenangan dan duplicate. Pertama kita cek dulu apakah folder kosong atau tidak jika tidak maka akan dicari file dengan nomor terakhir(terbesar) pada folder itu. Disini kita memanfaatkan fungsi ls -l untuk mendapatkan list isi pada direktori. Akan didapat hasil seperti contoh berikut
``` 
-rw-r--r-- 1 seijaku seijaku 24481 Feb 23 22:59 duplicate_1.jpg
-rw-r--r-- 1 seijaku seijaku 15902 Feb 26 07:05 duplicate_2.jpg
-rw-r--r-- 1 seijaku seijaku 24750 Feb 25 16:27 duplicate_3.jpg
-rw-r--r-- 1 seijaku seijaku 17727 Feb 25 23:08 duplicate_4.jpg
``` 
dari foutput itu kami menggunakan grep dan awk dan fungsi pendukung di atas untuk mendapatkan angka nya, meskipuncaranay tidak optimal. Number terbesar akan ditampung di varaible kLast dan dLast
``` 
awk -F ' ' '{n++;print n" "$2;}' $curdir/location.log | sort -k 2 > $curdir/sorted.log
``` 
>sort - sort lines of text files
>>-k sort via a key.  Key pada kolom ke 2 merupakan location asal file untuk melakukan sorting

Melalui command awk pertama kami menambahkan index *n* sebelum lokasi asal file. Hal ini dilakukan untuk menghubungkan alamat asal file dengan nomor yang ada pada nama file. Kemudian kami melakukan sorting menggunakan fungsi sort dengan key untuk disorting adalah key kedua yaitu alamat asal file( key satu adalah indeks yang sebelumnya dibuat oleh variable n) kemudian kami menyimpanya di sorted.log

```
awk -F ' ' '{

cmdDupe="mv "now"/pdkt_kusuma_"$1".jpg "now"/duplicate/duplicate_"b".jpg";
cmdKena="mv "now"/pdkt_kusuma_"$1".jpg "now"/kenangan/kenangan_"a".jpg";

if(i==$2){ system(cmdDupe);b++}
else {system(cmdKena);a++}; i=$2;}' a="$kLast" b="$dLast" now=$curdir $curdir/sorted.log

cat $curdir/location.log >> $curdir/location.log.bak
cat $curdir/wget.log >> $curdir/wget.log.bak
```
>system  - Pada block awk digunakan untuk memanggil perintah yang bisa dijalankan pada terminal

Kemudian kami melakukan mengecekan duplikat file. Cara pengecekan dilakukan dengan membandingkan kolom kedua. Pada sorted.log data kolom kedua telah diurutkan berdasarkan namanya. Jadi jika terdapat nama yang sama maka, file tersebut akan berada beururtan. Karena itu kami hanya perlu melakukan pengecekan terhadap row dibawahnya. Jika row dibawahnya memiliki asal yang sama dengan row sekarang maka file tersebut adalah duplikat dan harus dipindah ke folder duplikat, jika tidak sama berarti file bukan duplikat dan dipindah ke folder kenangan.
```
if [ -f sorted.log ]
then
	rm $curdir/sorted.log
fi
``` 
Kemudian terakhir kami meremove sorted.log



