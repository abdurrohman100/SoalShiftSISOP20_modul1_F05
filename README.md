# SoalShiftSISOP20_modul1_F5
Repository Praktikum Sisop 1

## Penjelasan Penyelesaian Soal
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
