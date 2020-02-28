#!/bin/bash

awk -F "\t" 'BEGIN {z=1;}

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
