#1/bin/bash

#field 1: specific date
#field 2: specific time
#field 3: casino game played


game=$4

if [[ $game = 'BlackJack' ]]; then
cat $1_Dealer_schedule | awk '{print $1,$2,$3,$4}' | grep $2:00:00.*$3


elif [[ $game = 'Roulette' ]]; then
cat $1_Dealer_schedule | awk '{print $1,$2,$5,$6}' | grep $2:00:00.*$3

else
cat $1_Dealer_schedule | awk '{print $1,$2,$7,$8}' | grep $2:00:00.*$3

fi
