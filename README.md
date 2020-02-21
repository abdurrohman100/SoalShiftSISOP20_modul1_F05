
# SoalShiftSISOP20_modul1_F5
Repository Praktikum Sisop 1

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
Kemudian dari set tersebut kita melakukan string manipulation dengan mengesktrak substring dari stirng yang ada menggunakan `${string:position:length}` . Lakukan tr untuk string capital maupun biasa. Hasil enkripsi nama file kemudian disimpan dalam variable `nemphrase`. Kemudian kita merename file dengan menggunakan perintah mv `mv $nama $newphrase.txt`.
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
Pada script dekripsi kit hanya perlu menukar posisi set pada fungsi tr.

