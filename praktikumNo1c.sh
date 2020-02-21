#!/bin/bash


awk -F "	" 'BEGIN {}

		   {if($11 ~ "Illionis" || $11 ~ "Texas"){
			print $17 ";" $21 > "Barang-di-Texas-dan-Illionis.tsv"
		   }}

		   END { }' Sample-Superstore.tsv

sort -t';' -gk2 Barang-di-Texas-dan-Illionis.tsv > sorted.tsv 
 awk -F  ";" '{print $1 $2}NR==10{exit}' sorted.tsv 
