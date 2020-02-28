#!/bin/bash


awk -F "\t" 'BEGIN {}

		   {
			if($11 ~ "Illinois" || $11 ~ "Texas"){b[$17]=b[$17]+$21;}
			}

		   END {
			 for (i in b){print i ";" b[i]}
			}' Sample-Superstore.tsv > Barang-di-Texas-dan-Illionis.tsv

sort -t';' -gk2 Barang-di-Texas-dan-Illionis.tsv | head -n 10 
rm Barang-di-Texas-dan-Illionis.tsv
