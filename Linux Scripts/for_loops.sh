#!/bin/bash

numbers=$(echo {0..9})
for num in ${numbers[@]};
do
        if [$num -eq 3] || [$num -eq 5] || [$num -eq 7];
        then
                echo $num
        fi
done
