#!/bin/bash

#field 1: date (4-digit format)
#field 2: hour

cat $1_Dealer_schedule | awk '{print $1,$2,$5,$6}' |grep $2:00:00.*$3
