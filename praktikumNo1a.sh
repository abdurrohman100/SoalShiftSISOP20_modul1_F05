#!/bin/bash

awk -F "	" '{if($13 ~ "West"){totalProfitWest=totalProfitWest + $21};if($13 ~ "East"){totalProfitEast=totalProfitEast + $21};if($13 ~ "South"){totalProfitSouth=totalProfitSouth + $21};if($13 ~ "Central"){totalProfitCentral =totalProfitCentral + $21};}

END {profitmin=totalProfitWest;regionterendah="West"; if(profitmin>totalProfitEast){profitmin=totalProfitEast};if(profitmin>totalProfitSouth){profitmin=totalProfitSouth;regionterendah="South"};if(profitmin>totalProfitCentral){profitmin=totalProfitCentral;regionterendah="Central"};printf("Region dengan profit terendah = %s dengan profit sebesar %s\n",regionterendah,profitmin )}' Sample-Superstore.tsv
